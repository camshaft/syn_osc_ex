defmodule SynOSC.TestCase do
  defmacro __using__(opts) do
    quote do
      use ExUnit.Case, unquote(opts)
      import unquote(__MODULE__)
    end
  end
  use ExCheck
end

ExUnit.start()
