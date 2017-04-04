defmodule Kptboard.RetrospectiveChannel do
  use Kptboard.Web, :channel
  alias Kptboard.{Retrospective, RetrospectiveSerializer, Label}

  def join("retrospective:lobby", payload, socket) do
    if authorized?(payload) do
      retrospective =
        Repo.get(Retrospective, payload["id"])

      if retrospective do
        {:ok, RetrospectiveSerializer.serialize(retrospective), socket}
      else
        {:error, %{reason: "not found"}}
      end
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
  # broadcast to everyone in the current topic (retrospective:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
