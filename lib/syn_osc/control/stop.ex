defmodule SynOSC.Control.Stop do
  defstruct id: nil
end

defimpl OSC.Encoder, for: SynOSC.Control.Stop do
  use SynOSC

  def encode(message, options) do
    message
    |> call("STOP")
    |> OSC.Encoder.encode(options)
  end

  def flag(_), do: []
end
