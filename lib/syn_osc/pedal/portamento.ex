defmodule SynOSC.Pedal.Portamento do
  defstruct id: nil,
            enabled: true,
            relative: false,
            beats: nil,
            milliseconds: nil
end

defimpl OSC.Encoder, for: SynOSC.Pedal.Portamento do
  use SynOSC

  def encode(message, options) do
    message
    |> call("PORTAMENTO")
    |> set_arguments(format_arguments(message))
    |> OSC.Encoder.encode(options)
  end

  defp format_arguments(%{enabled: enabled} = message) do
    [enabled | format_length(message)]
  end

  defp format_length(%{relative: relative, beats: beats}) when is_integer(beats) do
    [relative, true, beats]
  end
  defp format_length(%{relative: relative, milliseconds: milliseconds}) when is_integer(milliseconds) do
    [relative, false, milliseconds]
  end

  def flag(_), do: []
end
