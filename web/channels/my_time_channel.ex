defmodule ElmTime.MyTimeChannel do
  use ElmTime.Web, :channel

  def join("times:lobby", payload, socket) do
    if authorized?(payload) do

      # http://www.cultivatehq.com/posts/phoenix-elm-11/
      # Sending self() a message inside a channel results in a call to handle_info/2.
      send self(), :after_join
      send self(), :something_happened

      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def handle_info(:after_join, socket) do
    push socket, "the_time", %{the_time: "Welcome! "<>(inspect :calendar.local_time)}
    {:noreply, socket}
  end

  def handle_info(:something_happened, socket) do
    push socket, "the_time", %{the_time: (inspect :calendar.local_time)}
    Process.send_after(self, :something_happened, Enum.random(1..10) * 1000 )
    {:noreply, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (times:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # This is invoked every time a notification is being broadcast
  # to the client. The default implementation is just to push it
  # downstream but one could filter or change the event.
  def handle_out(event, payload, socket) do
    push socket, event, payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
