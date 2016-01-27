defmodule SynOSC.Control.Pattern do
  defstruct id: nil,
            enabled: true
end

defimpl OSC.Encoder, for: SynOSC.Control.Pattern do
  use SynOSC

  def encode(%{enabled: enabled} = message, options) do
    message
    |> call("PATTERN")
    |> set_arguments([enabled])
    |> OSC.Encoder.encode(options)
  end

  def flag(_), do: []
end
