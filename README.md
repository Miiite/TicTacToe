# Environment
!!!
Project uses Flutter 3.38.3 and Dart 3.10.0 (used to be able to enable dot shorthands feature)
!!!

# Demo

## Winning scenario

https://github.com/user-attachments/assets/7f4c6439-bbab-41a4-861f-0fb16e65159d

## Draw scenario

https://github.com/user-attachments/assets/db229b96-fbca-4914-9996-989e9884432b

# Main dependencies

- [flutter_bloc](https://pub.dev/packages/flutter_bloc) for state management
- [flutter_hooks](https://pub.dev/packages/flutter_hooks) for animations setup with minimal boilerplate
- [freezed](https://pub.dev/packages/freezed) for models
- [flutter_confetti](https://pub.dev/packages/flutter_confetti) for ... fun ?




# Initial prompt (used to generate the project skeleton prior to manual editions)

```
Create a tictactoe game following these rules:

- The project must use flutter_bloc for state management
- The project must use freezed for model classes
- The project must use go_router for screen navigation

The project must have 3 main screens

- The "new game" screen, with a button to start a new game
- The "game" screen, which will be a screen with the tic tac toe grid as the main element, and below it some context information like the current score, who's turn it is to play etc
- The "result" screen, which will appear when a game is over, and someone has won the game.

Additional functionnalities:

- When a player selects one of the tictactoe's grid item, a light sound should be played when the button is pressed, and when the button is released. This sound should be "non-intrusive" meaning it should be very discreet.
- Between each sreen navigation, the app should use a FadeTransition instead of the default navigation transition
```
