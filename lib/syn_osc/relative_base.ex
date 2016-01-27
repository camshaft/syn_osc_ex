defmodule SynOSC.RelativeBase do
  defstruct id: nil,
            cents: nil,
            numerator: nil,
            denominator: nil
end

defimpl OSC.Encoder, for: SynOSC.RelativeBase do
  use SynOSC

  def encode(message, options) do
    message
    |> call("BASE")
    |> set_arguments(format_base(message))
    |> OSC.Encoder.encode(options)
  end

  defp format_base(%{cents: cents}) when is_integer(cents) do
    [false, cents]
  end
  defp format_base(%{numerator: numerator, denominator: denominator}) when is_integer(numerator) and is_integer(denominator) do
    [true, numerator, denominator]
  end
  defp format_base(message) do
    throw {:missing_cents_or_ratio, message}
  end

  def flag(_), do: []
end
