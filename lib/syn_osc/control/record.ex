defmodule SynOSC.Control.Record do
  defstruct id: nil,
            enabled: true
end

defimpl OSC.Encoder, for: SynOSC.Control.Record do
  use SynOSC

  def encode(%{enabled: enabled} = message, options) do
    message
    |> call("RECORD")
    |> set_arguments([enabled])
    |> OSC.Encoder.encode(options)
  end

  def flag(_), do: []
end
