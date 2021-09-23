# FS-CSCI150-F21-Team5
#Evan Toland : 2.2 Users, 5. Diagrams

# FS-CSCI150-F21-Team5

# Introduction

## 1.1 Purpose
Shakshuka is a recipe planning and meal preparation app that helps users manage their recipes, plan meals, and eat better. Users using their App or the browser interface to upload, download and search for recipes with the data safely stored in the cloud server.

## 1.2 Scope
Shakshuka is designed for any user who wants to store his or her recipes online without worrying about losing them later. The App will provide features for adding, deleting, updating and backup. Users can upload and download not just recipes but also photos of their dishes. All users can bookmark their favorite recipes to retrieve them later. The App also allow users to convert between metric and imperial systems. A search feature will also be available to allow users to find recipes either by name or by cuisine types. Any user can sign up for this App with an email account or with their Google or Apple accounts.

# Description

## 2.1 Product Components

### Server and Database 
The backend for Shakshuka will be powered by Firebase and Firestore NoSQL database. It will be used to store recipes and images. It will provide adds, updates and deletes for recipes and images. User management will be using Firebase Authentication.

### Client 
The frontend will be developed using the Flutter SDK for cross platform compatibility. It will provide the users with sign up and login services. Additional widgets will be provided for users to add, update and upload recipes and images.

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
