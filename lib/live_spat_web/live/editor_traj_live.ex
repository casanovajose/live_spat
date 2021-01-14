defmodule LiveSpatWeb.EditorTrajLive do
  use LiveSpatWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(traj: [])
      |> assign(path: traj_to_path([]))
      |> assign(markers: [])

    {:ok, socket}
  end

  @impl true
  def handle_event("add_traj_point", %{"offsetX" => x, "offsetY" => y } = _mouse_point, socket) do
    socket =
      socket
      |> add_point(x, y)
      |> assign(path: traj_to_path(socket.assigns.traj))
      |> assign(markers: Enum.take_every(socket.assigns.traj, 10))

    {:noreply, socket}
  end

  @impl true
  def handle_event("clear_traj", _params, socket) do
    socket =
      socket
      |> assign(traj: [])
      |> assign(path: traj_to_path([]))
      |> assign(markers: [])
    {:noreply,socket}
  end

  def handle_event("save", _params, socket) do

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
        true <- abs(x1 - x) > 1 || abs(y1 - y) > 1 do
          update(socket, :traj, fn t -> t ++ [%{x: x, y: y}] end)
    else
      nil -> assign(socket, traj: [%{x: x, y: y}])
      _ -> socket
    end
    # IO.inspect(Enum.count(socket.assigns.traj))
    socket
  end
end
