defmodule SynOSC.Control.SetLoopRight do
  defstruct id: nil,
            relative: false,
            beats: nil,
            milliseconds: nil
end

defimpl OSC.Encoder, for: SynOSC.Control.SetLoopRight do
  use SynOSC

  def encode(message, options) do
    message
    |> call("LOOPR")
    |> set_arguments(format_arguments(message))
    |> OSC.Encoder.encode(options)
  end

  defp format_arguments(%{relative: relative, beats: beats}) when is_integer(beats) do
    [relative, true, beats]
  end
  defp format_arguments(%{relative: relative, milliseconds: milliseconds}) when is_integer(milliseconds) do
    [relative, false, milliseconds]
  end

  def flag(_), do: []
end
