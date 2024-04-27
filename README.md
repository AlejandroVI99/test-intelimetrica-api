# Test Intelimetrica API
This is a Rails API to perform a count of restaurants falling within the circle with center [x, y] and radius z.

## Render deploy URL
https://api-test-1rjk.onrender.com

## Prerequisites
Make sure you have Ruby (version 3.2.2) and Rails (version 7.1.3) installed on your system before getting started.

### Initial Setup
1.- Clone this repository to your local machine.
2.- Install dependencies using Bundler:

   ```
   bundle install
   ```

### Credentials Configuration
To set up the necessary credentials, you need to add the corresponding master.key:

```
  336f6b1c3176420a85fca8d53ee14f68
```
or create a new one.

### Database Configuration
Before running the application, make sure to create the database using the following command:

```
 bin/rails db:create db:migrate
```

### Runners Execution

The following command is responsable for fetching data from Restaurants and loading it into the database:

```
  rails runner db/scripts/insert_restaurants.rb
```
This runner inserts dummy data of restaurants for various tests and makes them available in the system.

### ### Server Execution
Once the above setup is completed, you can start the development server by running the following command:

```
  rails server
```

The server will be available at http://localhost:3000.

Your initial tests to check the availability of information can be done through Postman.

### Task 1
The first task consists in importing the raw data into a relational database and exposing a REST API that implements CRUD (Create, Read, Update, Delete) operations.

The Restaurants table needs to have the following schema:

```
Restaurants (

id TEXT PRIMARY KEY, -- Unique Identifier of Restaurant

            rating INTEGER, -- Number between 0 and 4

            name TEXT, -- Name of the restaurant

            site TEXT, -- Url of the restaurant

            email TEXT,

            phone TEXT,

            street TEXT,

            city TEXT,

            state TEXT,

            lat FLOAT, -- Latitude

            lng FLOAT) -- Longitude
```

You can find the CSV with the raw data at the following link (it contains dummy data): https://recruiting-datasets.s3.us-east-2.amazonaws.com/restaurantes.csv

### Task 2
The second task consists in implementing the following endpoint:
/restaurants/statistics?latitude=x&longitude=y&radius=z

It receives a latitude and a longitude as parameters, which correspond to the center of a circle, and a third parameter that corresponds to a radius in METERS.

This endpoint needs to return a JSON with the following data:

```
{

         count: Count of restaurants that fall inside the circle with center [x,y] and radius z,

         avg: Average rating of restaurant inside the circle,

         std: Standard deviation of rating of restaurants inside the circle

}
```
### Formula 
General Equation for a Circle: 
```
    (x - h)**2 + (y - k)**2 = r**2
```
where (h,k) are the coordinates of the center of the circle, and 'r' is the radius of the circle.

### References
Study.com. Retrieved April 27, 2024, from https://study.com/skill/learn/determining-if-a-point-lies-inside-outside-or-on-a-circle-given-the-center-point-a-radius-explanation.html
