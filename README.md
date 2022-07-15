# README

This README show the path to solve attack the challenge

## Requirements

1. Solution
   1. Resolve validations problems
   1. Planning the challenge solution
   1. Execute the solutions
2. CI

### 1. Solution
#### 1.1 Resolve validations problems

**1. The length of the string must be between 10 and 15 characters.**

`			`**Problem**: Avoid invalid input considering that valid input must be between 10 and 15 characters. The minimum and maximum can change over time

`			`**Solution:** We must count chars in the given string to ensure was greater or equal to the minimum and less or equal than maximum

**2. The string must include a number.**

`			`**Problem**: Avoid invalid input considering that valid input must contain a number in any part of the input string

`			`**Possible solution 1:** Use a regular expression to validate if the string includes digits. (479 time quicker than solution 2 with a string of 10000 charts)

`			`**Possible solution 2:**  Loop into each chart of the string to find a digit

**Solution:** solution 1 because is the quickest

**3. The string must include an uppercase character.**

`			`**Problem**: Avoid invalid input considering that valid input must contain a number in any part of the input string

`			`**Possible solution 1:** Use a regular expression to validate if the string includes an uppercase character. (300 time quicker than solution 2 with a string of 10000 charts)

`			`**Possible solution 2:**  Loop into each chart of the string to find an uppercase character.

**Solution:** solution 1 because is the quickest
#### 1.2 Planning the challenge solution
   1. Create custom validators
   2. Create model for test validator
   3. Test First - minitest
   4. Implement Validator to pass test
1. Execute the solutions
2. Deploy and CI
   1. Deploy
   2. CI

