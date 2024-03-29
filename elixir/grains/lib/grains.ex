defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: {atom, pos_integer | String.t()}
  def square(number) when number > 0 and number < 65 do
    {:ok, do_square(number)}
  end

  def square(_number) do
    {:error, "The requested square must be between 1 and 64 (inclusive)"}
  end

  defp do_square(1), do: 1

  defp do_square(number) do
    2..number
    |> Enum.reduce(1, fn _item, acc -> acc * 2 end)
  end

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: {atom, pos_integer}
  def total do
    result =
      1..64
      |> Enum.reduce(0, &(&2 + do_square(&1)))

    {:ok, result}
  end
end
