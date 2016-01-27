defmodule SynOSC.ActiveSensing do
  defstruct id: nil,
            milliseconds: 0
end

defimpl OSC.Encoder, for: SynOSC.ActiveSensing do
  use SynOSC

  def encode(%{milliseconds: milliseconds} = message, options) do
    message
    |> call("ACTIVESENS")
    |> set_arguments([milliseconds])
    |> OSC.Encoder.encode(options)
  end

  def flag(_), do: []
end
