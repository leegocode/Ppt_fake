<template>
  <div>
    <ul>
      <li v-for="board in boards">{{ board }}</li>
    </ul>
  </div>
</template>

<script>
import R from "@rails/ujs";

export default {
  data: function () {
    return {
      boards: [],
    };
  },
  beforeCreate: function () {

    R.ajax({
      url: "/api/v2/boards.json",
      type: "GET",
      success: (data) => {
        this.boards = data.map(function (d){
          return d.title;
        })
      },
      error: function (err) {},
    });
  },
};
</script>

<style scoped>
</style>
