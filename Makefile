first-cmd:
	make migrate
	make up
up:
	mix phx.server
fix-routes:
	mix phx.routes
migrate:
	 mix ecto.create