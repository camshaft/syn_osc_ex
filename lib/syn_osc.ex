defmodule SynOSC do
  defmacro __using__(_) do
    quote do
      import unquote(__MODULE__)
    end
  end

  def call(message, method) do
    %OSC.Message{address: format_address(message, method)}
  end

  def call_param(%{parameter: parameter} = message) when is_integer(parameter) or is_float(parameter) do
    call(message, "P#{parameter}")
  end
  def call_param(%{parameter: parameter} = message) when is_binary(parameter) do
    call(message, parameter)
  end

  def set_arguments(message, arguments) do
    %{message | arguments: arguments}
  end

  def format_address(%{id: id}, method) do
    format_address(id, method)
  end

  def format_address(id, method) when is_integer(id) or is_float(id) do
    format_address("ID#{id}", method)
  end
  def format_address(id, method) when is_binary(id) do
    "/SYN/#{id}/#{method}"
  end

  def format_value(%{relative: relative, value: value}) when is_integer(value) do
    [relative, value]
  end

  def format_pan(%{x: x, y: nil, z: nil}) when is_integer(x) do
    [x]
  end
  def format_pan(%{x: x, y: y, z: nil}) when is_integer(x) and is_integer(y) do
    [x, y]
  end
  def format_pan(%{x: x, y: y, z: z}) when is_integer(x) and is_integer(y) and is_integer(z) do
    [x, y, z]
  end

  def format_pitch(%{frequency: frequency}) when not is_nil(frequency) do
    [true, frequency]
  end
  def format_pitch(%{cents: cents}) when not is_nil(cents) do
    [false, cents]
  end
  def format_pitch(message) do
    throw {:missing_cents_or_frequency, message}
  end
end
