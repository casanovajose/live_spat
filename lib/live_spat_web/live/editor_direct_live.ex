defmodule LiveSpatWeb.EditorDirectLive do
  use LiveSpatWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(point: %{x: 128, y: 128}, color: "#f00")
    {:ok, socket}
  end

  @impl true
  def handle_event("move_live_point", %{"offsetX" => x, "offsetY" => y } = _mouse_point, socket) do
    socket = assign(socket, :point, %{x: x, y: y})
    {:noreply, socket}
  end
end
