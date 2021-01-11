
/*
Game class for team data such as:
the creator id,
the activity to be done or the game to be played,
the total number of players for the game,
the current player waiting for jokers to complete the game.
 */
class Game {
  final String creatorId;
  final String activity;
  final int totalPlayers;
  final int currentPlayers;
  Game({this.creatorId,this.activity,this.totalPlayers,this.currentPlayers});
}