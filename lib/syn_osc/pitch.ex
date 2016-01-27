defmodule SynOSC.Pitch do
  defstruct id: nil,
            relative: false,
            cents: nil,
            frequency: nil
end

defimpl OSC.Encoder, for: SynOSC.Pitch do
  use SynOSC

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
