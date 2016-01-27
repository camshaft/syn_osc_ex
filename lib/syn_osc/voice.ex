defmodule SynOSC.Voice do
  defmacro __using__(_) do
    quote do
      import unquote(__MODULE__)
      import SynOSC, except: [call: 2]
    end
  end

  def call(message, method) do
    %OSC.Message{address: format_address(message, method)}
  end

  def format_address(%{id: id, voice: voice}, method) do
    format_address(id, voice, method)
  end

  def format_address(id, voice, method) when is_integer(id) or is_float(id) do
    format_address("ID#{id}", voice, method)
  end
  def format_address(id, voice, method) when is_integer(voice) or is_float(voice) do
    format_address(id, "V#{voice}", method)
  end
  def format_address(id, voice, method) when is_binary(id) and is_binary(voice) do
    "/SYN/#{id}/#{voice}/#{method}"
  end

  def format_velocity(%{velocity: nil}) do
    []
  end
  def format_velocity(%{relative_velocity: relative_velocity, velocity: velocity}) do
    [relative_velocity, velocity]
  end
end
