defmodule Exmon.Game.Status do
  alias Exmon.Game
  def print_round_message() do
    IO.puts("\nO jogo foi iniciado\n")
    IO.inspect(Game.info())
    IO.puts("--------------------------------------")
  end

  def print_move_message({:error, move}) do
    IO.puts("\n === INVALID MOVE === \n")
  end

  def print_move_message({:ok, move}) do
    IO.puts("\n === IS A VALID MOVE === \n")
  end
end
