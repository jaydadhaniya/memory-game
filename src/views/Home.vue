<template>
  <v-app>
    <h1 class="ma-2">Welcome to Memory Game</h1>
    <div>
      <v-row class="justify-center">
        <v-col cols="2">
          <h2>Score: {{ pairCount }}</h2>
        </v-col>

        <v-col cols="2">
          <v-btn v-if="!isGameOn" large color="#02ccba" @click="start"
            >Start</v-btn
          >
          <v-btn
            class="float-left"
            v-if="isGameOn"
            large
            color="error"
            @click="stop"
            >Stop</v-btn
          >
          <v-btn
            class="float-right"
            v-if="isGameOn"
            large
            color="#02ccba"
            @click="reStart"
            >Restart</v-btn
          >
        </v-col>

        <v-col cols="2">
          <h2>Time: {{ seconds }} seconds</h2>
        </v-col>
      </v-row>
    </div>
    <v-row v-if="isGameOn">
      <v-col cols="12" sm="6" offset-sm="3">
        <v-card style="border-radius: 10px;">
          <v-container
            fluid
            style="background: linear-gradient(160deg, #02ccba 0%, #aa7ecd 100%); padding: 10px 20px;"
          >
            <v-row>
              <v-col v-for="(card, index) in gameCard" :key="index" cols="3">
                <v-card class="justify-center">
                  <card :card="card" :index="index" @onCardClick="checkCard" />
                </v-card>
              </v-col>
            </v-row>
          </v-container>
        </v-card>
      </v-col>
    </v-row>
    <v-dialog
      v-if="winner"
      v-bind="$attrs"
      v-on="$listeners"
      :value="winner"
      persistent
      max-width="500px"
    >
      <v-card>
        <v-card-title class="headline" style=" background-color: #02ccba; ">
          You are a Winner!
        </v-card-title>

        <v-card-text class="text-center">
          <h3>
            Hurrah! You won game in {{ seconds }} seconds and in
            {{ totalMoves }} moves!
          </h3>
        </v-card-text>

        <v-divider></v-divider>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="#02ccba" large @click="reStart">
            Play Again
          </v-btn>
          <v-spacer></v-spacer>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-app>
</template>

<script>
// @ is an alias to /src
import Card from "@/components/Card.vue";

function initialState() {
  return {
    isGameOn: false,
    seconds: 0,
    timer: null,
    pairCount: 0,
    firstCard: null,
    gameCard: [
      { symbol: "1", faceup: false, matched: false },
      { symbol: "1", faceup: false, matched: false },
      { symbol: "2", faceup: false, matched: false },
      { symbol: "2", faceup: false, matched: false },
      { symbol: "3", faceup: false, matched: false },
      { symbol: "3", faceup: false, matched: false },
      { symbol: "4", faceup: false, matched: false },
      { symbol: "4", faceup: false, matched: false },
      { symbol: "5", faceup: false, matched: false },
      { symbol: "5", faceup: false, matched: false },
      { symbol: "6", faceup: false, matched: false },
      { symbol: "6", faceup: false, matched: false },
      { symbol: "7", faceup: false, matched: false },
      { symbol: "7", faceup: false, matched: false },
      { symbol: "8", faceup: false, matched: false },
      { symbol: "8", faceup: false, matched: false },
    ],
    winner: false,
    totalMoves: 0,
  };
}

export default {
  name: "Home",

  components: {
    Card,
  },

  data() {
    return initialState();
  },

  methods: {
    start() {
      this.suffle();
      this.isGameOn = true;
      this.timer = setInterval(() => {
        this.seconds++;
      }, 1000);
    },

    stop() {
      clearInterval(this.timer);
      // Assign initial value to data
      Object.assign(this.$data, initialState());
    },

    reStart() {
      clearInterval(this.timer);
      // Assign initial value to data
      Object.assign(this.$data, initialState());
      this.start();
    },

    /**
     * Shuffle a game cards. This function is based on http://stackoverflow.com/a/2450976
     */
    suffle() {
      let currentIndex = this.gameCard.length;
      let temporaryValue;
      let randomIndex;

      while (currentIndex !== 0) {
        randomIndex = Math.floor(Math.random() * currentIndex);
        currentIndex -= 1;
        temporaryValue = this.gameCard[currentIndex];
        this.gameCard[currentIndex] = this.gameCard[randomIndex];
        this.gameCard[randomIndex] = temporaryValue;
      }
    },

    /**
     * check card details and do Match/notMatched
     */
    checkCard(card, index) {
      this.gameCard[index] = { ...card, faceup: true };

      setTimeout(() => {
        if (this.firstCard === null) {
          this.firstCard = { ...card, index };
        } else if (this.firstCard.symbol === card.symbol) {
          this.gameCard[index] = {
            symbol: card.symbol,
            faceup: true,
            matched: true,
          };
          this.gameCard[this.firstCard.index] = {
            symbol: card.symbol,
            faceup: true,
            matched: true,
          };

          this.firstCard = null;
          this.pairCount++;
          this.totalMoves++;

          if (this.pairCount === 8) {
            clearInterval(this.timer);
            this.winner = true;
          }
        } else {
          this.gameCard[index] = {
            symbol: card.symbol,
            faceup: false,
            matched: false,
          };
          this.gameCard[this.firstCard.index] = {
            symbol: this.firstCard.symbol,
            faceup: false,
            matched: false,
          };

          this.firstCard = null;
          this.totalMoves++;
        }
      }, 2000);
    },
  },
};
</script>
