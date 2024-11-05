class Scoring {
  static Map<String, int> allTimeScoringMethods = {
    'Net': 1,
    'Clip Low': 1,
    'Clip High': 1,
    'Bucket Low': 1,
    'Bucket High': 1,
  };

  static Map<String, int> autoOneTimeObjectives = {'Leave': 2};
  static Map<String, int> teleopScoringMethods = {
    'Amp Note': 1,
    'Speaker Note (not amplified)': 2,
    'Speaker note (amplified)': 5,
  };


  // Here you will adjust the ways to score in the endgame period.
  static Map<String, int> endGameScoringMethods = {
    'Park': 1,
    'On Stage (not spotlit)': 3,
    'On Stage (spotlit)': 4,
    'Harmony': 2,
    'Trap': 5
  };
}
