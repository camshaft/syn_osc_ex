defmodule SynOSC.Pedal.Sustain do
  defstruct id: nil,
            relative: false,
            value: nil
end

defimpl OSC.Encoder, for: SynOSC.Pedal.Sustain do
  use SynOSC

  def encode(message, options) do
    message
    |> call("SUSTAIN")
    |> set_arguments(format_value(message))
    |> OSC.Encoder.encode(options)
  end

  def flag(_), do: []
end
