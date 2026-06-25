import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["item", "handle"]

  connect() {
    this.draggedItem = null
    this.originalOrder = this.orderedIds().join(",")
  }

  handleTargetConnected(handle) {
    handle.draggable = true
  }

  dragStart(event) {
    this.draggedItem = event.currentTarget.closest("[data-reorder-target=\"item\"]")
    if (!this.draggedItem) return

    this.originalOrder = this.orderedIds().join(",")
    event.dataTransfer.effectAllowed = "move"
    event.dataTransfer.setData("text/plain", this.draggedItem.dataset.id)
    this.draggedItem.classList.add("opacity-60", "ring-2", "ring-sky-300")
  }

  dragOver(event) {
    event.preventDefault()

    const target = event.target.closest("[data-reorder-target=\"item\"]")
    if (!target || target === this.draggedItem) return

    const targetBox = target.getBoundingClientRect()
    const insertAfter = event.clientY > targetBox.top + targetBox.height / 2
    const draggedWrapper = this.wrapperFor(this.draggedItem)
    const targetWrapper = this.wrapperFor(target)

    if (insertAfter) {
      targetWrapper.after(draggedWrapper)
    } else {
      targetWrapper.before(draggedWrapper)
    }
  }

  async dragEnd() {
    if (!this.draggedItem) return

    this.draggedItem.classList.remove("opacity-60", "ring-2", "ring-sky-300")

    const currentOrder = this.orderedIds().join(",")
    if (currentOrder !== this.originalOrder) {
      await this.updatePositions()
    }

    this.draggedItem = null
  }

  orderedIds() {
    return this.itemTargets.map((item) => item.dataset.id)
  }

  wrapperFor(item) {
    return item.closest("turbo-frame") || item
  }

  positionOffset() {
    return Number.parseInt(this.element.dataset.positionOffset || "0", 10)
  }

  async updatePositions() {
    const response = await fetch("/todos/reorder", {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content,
      },
      body: JSON.stringify({ ordered_ids: this.orderedIds(), position_offset: this.positionOffset() }),
    })

    if (!response.ok) {
      window.location.reload()
    }
  }
}
