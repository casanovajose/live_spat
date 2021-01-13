# LIve Spat

Live Spat es un sistema para manejar la espacialización de fuentes sonoras. 
Más en concreto ayuda a definir (dibujar) la trayectoria de un sonido dentro de un sitema fijo de parlantes (estéreo, cuadrafonía. etc)

## Pasos a futuro

Hay 4 etapas a realizar

* Generar archivos de trayectorias a partir de los trazos. Archivos que puedan ser consumidos por software de composición musical (eg Pure DAta, Supercollider)
* Generar archivos "Score". Poder asignar sonidos a trayectorias y crear pistas donde puedan combinarse y programarse la evolución espacial de una pieza
* Implementar version web multiusuario, más limitada,  utilizando la API de audio de Javascript
* Implementar version live multiusuario que envie mensajes OSC en tiempo real a los software/hardware controladores


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