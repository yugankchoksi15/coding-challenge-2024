import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["message", "messages", "orderId", "userId"];

  async submit(e) {
    e.preventDefault();

    // Collect form data
    const payload = {
      message: this.messageTarget.value,
      order_id: this.orderIdTarget.value,
      user_id: this.userIdTarget.value,
    };

    try {
      // Send data to the server
      const response = await fetch("/messages", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
        },
        body: JSON.stringify({ message: payload }),
      });

      if (response.ok) {
        const data = await response.json();

        // Append the new message to the message list
        const newMessageHTML = `
          <div class="bg-white p-4 rounded-lg shadow-md">
            <p class="font-bold">${data.sender_email}</p>
            <p class="text-gray-800">${data.message}</p>
            <p class="text-gray-500 text-sm">${data.created_at}</p>
          </div>
        `;
        this.messagesTarget.insertAdjacentHTML("beforeend", newMessageHTML);

        // Clear the input field
        this.messageTarget.value = "";
      } else {
        console.error("Failed to send message.");
      }
    } catch (error) {
      console.error("An error occurred:", error);
    }
  }
}

