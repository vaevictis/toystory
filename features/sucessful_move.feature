Feature: User can launch toystory with a file containing simple moves and get reported the final position
  In order to control initial positioning and simple moves
  I want to launch the app with a file containing a simple series of moves
  So I can apply for a job

  Scenario: App properly positions the robot from a file read
    When I successfully run `toystory ../../features/moves/moves.txt`
    Then the output should contain "0,1,NORTH"
    