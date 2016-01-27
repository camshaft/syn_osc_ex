defmodule SynOSC.Pan do
  defstruct id: nil,
            relative: false,
            x: nil,
            y: nil,
            z: nil
end

defimpl OSC.Encoder, for: SynOSC.Pan do
  use SynOSC

  def encode(message, options) do
    message
    |> call("PAN")
    |> set_arguments(format_arguments(message))
    |> OSC.Encoder.encode(options)
  end

  defp format_arguments(%{relative: relative} = message) do
    [relative | format_pan(message)]
  end

  def flag(_), do: []
end
