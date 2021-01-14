defmodule LiveSpatWeb.TrajController do
  use LiveSpatWeb, :controller

  def download_traj_file(conn, %{"filename" => filename}) do

  end

  def download_test(conn, _params) do
    #send_file(conn, 200, "priv/static/test.traj")
    path = Application.app_dir(:live_spat, "priv/static/test.traj")
    send_download(conn, {:file, path})
  end

end
