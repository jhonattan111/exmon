defmodule Exmon.Game.Actions.Attack do
  alias Exmon.Game

  @move_avg_pwr 18..25
  @move_rn_pwr 10..35

  def attack_opponent(opponent, move) do
    damage = calculate_pwr(move)

    opponent
    |> Game.fetch_player()
    |> Map.get(:life)
    |> calculate_total_life(damage)
    |> update_opponent_life(opponent)
  end

  defp calculate_pwr(:move_avg), do: Enum.random(@move_avg_pwr)
  defp calculate_pwr(:move_rng), do: Enum.random(@move_rn_pwr)

  defp calculate_total_life(life, damage) when life - damage < 0, do: 0
  defp calculate_total_life(life, damage), do: life - damage

  defp update_opponent_life(life, opponent) do
    opponent
    |> Game.fetch_player()
    |> Map.put(:life, life)
    |> update_game(opponent)
  end

  defp update_game(player, opponent) do
    Game.info()
    |> Map.put(opponent, player)
    |> Game.update()
  end
end
