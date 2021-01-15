defmodule LiveSpat.Trajectories.Trajectory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trajectories" do
    field :session, :string, size: 20
    field :name, :string, size: 20
    field :slug, :string, size: 20
    embeds_many :coords, LiveSpat.Trajectories.Coords
    timestamps()
  end



  @doc false
  def changeset(trajectory, attrs) do
    trajectory
    |> cast(attrs, [:name])
    |> cast_embed(:coords)
    |> validate_required([:name])
  end
end

defmodule LiveSpat.Trajectories.Coords do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema  do
    field :x, :integer
    field :y, :integer
    field :r, :integer
    field :t, :integer
  end

  def changeset(coords, attrs) do
    coords
    |> cast(attrs, [:x, :y])
  end
end
