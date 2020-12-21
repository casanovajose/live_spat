defmodule LiveSpatWeb.HomeLive do
  use LiveSpatWeb, :live_view

  @alphabet "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz+-_1234567890"

  def mount(_params, _session, socket) do
    {:ok, assign(socket, session_id: random_session_string())}
  end

  def random_session_string(alphabet \\ @alphabet, length \\ 8) do
    alphabet = String.split(alphabet, "", trim: true)
    (1..length)
    |> Enum.reduce([], fn(_, acc) -> [Enum.random(alphabet) | acc] end)
    |> Enum.join("")
  end

  def validate_session_string do

  end
end
