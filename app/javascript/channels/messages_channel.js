import CableReady from "cable_ready"
import consumer from "./consumer"

document.addEventListener("turbo:load", () => {
    const messagesContainer = document.getElementById("messages")
    const orderId = messagesContainer?.dataset.orderId

    if (orderId) {
        consumer.subscriptions.create(
            { channel: "MessagesChannel", order_id: orderId },
            {
                received(data) {
                    console.log("Received data in receiver:", data)

                    if (CableReady.canPerform(data)) {
                        // Perform the CableReady operation
                        CableReady.perform(data)
                    } else {
                        console.error("CableReady cannot perform operation.")
                    }
                }
            }
        )
    }
})
