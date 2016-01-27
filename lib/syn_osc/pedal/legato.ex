defmodule SynOSC.Pedal.Legato do
  defstruct id: nil,
            tie_voices: false,
            relative: false,
            beats: nil,
            milliseconds: nil
end

defimpl OSC.Encoder, for: SynOSC.Pedal.Legato do
  use SynOSC

  def encode(message, options) do
    message
    |> call("LEGATO")
    |> set_arguments(format_arguments(message))
    |> OSC.Encoder.encode(options)
  end

  defp format_arguments(%{tie_voices: tie_voices} = message) do
    [tie_voices | format_length(message)]
  end

  defp format_length(%{relative: relative, beats: beats}) when is_integer(beats) do
    [relative, true, beats]
  end
  defp format_length(%{relative: relative, milliseconds: milliseconds}) when is_integer(milliseconds) do
    [relative, false, milliseconds]
  end

  def flag(_), do: []
end
