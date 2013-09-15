Feature: User can launch toystory with a file containing wrong moves and get reported that there was an error
  In order to ensure robot safety and game played by the rules
  I want to launch the app with a file containing wrong moves
  So I can apply for a job

  Scenario: App gracefully handles syntactically invalid moves from a file read
    When I run `toystory /Users/vaevictis/valise/develop/ruby/toystory/invalid_syntax_moves.txt`
    Then the output should contain "Invalid syntax"
    
  Scenario: App reports a useful message when asked for report while robot is still not placed
    When I run `toystory /Users/vaevictis/valise/develop/ruby/toystory/moves_without_correct_placement.txt`
    Then the output should contain "Not placed yet"