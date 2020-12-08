defmodule LiveSpatWeb.PageLive do
  use LiveSpatWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, point: %{x: 130, y: 130}, color: "#f00")}
  end

  @impl true
  def handle_event("MouseDown", %{"offsetX" => x, "offsetY" => y } = mouse_point, socket) do
    socket = assign(socket, :point, %{x: x, y: y})
    # IO.inspect(mouse_point)
    {:noreply, socket}
  end
end
