defmodule SynOSC.Control.Continue do
  defstruct id: nil
end

defimpl OSC.Encoder, for: SynOSC.Control.Continue do
  use SynOSC

  def encode(message, options) do
    message
    |> call("CONTINUE")
    |> OSC.Encoder.encode(options)
  end

  def flag(_), do: []
end
