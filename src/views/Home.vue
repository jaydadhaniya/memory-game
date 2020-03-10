<template>
  <div>
    <card msg="Welcome to Memory Game" />
  </div>
</template>

<script>
// @ is an alias to /src
import Card from "@/components/Card.vue";

export default {
  name: "Home",
  components: {
    Card
  }
};
</script>
