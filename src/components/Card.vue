<template>
  <v-card @click="onCardClick">
    <div>{{ card.symbol }}</div>
    <v-overlay :absolute="true" :opacity="1" :value="!card.faceup"> </v-overlay>
  </v-card>
</template>

<script>
export default {
  name: "Card",

  props: {
    card: Object,
    index: Number,
  },

  methods: {
    /**
     * On card click emit event is if it's not a matched one or alredy faceup
     */
    onCardClick() {
      if (!this.card.matched && !this.card.faceup) {
        this.$emit("onCardClick", this.card, this.index);
      }
    },
  },
};
</script>
