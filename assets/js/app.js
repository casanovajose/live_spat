// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.scss"
import "../css/live_spat.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//
import "phoenix_html"
import {Socket} from "phoenix"
import NProgress from "nprogress"
import {LiveSocket} from "phoenix_live_view"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")

let Hooks = {}
Hooks.MouseDownPoint = {
  mounted() {
    this.el.addEventListener("pointermove", e => {
      // console.log(e.target.nodeName)
      // firefox is not handling fine this due to the pointer sometimes is over svg and sometimes over the circle.
      // solved checking the nodeName 
      if(e.target.nodeName == "svg" && e.pressure > 0){
        this.pushEvent("move_live_point", {offsetX: e.offsetX, offsetY: e.offsetY,}, (reply, ref) => console.log(reply))
      }
    });
  }
}

Hooks.MouseDownTraj = {
  mounted() {
    this.el.addEventListener("pointermove", e => {
      // console.log(e.target.nodeName)
      // firefox is not handling fine this due to the pointer sometimes is over svg and sometimes over the circle.
      // solved checking the nodeName 
      if(e.target.nodeName == "svg" && e.pressure > 0){
        this.pushEvent("add_traj_point", {offsetX: e.offsetX, offsetY: e.offsetY,}, (reply, ref) => console.log(reply))
      }
    });
  }
}

let liveSocket = new LiveSocket("/live", Socket, {
  hooks: Hooks,
  params: {_csrf_token: csrfToken},
  metadata: {
    click: (e, el) => {
      return {offsetX: e.offsetX, offsetY: e.offsetY,}
    }
  }
})


// Show progress bar on live navigation and form submits
window.addEventListener("phx:page-loading-start", info => NProgress.start())
window.addEventListener("phx:page-loading-stop", info => NProgress.done())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)
window.liveSocket = liveSocket
