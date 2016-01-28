defmodule SynOSC.Control.Raw do
  defstruct id: nil,
            value: nil
end

defimpl OSC.Encoder, for: SynOSC.Control.Raw do
  use SynOSC

  def encode(%{value: value} = message, options) do
    message
    |> call("RAW")
    |> set_arguments([value])
    |> OSC.Encoder.encode(options)
  end

  def flag(_), do: []
end
