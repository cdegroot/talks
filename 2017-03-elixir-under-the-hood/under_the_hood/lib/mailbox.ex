defmodule Mailbox do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  # GenServer callbacks

  def init(args) do
    {:ok, []}
  end

  def handle_cast(:something, state) do
    IO.puts("Got something!")
    {:noreply, state}
  end

  def handle_info(:else, state) do
    IO.puts("Got else")
    {:noreply, state}
  end
end
