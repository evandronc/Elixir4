defmodule MyList do

  # Primeiro Exercício
  def each([], _function), do: nil
  def each([head | tail], function) do
    function.(head)
    each(tail, function)
  end

  # Segundo Exercício
  # iex> increase_price = fn item -> update_in(item.price, &(&1 * 1.1)) end
  # iex> MyList.map(enchanted_items, increase_price)

  # iex> MyList.map(items, &String.capitalize/1)
  # iex> MyList.map(items, &String.upcase/1)
  # iex> MyList.map(["45.50", "32.12", "86.0"], &String.to_float/1)

  def map([], _function), do: []
  def map([head | tail], function) do
    [function.(head) | map(tail, function)]
  end

  # Terceiro Exercício
  # iex> MyList.reduce([10, 5, 5, 10], 0, &+/2)
  # iex> MyList.reduce([5, 4, 3, 2, 1], 1, &*/2)
  # iex> MyList.reduce([100, 20, 400, 200], 100, &max/2)
  # iex> MyList.reduce([100,20, 400, 200], 100, &min/2)
  def reduce([], acc, _function), do: acc
  def reduce([head | tail], acc, function) do
    reduce(tail, function.(head, acc), function)
  end

  # Quarto Exercício
  # iex> MyList.filter(enchanted_items, fn item -> item.price < 70 end)
  # iex> MyList.filter(["a", "b", "c", "d"], &(&1 > "b"))
  # iex> MyList.filter([100, 200, 300, 400], &(&1 < 300))
  # iex> MyList.filter(["Alex", "Mike", "Ana"], &String.starts_with?(&1, "A"))
  # iex> MyList.filter(["a@b", "t.t", "a@b.c"], &String.contains?(&1, "@"))
  def filter([], _function), do: []
  def filter([head | tail], function) do
    if function.(head) do
      [head | filter(tail, function)]
    else filter(tail, function)
    end
  end

end
