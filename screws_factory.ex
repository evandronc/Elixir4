defmodule ScrewsFactory do
  def run(pieces) do
    ##Using Enum.map, slower,
    # pieces
    # |> Enum.map(&add_thread/1)
    # |> Enum.map(&add_head/1)
    # |> Enum.each(&output/1)

    ##Using Stream.map, faster, processing units
    # pieces
    # |> Stream.map(&add_thread/1)
    # |> Stream.map(&add_head/1)
    # |> Enum.each(&output/1)

    ##Using Stream.chunk, even faster, processing blocks
    Stream.flat
    pieces

    ##chunk_every cria grupos de listas dentro do enumerable separando em blocos. Ver help.
    |> Stream.chunk_every(50)
    ##flat_map é um agrupador. Ex:
    ##iex> Enum.flat_map([[1, 2], [3, 4], [5, 6]], &(&1))
    ##iex> [1, 2, 3, 4, 5, 6]
    |> Stream.flat_map(&add_thread/1)
    |> Stream.chunk_every(100)
    |> Stream.flat_map(&add_head/1)
    |> Enum.each(&output/1)
  end
Enum.each(Stream.chunk_every(metal_pieces,50), &IO.puts/1)
Enum.each(metal_pieces, &IO.puts/1)
  # defp add_thread(piece) do
  #   Process.sleep(50)
  #   piece <> "--"
  # end
  # defp add_head(piece) do
  #   Process.sleep(100)
  #   "o" <> piece
  # end

  ##Implementation for block processing
  defp add_thread(pieces) do
    Process.sleep(50)
    Enum.map(pieces, &(&1 <> "--"))
  end
  defp add_head(pieces) do
    Process.sleep(100)
    Enum.map(pieces, &("o" <> &1))
  end
  defp output(screw) do
    IO.inspect(screw)
  end
end

##iEX
#c("screws_factory.ex")
##Stream.cycle é o iterate da string
#metal_pieces = Enum.take(Stream.cycle(["-"]), 1000)
#ScrewsFactory.run(metal_pieces)

# #Cria enumerable infinito
# iex> integers = Stream.iterate(1, fn previous -> previous + 1 end)
# #Cria um novo enumerable pegando os 5 primeiros elementos do Enum integers
# iex> Enum.take(integers, 5)
# #Executa a função do segundo argumento em todos itens do enumerable.
# iex> Enum.reduce([5,4,3,2,1], &(&1*&2))
