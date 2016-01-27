defmodule SynOSC.Voice.On do
  defstruct id: nil,
            voice: nil,
            release: true,
            relative: false,
            frequency: nil,
            note: nil,
            relative_velocity: false,
            velocity: nil
end

defimpl OSC.Encoder, for: SynOSC.Voice.On do
  use SynOSC.Voice

  def encode(message, options) do
    message
    |> call("ON")
    |> set_arguments(format_arguments(message))
    |> OSC.Encoder.encode(options)
  end

  defp format_arguments(%{release: release, relative: relative} = message) do
    [release, relative | format_note(message)]
  end

  defp format_note(%{frequency: frequency} = message) when not is_nil(frequency) do
    [false, frequency | format_velocity(message)]
  end
  defp format_note(%{note: note} = message) when not is_nil(note) do
    [true, note | format_velocity(message)]
  end
  defp format_note(message) do
    throw {:missing_note_or_frequency, message}
  end

  def flag(_), do: []
end
