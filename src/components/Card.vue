<template>
  <v-card
    @click="onCardClick"
    class="box"
    :style="{ cursor: card.faceup ? 'not-allowed' : 'pointer' }"
  >
    <v-overlay
      :color="this.card.matched ? '#02ccba' : '#02b3e4'"
      :absolute="true"
      :opacity="1"
      :value="card.faceup"
      style="font-size: 100px;"
    >
      {{ card.symbol }}
    </v-overlay>
  </v-card>
</template>

<script>
export default {
  name: "Card",

  props: {
    card: Object,
    index: Number
  },

  methods: {
    /**
     * On card click emit event is if it's not a matched one or alredy faceup
     */
    onCardClick() {
      if (!this.card.matched && !this.card.faceup) {
        this.$emit("onCardClick", this.card, this.index);
      }
    }
  }
};
</script>

<style scoped>
.box {
  background: #2e3d49 !important;
  min-height: 150px;
  border-radius: 5px !important;
  box-shadow: 12px 15px 20px 0 rgba(46, 61, 73, 0.5);
}
</style>
