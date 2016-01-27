defmodule SynOSC.AutoVoicesOff do
  defstruct id: nil,
            milliseconds: 0
end

defimpl OSC.Encoder, for: SynOSC.AutoVoicesOff do
  use SynOSC

  def encode(%{milliseconds: milliseconds} = message, options) do
    message
    |> call("AUTOVOFF")
    |> set_arguments([milliseconds])
    |> OSC.Encoder.encode(options)
  end

  def flag(_), do: []
end
