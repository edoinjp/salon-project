import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

const { environment } = require('@rails/webpacker')

// Add any additional packages as needed
environment.loaders.append('turbo-rails', {
  test: /@hotwired\/turbo-rails/,
  use: 'imports-loader?this=>window'
})

module.exports = environment
