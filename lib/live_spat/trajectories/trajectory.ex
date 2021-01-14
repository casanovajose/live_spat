defmodule LiveSpat.Trajectories.Trajectory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trajectories" do
    field :session, :string, size: 20
    field :name, :string, size: 20
    field :slug, :string, size: 20
    embeds_one :coords, LiveSpat.Trajectories.Coords
    timestamps()
  end



  @doc false
  def changeset(trajectory, attrs) do
    trajectory
    |> cast(attrs, [])
    |> validate_required([])
  end
end

defmodule LiveSpat.Trajectories.Coords do
  use Ecto.Schema
  embedded_schema  do
    field :x, :integer
    field :y, :integer
    field :r, :integer
    field :t, :integer
  end
end
