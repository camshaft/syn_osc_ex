defmodule SynOSC.ResetAllParameters do
  defstruct id: nil
end

defimpl OSC.Encoder, for: SynOSC.ResetAllParameters do
  use SynOSC

  def encode(message, options) do
    message
    |> call("RESETALLP")
    |> OSC.Encoder.encode(options)
  end

  def flag(_), do: []
end
