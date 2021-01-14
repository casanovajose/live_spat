# LiveSpat

Live Spat is a web app to handle the spatialization of sound sources.
It helps defining (or drawing) the trajectory of a sound inside a fixed speakers configuration (stereo, quad, etc.)


## dev path

4 TODO steps

* V0 Generate trajectory files from drawings. These files can be used by music composition software (eg Pure DAta, Supercollider)
* V1 Generarate "Score" files. Assing sound files to trayectories creating combinable track to programming the evolution of spatialization in a composition
* V2 Multiuser live version using Javascript Audio API
* V3 Multiuser live version using OSC messages in real-time to be consumed by musical software/hardware

# Trajectory file format

is a text file which contains the information of the trajectory. data is separated with spaces.

Headers are these
'''
BEAT, TRAJ_ID, SOUND_SOURCE, X, Y, RADIO, THETA, SPEED
'''

* _TRAJ_ID_ to be used in V1
* _SOUND_SOURCE_ to be used in V1
* _BEAT_ time to process the point
* _X_ x cartesian coordinate
* _Y_ y cartesian coordinate
* _RADIO_ radio of polar coordinates
* _THETA_ angle in degrees of the coordinate
* _SPEED_ speed factor. Used to change the read tempo and also to produce a pitch shift -doppler-


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
