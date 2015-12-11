defmodule Champions.Repo.Migrations.CreateChampion do
  use Ecto.Migration

  def change do
    create table(:champions) do
      add :str, :integer
      add :agi, :integer
      add :int, :integer
      add :cha, :integer
      add :sta, :integer
      add :wis, :integer

      timestamps
    end

  end
end
