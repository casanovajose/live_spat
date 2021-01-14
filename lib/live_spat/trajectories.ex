defmodule LiveSpat.Trajectories do
  @moduledoc """
  The Trajectories context.
  """

  import Ecto.Query, warn: false
  alias LiveSpat.Repo

  alias LiveSpat.Trajectories.Trajectory

  @doc """
  Returns the list of trajectories.

  ## Examples

      iex> list_trajectories()
      [%Trajectory{}, ...]

  """
  def list_trajectories do
    Repo.all(Trajectory)
  end

  @doc """
  Gets a single trajectory.

  Raises `Ecto.NoResultsError` if the Trajectory does not exist.

  ## Examples

      iex> get_trajectory!(123)
      %Trajectory{}

      iex> get_trajectory!(456)
      ** (Ecto.NoResultsError)

  """
  def get_trajectory!(id), do: Repo.get!(Trajectory, id)

  @doc """
  Creates a trajectory.

  ## Examples

      iex> create_trajectory(%{field: value})
      {:ok, %Trajectory{}}

      iex> create_trajectory(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_trajectory(attrs \\ %{}) do
    %Trajectory{}
    |> Trajectory.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a trajectory.

  ## Examples

      iex> update_trajectory(trajectory, %{field: new_value})
      {:ok, %Trajectory{}}

      iex> update_trajectory(trajectory, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_trajectory(%Trajectory{} = trajectory, attrs) do
    trajectory
    |> Trajectory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a trajectory.

  ## Examples

      iex> delete_trajectory(trajectory)
      {:ok, %Trajectory{}}

      iex> delete_trajectory(trajectory)
      {:error, %Ecto.Changeset{}}

  """
  def delete_trajectory(%Trajectory{} = trajectory) do
    Repo.delete(trajectory)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking trajectory changes.

  ## Examples

      iex> change_trajectory(trajectory)
      %Ecto.Changeset{data: %Trajectory{}}

  """
  def change_trajectory(%Trajectory{} = trajectory, attrs \\ %{}) do
    Trajectory.changeset(trajectory, attrs)
  end
end
