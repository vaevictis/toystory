Feature: Toystory CLI app behaves
  In order to get going on coding Toystory
  I want to have aruba and cucumber setup
  So I don't have to do it myself

  Scenario: App just runs with default args
    When I get help for "toystory"
    Then the exit status should be 0
    And the banner should be present
    And the banner should document that this app takes options
    And the following options should be documented:
        | --log-level  |
        | --help       |
        | --table-size |
    And the banner should document that this app takes options
    And the banner should document that this app's arguments are:
      | file  | which is required |