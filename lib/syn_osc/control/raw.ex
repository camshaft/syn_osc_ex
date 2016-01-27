defmodule SynOSC.Control.Raw do
  defstruct id: nil,
            value: nil
end

defimpl OSC.Encoder, for: SynOSC.Control.Raw do
  use SynOSC

  def encode(message, options) do
    message
    |> call("RAW")
    |> set_arguments(format_value(message))
    |> OSC.Encoder.encode(options)
  end

  def flag(_), do: []
end
