defmodule Exmon do
  alias Exmon.{Player, Game}
  alias Exmon.Game.{Actions, Status}

  def create_player(name, move_avg, move_rnd, move_heal) do
    Player.build(name, move_avg, move_rnd, move_heal)
  end

  def start_game(player) do
    "robot"
    |>create_player(:punch, :kick, :heal)
    |> Game.start(player)

    Status.print_round_message()
  end

  def make_move(move) do
    move
    |> Actions.fetch_move()
    |> do_move()
  end

  defp do_move({:error, move}), do: Status.print_move_message({:error, move})

  defp do_move({:ok, move}) do
    case move do
      :move_heal -> "curinha"
      move -> Actions.attack(move)
    end
  end
end
