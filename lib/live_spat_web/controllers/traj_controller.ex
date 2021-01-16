defmodule LiveSpatWeb.TrajController do
  use LiveSpatWeb, :controller
  alias LiveSpat.Trajectories.Trajectory
  alias LiveSpat.Repo

  def download(conn, %{"session" => session, "name" => name}) do
    %Trajectory{coords: coords} = Repo.get_by(Trajectory, %{session: session, name: name})

    content =
      coords
      |> Enum.map(&join_cords/1)
      |> Enum.join("\n")

    #IO.inspect(content)
    conn
      |> send_resp(200, content)
  end

  def download_test(conn, _params) do
    #send_file(conn, 200, "priv/static/test.traj")
    path = Application.app_dir(:live_spat, "priv/static/test.traj")
    send_download(conn, {:file, path})
  end

  defp join_cords(%{x: x, y: y, r: r, t: t}) do
    "#{x} #{y} #{r} #{t}"
  end
end
