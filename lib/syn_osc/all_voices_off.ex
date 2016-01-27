defmodule SynOSC.AllVoicesOff do
  defstruct id: nil
end

defimpl OSC.Encoder, for: SynOSC.AllVoicesOff do
  use SynOSC

  def encode(message, options) do
    message
    |> call("ALLVOFF")
    |> OSC.Encoder.encode(options)
  end

  def flag(_), do: []
end
