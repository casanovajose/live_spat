defmodule LiveSpatWeb.PageLive do
  use LiveSpatWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    traj = []
    socket =
      socket
      |> assign(point: %{x: 128, y: 128}, color: "#f00")
      |> assign(traj: traj)
      |> assign(path: traj_to_path(traj))

    {:ok, socket}
  end

  @impl true
  def handle_event("move_live_point", %{"offsetX" => x, "offsetY" => y } = _mouse_point, socket) do
    socket = assign(socket, :point, %{x: x, y: y})
    {:noreply, socket}
  end

  @impl true
  def handle_event("add_traj_point", %{"offsetX" => x, "offsetY" => y } = _mouse_point, socket) do
    socket =
      socket
      |> add_point(x, y)
      |> assign(path: traj_to_path(socket.assigns.traj))

    {:noreply, socket}
  end

  defp traj_to_path(trajectory) do
    trajectory
    |> Enum.map(fn t -> "#{t.x}, #{t.y} " end)
    |> List.to_string()
  end

  defp add_point(socket, x, y) do
    # TODO these validations should be configurables
    socket =
    with true <- Enum.count(socket.assigns.traj) < 256,
        %{x: x1, y: y1} <- List.last(socket.assigns.traj),
        true <- abs(x1 - x) > 2 || abs(y1 - y) > 2 do
          update(socket, :traj, fn t -> t ++ [%{x: x, y: y}] end)
    else
      nil -> assign(socket, traj: [%{x: x, y: y}])
      _ -> socket
    end
    # IO.inspect(Enum.count(socket.assigns.traj))
    socket
  end
end
