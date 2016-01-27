defmodule SynOSC.Control.Loop do
  defstruct id: nil,
            enabled: true
end

defimpl OSC.Encoder, for: SynOSC.Control.Loop do
  use SynOSC

  def encode(%{enabled: enabled} = message, options) do
    message
    |> call("LOOP")
    |> set_arguments([enabled])
    |> OSC.Encoder.encode(options)
  end

  def flag(_), do: []
end
