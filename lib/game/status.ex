defmodule Exmon.Game.Status do
  def print_round_message(%{status: :started} = info) do
    IO.puts("\nO jogo foi iniciado\n")
    IO.inspect(info)
    IO.puts("--------------------------------------")
  end

  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("\nÉ a vez do #{player}\n")
    IO.inspect(info)
    IO.puts("--------------------------------------")
  end

  def print_round_message(%{status: :game_over} = info) do
    IO.puts("\nGame over\n")
    IO.inspect(info)
    IO.puts("--------------------------------------")
  end

  def print_wrong_move_message(move) do
    IO.puts("\n ======== Movimento inválido: #{move} ========")
  end

  @spec print_move_message(any, :attack | :heal, any) :: :ok
  def print_move_message(:computer, :attack, damage) do
    IO.puts("\n ======== O jogador atacou o computador causando #{damage} de dano ======== \n")
  end

  def print_move_message(:player, :attack, damage) do
    IO.puts("\n ======== O computador atacou o jogador causando #{damage} de dano ======== \n")
  end

  def print_move_message(player, :heal, life) do
    IO.puts("\n ======== O jogador #{player} se curou em #{life} pontos ======== \n")
  end
end
