class ScoringMethods {
  // NOTE: These values will be set as the names of the buttons that will be used when scouting, make sure to name buttons appropriately.
  // NOTE: Make sure to also change the point values assigned to each scoring method in that respective list.
  //
  // This class stores the data for the names of the scoring methods and their respective point values.
  // Change the strings inside these lists to match the scoring methods for this years game.
  // The point values will be next to the name of the scoring method change them to match this years game.
  // For one time objectives such as leaving the starting zone or scoring coopertition points, put those and their point values into the one time objectives map below the respective game period.

  // Here you will adjust the ways to score in the autonomous period of the game.
  static Map<String, int> autoScoringMethods = {
    'Amp Note': 2,
    'Speaker Note': 5
  };

  // NOTE: While teams can leave in auto, it doesn't count if they do it more than once, so i place that scoring option in this map instead.
  static Map<String, int> autoOneTimeObjectives = {'Leave': 2};

  // Here you will adjust the ways to score in the teleoperated period of the game.
  // NOTE: for actions teams can do that have no given point value, set the point value to be 0. For example, amplification(2024 crescendo)
  static Map<String, int> teleopScoringMethods = {
    'Amp Note': 1,
    'Speaker Note (not amplified)': 2,
    'Speaker note (amplified)': 5,
  };

  // Adjust this map to account for one time actions during teleop.
  static Map<String, int> teleopOneTimeObjectives = {'Coopertition': 0};

  // Here you will adjust the ways to score in the endgame period.
  static Map<String, int> endGameScoringMethods = {
    'Park': 1,
    'On Stage (not spotlit)': 3,
    'On Stage (spotlit)': 4,
    'Harmony': 2,
    'Trap': 5
  };
}
