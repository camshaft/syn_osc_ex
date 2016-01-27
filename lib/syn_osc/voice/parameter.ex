defmodule SynOSC.Voice.Parameter do
  defstruct id: nil,
            voice: nil,
            parameter: nil,
            relative: false,
            value: nil
end

defimpl OSC.Encoder, for: SynOSC.Voice.Parameter do
  use SynOSC.Voice

  def encode(message, options) do
    message
    |> call_param()
    |> set_arguments(format_value(message))
    |> OSC.Encoder.encode(options)
  end

  def flag(_), do: []
end
