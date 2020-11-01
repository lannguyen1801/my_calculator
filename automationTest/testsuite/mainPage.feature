@SignIn

Feature: MainPage

    Background: precondition
        Given User navigate to Calculator application
        Then User must see title with "Simple Calculator"

    Scenario Outline: Demo User plus 2 number successfully
        When User press first number with "<number1>"
        And User press "<symbol>" symbol
        And User press second number with "<number2>"
        And User press "<result>" button
        Then User must see the result with "<message>"
        Examples:
            | number1 | symbol  | number2 | result | message |
            | 10      | +       | 3       | =      | 13.0    |
