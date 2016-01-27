defmodule SynOSC.Voice.Pitch do
  defstruct id: nil,
            voice: nil,
            relative: false,
            cents: nil,
            frequency: nil
end

defimpl OSC.Encoder, for: SynOSC.Voice.Pitch do
  use SynOSC.Voice

  def encode(message, options) do
    message
    |> call("PITCH")
    |> set_arguments(format_arguments(message))
    |> OSC.Encoder.encode(options)
  end

  defp format_arguments(%{relative: relative} = message) do
    [relative | format_pitch(message)]
  end

  def flag(_), do: []
end
