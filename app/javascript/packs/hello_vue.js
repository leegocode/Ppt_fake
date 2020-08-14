import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import App from 'vue/components/app.vue'

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  new Vue({
    el: '#hello',
    data: () => {
      return {
        message: "Can you say hello?"
      }
    },
    components: { App }
  })
})
