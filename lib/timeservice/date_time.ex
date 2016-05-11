defmodule DateTime do
  @derive [Poison.Encoder]
  defstruct [:year, :month, :day, :hour, :minutes, :seconds]
end
