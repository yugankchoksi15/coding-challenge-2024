// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="chat"
// export default class extends Controller {
//   connect() {
//   }
// }
import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    this.scrollToBottom()
  }

  update() {
    this.scrollToBottom()
  }

  scrollToBottom() {
    this.element.scrollTop = this.element.scrollHeight
  }
}
