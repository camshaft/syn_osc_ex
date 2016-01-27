defmodule SynOSC.Voice.Off do
  defstruct id: nil,
            voice: nil,
            relative_velocity: false,
            velocity: nil
end

defimpl OSC.Encoder, for: SynOSC.Voice.Off do
  use SynOSC.Voice

  def encode(message, options) do
    message
    |> call("OFF")
    |> set_arguments(format_velocity(message))
    |> OSC.Encoder.encode(options)
  end

  def flag(_), do: []
end
