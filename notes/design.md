# Basic Design

## Basic Units
 - Prediction
 - Pick
 - PredictionTemplate
 - PickTemplate

## Entities

### LiveEvent
A LiveEvent contains information about an event that people will be making predictions about. Examples could be, an F1 race, a baseball game, a ping-pong game, etc.

#### Entity
The LiveEvent entity will have
 - Created Date
 - Opening Date (can be same as Created Date)
 - Happening Date
 - Closing Date
 - Description
 - List of Predictions
 - List of User Picks

#### Things that will happen
 - Create LiveEvent
 - Add Prediction
 - Remove Prediction
 - User Makes Pick

### Templates
 - Prediction Template Created
 - Pick Template Created

### League
 - League Created
 - League Logo Edited
 - League Description Edited
 - League Closed
 - User Added to League
 - User Removed from League

#### League Properties
 - Id
 - Created Date
 - Users
 - Description
 - Invite only
 - Closed Date

# Full Application Flow

## Steps
 - User logs into the application
 - User sees all of the live events that they have coming up in the leagues they are in
 - User can go to a page for the live event
 - User can see all of the predictions that they have to make (or have made)
 - User makes a pick for each prediction

## Making a Pick
 - User picks for prediction
 - Client sends user id, pick id, template id and event id to the server
 - web app verifies user has access to the live event
 - sends command to backend to have user make pick