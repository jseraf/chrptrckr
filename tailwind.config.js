module.exports = {
  mode: 'jit',
  purge: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        amber: {
          1000: '#3f3437',
        },
        red: {
          850: '#822036'
        }
      }
    }
  }
}
