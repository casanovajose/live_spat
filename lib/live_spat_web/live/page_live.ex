defmodule LiveSpatWeb.PageLive do
  use LiveSpatWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    traj = [
      %{x: 10, y: 20},
      %{x: 22, y: 30},
      %{x: 40, y: 50},
      %{x: 60, y: 80},
    ]
    socket =
      socket
      |> assign(point: %{x: 128, y: 128}, color: "#f00")
      |> assign(traj: traj)
      |> assign(path: traj_to_path(traj))

    {:ok, socket}
  end

  @impl true
  def handle_event("move_live_point", %{"offsetX" => x, "offsetY" => y } = mouse_point, socket) do
    socket = assign(socket, :point, %{x: x, y: y})
    # IO.inspect(mouse_point)
    {:noreply, socket}
  end

  @impl true
  def handle_event("add_traj_point", %{"offsetX" => x, "offsetY" => y } = mouse_point, socket) do
    #IO.inspect("HEY")
    socket =
      socket
      |> update(:traj, fn t -> t ++ [%{x: x, y: y}] end)
      |> assign(path: traj_to_path(socket.assigns.traj))
    # IO.inspect(mouse_point)
    {:noreply, socket}
  end

  defp traj_to_path(trajectory) do
    trajectory
    |> Enum.map(fn t -> "#{t.x}, #{t.y} " end)
    |> List.to_string()
  end
end
