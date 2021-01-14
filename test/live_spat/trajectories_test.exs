defmodule LiveSpat.TrajectoriesTest do
  use LiveSpat.DataCase

  alias LiveSpat.Trajectories

  describe "trajectories" do
    alias LiveSpat.Trajectories.Trajectory

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def trajectory_fixture(attrs \\ %{}) do
      {:ok, trajectory} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Trajectories.create_trajectory()

      trajectory
    end

    test "list_trajectories/0 returns all trajectories" do
      trajectory = trajectory_fixture()
      assert Trajectories.list_trajectories() == [trajectory]
    end

    test "get_trajectory!/1 returns the trajectory with given id" do
      trajectory = trajectory_fixture()
      assert Trajectories.get_trajectory!(trajectory.id) == trajectory
    end

    test "create_trajectory/1 with valid data creates a trajectory" do
      assert {:ok, %Trajectory{} = trajectory} = Trajectories.create_trajectory(@valid_attrs)
    end

    test "create_trajectory/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trajectories.create_trajectory(@invalid_attrs)
    end

    test "update_trajectory/2 with valid data updates the trajectory" do
      trajectory = trajectory_fixture()
      assert {:ok, %Trajectory{} = trajectory} = Trajectories.update_trajectory(trajectory, @update_attrs)
    end

    test "update_trajectory/2 with invalid data returns error changeset" do
      trajectory = trajectory_fixture()
      assert {:error, %Ecto.Changeset{}} = Trajectories.update_trajectory(trajectory, @invalid_attrs)
      assert trajectory == Trajectories.get_trajectory!(trajectory.id)
    end

    test "delete_trajectory/1 deletes the trajectory" do
      trajectory = trajectory_fixture()
      assert {:ok, %Trajectory{}} = Trajectories.delete_trajectory(trajectory)
      assert_raise Ecto.NoResultsError, fn -> Trajectories.get_trajectory!(trajectory.id) end
    end

    test "change_trajectory/1 returns a trajectory changeset" do
      trajectory = trajectory_fixture()
      assert %Ecto.Changeset{} = Trajectories.change_trajectory(trajectory)
    end
  end
end
