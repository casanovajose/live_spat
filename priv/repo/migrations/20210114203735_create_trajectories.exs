defmodule LiveSpat.Repo.Migrations.CreateTrajectories do
  use Ecto.Migration

  def change do
    create table(:trajectories) do
      add :session, :string, size: 20
      add :name, :string, size: 20
      add :slug, :string, size: 20
      add :coords, {:array, :map}, default: []

      timestamps()
    end

  end
end
