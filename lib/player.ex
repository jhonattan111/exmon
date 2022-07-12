defmodule Exmon.Player do
  @required_keys [:name, :life, :moves]
  @max_life 100

  @enforce_keys @required_keys
  defstruct @required_keys

  def build(name, move_rng, move_avg, move_heal) do
    %Exmon.Player{
      name: name,
      life: @max_life,
      moves: %{
        move_avg: move_avg,
        move_rng: move_rng,
        move_heal: move_heal,
      },
    }
  end
end
