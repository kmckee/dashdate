Feature:  Command Line Interface
  So that I can update my dashboard without having to write and code
  I want a command line interface for the dashdate gem

  Scenario: Updating the Karma sample widget with a new value
    When I enter the following in a terminal: "dashdate --widget Karma --values value=100"
    Then the Karma widget should be updated with the following values:
      | value |
      | 100   |
