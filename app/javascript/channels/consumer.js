// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `bin/rails generate channel` command.

import { createConsumer } from "@rails/actioncable"

export default createConsumer()
createConsumer('https://localhost:6379/cable')

// Use a function to dynamically generate the URL
createConsumer(getWebSocketURL)

function getWebSocketURL() {
  const token = localStorage.get('auth-token')
  return `https://localhost:6379/cable?token=${token}`
}
