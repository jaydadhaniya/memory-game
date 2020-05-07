<template>
  <v-dialog
    v-if="showInstruction"
    v-bind="$attrs"
    v-on="$listeners"
    :value="showInstruction"
    persistent
    max-width="800px"
  >
    <v-card>
      <v-card-title
        class="headline"
        style="background: linear-gradient(200deg, #00bfae 0%, #aa7ecd 100%);"
      >
        How To Play
      </v-card-title>

      <v-card-text class="text-justify pt-5">
        <h3>
          This game is a browser-based card matching game that presents the
          player with cards arranged in a 4x4 grid. On one side of each card is
          a common design shared by all cards. On the other is a distinctive
          number shared by one pair of cards in the deck, thus there are 8
          unique number between 1 to 8 shared by 8 pairs of cards in the deck.
        </h3>
        <br />
        <h3>
          The objective of the Memory Game is for the play to turn over pairs of
          matching cards across eight successive turns. In a turn if the player
          selects two cards whose number match those cards, along with those
          successfully matched in previous turns, will remain up. However, if
          the player chooses two cards with different number they will both be
          flipped back over.
        </h3>
        <br />
        <h3>
          The game ends when all eight pairs of matching cards have been
          revealed.
        </h3>
      </v-card-text>

      <v-divider></v-divider>

      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="primary" large @click="$emit('play')">
          Let's Play
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
    showInstruction: { type: Boolean, default: false }
  }
};
</script>
