# FS-CSCI150-F21-Team5

# this is a change by Juan

# Frontend Design Requirements

## Navigation
### Bottom Bar
* Will be used to navigate to the main screens (Recipies, Meal Plan, Grocery List, and Search)
* Default screen will be recipies 

### Account Button
* Displayed in top right of every acreen.
* lets user configure settings related to the application itself, and their user account.

### Floating Action Button
* Action performed is screen dependent.
    * EG: on recipie screen: add recipie. On meal plan screen: add custom meal plan week. Etc.

## Screens
#### Login
* Lets user log in to access their recipies stored in Firebase.
* Has options to login with either email, or other authentication powers.
* Has a button that takes user to registration screen, if they do not have an account.

#### Registration
* Lets user create an email account with Firebase.
* optionally have buttons to register through authentication powers.

### Main Screens
#### Recipies
* Default main screen.
* Displays user-entered recipies as a grid 

#### Meal Plan
* Displays a list of weeks.
* each week button will take user to a screen that displays that weeks meal prep plan.

#### Grocery List
* Displays what indregients the user must buy.

#### Search
* Has a search bar that accepts users' search queries.
* Displays a grid of recipie tags that will filter results.