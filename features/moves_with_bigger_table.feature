Feature: User can launch toystory a different table size as an optional argument
  As a robot programming hobbist
  In order to play a more interesting game
  I want to choose a different table size
  So I can enjoy more complex move sequences

  Scenario: Toystory can take an optional parameter defining an alternative table size
    When I run `toystory ../../features/moves/8_by_8_table.txt -t8`
    Then the output should contain "report: 7,6,EAST"
    And the output should not contain "Dangerous move"
    
  Scenario: Robot can be placed anywhere on the table
    When I run `toystory ../../features/moves/placed_far_from_origin.txt -t9`
    Then the output should contain "report: 3,3,SOUTH"
    And the output should not contain "Dangerous move"
    