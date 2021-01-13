# LiveSpat

Live Spat is a web app to handle the spatialization of sound sources.
It helps defining (or drawing) the trajectory of a sound inside a fixed speakers configuration (stereo, quad, etc.)


## dev path

4 TODO steps

* Generate trajectory files from drawings. These files can be used by music composition software (eg Pure DAta, Supercollider)
* Generarate "Score" files. Assing sound files to trayectories creating combinable track to programming the evolution of spatialization in a composition
* Multiuser live version using Javascript Audio API
* Multiuser live version using OSC messages in real-time to be consumed by musical software/hardware

## To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
