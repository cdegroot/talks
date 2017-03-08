defmodule UnderTheHood do
  @moduledoc false

  @world Application.get_env(:under_the_hood, :world)

  use Application

  def hello_config do
    Application.get_env(:under_the_hood, :world)
  end

  def hello_module do
    @world
  end

  def start(_, _) do
    IO.puts("Hello before put: #{Application.get_env(:under_the_hood, :world)}")
    Application.put_env(:under_the_hood, :world, "go go go!")
    IO.puts("Hello_config: #{hello_config()}")
    IO.puts("Hello_module: #{hello_module()}")
    {:ok, self()}
  end

  def decompile(env) do
    beam = "_build/#{env}/lib/under_the_hood/ebin/Elixir.UnderTheHood.beam" |> to_charlist
    {:ok,{_,[{:abstract_code,{_,codez}}]}} = :beam_lib.chunks(beam, [:abstract_code])
    IO.puts(:erl_prettypr.format(:erl_syntax.form_list(codez)))
  end
end
