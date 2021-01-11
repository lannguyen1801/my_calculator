Feature: MainFunction for Req.6

  Background: Precondition
    Given User navigate to Calculator application
    Then User must see title with "Simple Calculator"

  Scenario Outline: The Percent between Integer
    Given The "<Title1>"
    When User press the first number with "<number1>"
    And User press "<symbol>" symbol
    And User press "<result>" button
    Then User must see the result with "<expected>"
    Examples:
      | number1      | symbol  | result | expected    | Title1                      |
      | 100          | %       | =      | 1.0         | Percent of integer          |
      | -80          | %       | =      | -0.8        | Percent of negative integer |
      | 50.5         | %       | =      | 0.505       | Percent of decimal          |
      | -44.5        | %       | =      | -0.445      | Percent of negative integer |
