defmodule Champions.Repo.Migrations.CreateBattle do
  use Ecto.Migration

  def change do
    create table(:battles) do
      add :title, :string
      add :description, :string
      add :attacker_id, references(:champions)
      add :defender_id, references(:champions)
      add :victor_id, references(:champions)

      timestamps
    end
    create index(:battles, [:attacker_id])
    create index(:battles, [:defender_id])
    create index(:battles, [:victor_id])

  end
end
