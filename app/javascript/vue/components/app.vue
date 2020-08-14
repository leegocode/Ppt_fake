<template>
  <div>
    <h2>{{ message }}</h2>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
h1 {
  color: gray;
}

h2{
  color: red;
}
</style>
