defmodule SynOSC.Tuning do
  defstruct id: nil,
            relative: false,
            frequency: nil,
            cents: nil,
            microtonal_map: nil
end

defimpl OSC.Encoder, for: SynOSC.Tuning do
  use SynOSC

  def encode(message, options) do
    message
    |> call("TUNING")
    |> set_arguments(format_arguments(message))
    |> OSC.Encoder.encode(options)
  end

  # TODO support the microtonal mapping format
  defp format_arguments(%{relative: relative} = message) do
    [relative | format_pitch(message)]
  end

  def flag(_), do: []
end
