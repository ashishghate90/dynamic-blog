import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  connect() {
    this.hideNotifications()
  }

  hideNotifications() {
    setTimeout(() => {
      const alerts = this.element.querySelectorAll('.alert')
      alerts.forEach(alert => {
        alert.style.transition = 'opacity 0.5s ease-out'
        alert.style.opacity = '0'
        setTimeout(() => {
          if (alert.parentNode) {
            alert.parentNode.removeChild(alert)
          }
        }, 500)
      })
    }, 5000)
  }

  dismiss(event) {
    const alert = event.target.closest('.alert')
    if (alert) {
      alert.style.transition = 'opacity 0.3s ease-out'
      alert.style.opacity = '0'
      setTimeout(() => {
        if (alert.parentNode) {
          alert.parentNode.removeChild(alert)
        }
      }, 300)
    }
  }
}