defmodule SynOSC.Voice.Volume do
  defstruct id: nil,
            voice: nil,
            relative: false,
            value: nil
end

defimpl OSC.Encoder, for: SynOSC.Voice.Volume do
  use SynOSC.Voice

  def encode(message, options) do
    message
    |> call("VOL")
    |> set_arguments(format_value(message))
    |> OSC.Encoder.encode(options)
  end

  def flag(_), do: []
end
