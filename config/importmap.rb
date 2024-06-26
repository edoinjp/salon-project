# Pin npm packages by running ./bin/importmap
pin "@rails/actioncable", to: "actioncable.esm.js"
pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@popperjs/core", to: "https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
pin "chartkick", to: "https://cdn.jsdelivr.net/npm/chartkick@4.2.0/dist/chartkick.min.js"
pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
pin "Chart.bundle", to: "https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.bundle.min.js"
