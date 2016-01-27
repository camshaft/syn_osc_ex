defmodule SynOSC.SendControl do
  defstruct id: nil,
            enabled: true
end

defimpl OSC.Encoder, for: SynOSC.SendControl do
  use SynOSC

  def encode(%{enabled: enabled} = message, options) do
    message
    |> call("SENDCONTR")
    |> set_arguments([enabled])
    |> OSC.Encoder.encode(options)
  end

  def flag(_), do: []
end
