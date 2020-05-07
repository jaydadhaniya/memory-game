<template>
  <v-dialog
    v-if="winner"
    v-bind="$attrs"
    v-on="$listeners"
    :value="winner"
    persistent
    max-width="500px"
  >
    <v-card>
      <v-card-title
        class="headline"
        style="background: linear-gradient(200deg, #00bfae 0%, #aa7ecd 100%);"
      >
        You are a Winner!
      </v-card-title>

      <v-card-text class="text-center pt-5">
        <h3>
          Hurrah! You won game in {{ seconds }} seconds and in
          {{ totalMoves }} moves!
        </h3>
      </v-card-text>

      <v-divider></v-divider>

      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="primary" large @click="$emit('play-again')">
          Play Again
        </v-btn>
        <v-spacer></v-spacer>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  name: "Home",

  props: {
    winner: { type: Boolean, default: false },
    seconds: { type: Number, required: true },
    totalMoves: { type: Number, required: true }
  }
};
</script>
