defmodule SynOSC.Base do
  defstruct id: nil,
            value: 440
end

defimpl OSC.Encoder, for: SynOSC.Base do
  use SynOSC

  def encode(%{value: value} = message, options) when is_integer(value) do
    message
    |> call("BASE")
    |> set_arguments([value])
    |> OSC.Encoder.encode(options)
  end

  def flag(_), do: []
end
