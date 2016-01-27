defmodule SynOSC.SystemReset do
  defstruct id: nil
end

defimpl OSC.Encoder, for: SynOSC.SystemReset do
  use SynOSC

  def encode(message, options) do
    message
    |> call("SYSTEMRESET")
    |> OSC.Encoder.encode(options)
  end

  def flag(_), do: []
end
