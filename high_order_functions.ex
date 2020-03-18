# Primeiro exercício
# Sem Pipe
# iex> import HighOrderFunctions
# iex> first_letter_and_upcase = compose(&String.upcase/1, &String.first/1)
# iex> first_letter_and_upcase.("works")

# Com Pipe
# iex> first_letter_and_upcase = &(&1 |> String.first |> String.upcase)
# iex> first_letter_and_upcase.("works")

defmodule HigherOrderFunctions do
  def compose(f, g) do
    fn arg -> f.(g.(arg)) end
  end
end
