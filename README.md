# run log

```
mix phx.gen.html Blog Post posts body:string word_count:integer
mix ecto.migrate

mix phx.gen.html Message Letters letters body:string word_count:integer
mix ecto.migrate
```

# create View

```
mix phx.gen.html Blog Post posts body:string word_count:integer
```

# PhoenixApp

To start your Phoenix server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix

# phoenixApp
