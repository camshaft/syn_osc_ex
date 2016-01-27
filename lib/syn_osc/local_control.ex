defmodule SynOSC.LocalControl do
  defstruct id: nil,
            enabled: true
end

defimpl OSC.Encoder, for: SynOSC.LocalControl do
  use SynOSC

  def encode(%{enabled: enabled} = message, options) do
    message
    |> call("LOCALCONTR")
    |> set_arguments([enabled])
    |> OSC.Encoder.encode(options)
  end

  def flag(_), do: []
end
