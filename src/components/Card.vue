<template>
  <v-app>
    <div>
      <v-row class="justify-center">
        <v-col cols="2"> score: {{ score }} </v-col>

        <v-col cols="2">
          <v-btn v-if="!started" color="primary" @click="start">Start</v-btn>
          <v-btn v-if="started" color="error" @click="stop">Stop</v-btn>
        </v-col>

        <v-col cols="2"> Time: {{ seconds }} seconds </v-col>
      </v-row>
    </div>
  </v-app>
</template>

<script>
export default {
  name: "Card",

  props: {
    msg: String
  },

  data() {
    return {
      started: false,
      seconds: 0,
      timer: null,
      score: 0
    };
  },

  methods: {
    start() {
      this.seconds = 0;
      this.started = true;
      this.timer = setInterval(() => {
        this.seconds++;
      }, 1000);
    },

    stop() {
      this.started = false;
      clearInterval(this.timer);
    }
  }
};
</script>
