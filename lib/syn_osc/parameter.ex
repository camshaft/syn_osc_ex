defmodule SynOSC.Parameter do
  defstruct id: nil,
            parameter: nil,
            relative: false,
            value: nil
end

defimpl OSC.Encoder, for: SynOSC.Parameter do
  use SynOSC

  def encode(message, options) do
    message
    |> call_param()
    |> set_arguments(format_value(message))
    |> OSC.Encoder.encode(options)
  end

  def flag(_), do: []
end
