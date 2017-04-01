defmodule Kptboard.LabelChannel do
  use Kptboard.Web, :channel

  def join("label:lobby", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (label:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end

  def handle_in("create", payload, socket) do
    broadcast socket, "create", payload
    {:noreply, socket}
  end

  def handle_in("destroy", payload, socket) do
    broadcast socket, "destroy", payload
    {:noreply, socket}
  end

  def handle_in("update", payload, socket) do
    broadcast socket, "update", payload
    {:noreply, socket}
  end

  def handle_in("position", payload, socket) do
    broadcast socket, "position", payload
    {:noreply, socket}
  end
end
