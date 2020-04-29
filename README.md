
# memory-game

## Overview
The Memory Game project was created as part of the Web Programming with vue js javascript frameworks. The purpose of this assignment is to demonstrate the core web development skills - HTML, CSS, and JavaScript with Vue

You can play the game here: [Memory Game](https://jaydadhaniya.github.io/memory-game/#/)

## How To Play
This game is a browser-based card matching game that presents the player with cards arranged in a 4x4 grid. On one side of each card is a common design shared by all cards. On the other is a distinctive number shared by one pair of cards in the deck, thus there are 8 unique number between 1 to 8 shared by 8 pairs of cards in the deck.

The objective of the Memory Game is for the play to turn over pairs of matching cards across eight successive turns. In a turn if the player selects two cards whose number match those cards, along with those successfully matched in previous turns, will remain up. However, if the player chooses two cards with different number they will both be flipped back over.

The game ends when all eight pairs of matching cards have been revealed.

## Player UI Features
In addition to the basic game play several UI components have been implemented to provide the player with features to improve the overall experience.

-   Start Button - This button give the player the means to start the game card box, timer and total moves.

-   Restart Button - This button give the player the means to reset the game card box, timer, and total moves.

-   Stop Button - This button give the player the means to stop the game card box, timer, and total moves.

-   Score Counter - Displays the number of successful pair found by the player.

-   Timer - A timer displaying the number of seconds that have elapsed. The timer is stopped when the player wins the game or stop or restart.

-   Move Counter - Displays the number of turns the player has taken, starting with one at the first turn and increase at every two moves.

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).
