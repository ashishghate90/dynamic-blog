import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Comments controller connected")
  }

  disconnect() {
    console.log("Comments controller disconnected")
  }
}