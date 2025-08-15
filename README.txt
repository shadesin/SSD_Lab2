Author: Souradeep Das - 2025201004
Contact: souradeep.das@students.iiit.ac.in

CS6.302 - Software System Development
Lab 2: SQL Stored Procedures and Cursors

Instructions to Execute:

1. Open MySQL Workbench and connect to your local MySQL server.

2. Create the necessary tables and insert sample data by running the following SQL commands:

-- Create Tables
CREATE TABLE Shows (
    ShowID INT PRIMARY KEY,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    ReleaseYear INT
);

CREATE TABLE Subscribers (
    SubscriberID INT PRIMARY KEY,
    SubscriberName VARCHAR(100),
    SubscriptionDate DATE
);

CREATE TABLE WatchHistory (
    HistoryID INT PRIMARY KEY,
    ShowID INT,
    SubscriberID INT,
    WatchTime INT, -- Duration in minutes
    FOREIGN KEY (ShowID) REFERENCES Shows(ShowID),
    FOREIGN KEY (SubscriberID) REFERENCES Subscribers(SubscriberID)
);

-- Insert Sample Data
INSERT INTO Shows (ShowID, Title, Genre, ReleaseYear) VALUES
(1, 'Stranger Things', 'Sci-Fi', 2016),
(2, 'The Crown', 'Drama', 2016),
(3, 'The Witcher', 'Fantasy', 2019);

INSERT INTO Subscribers (SubscriberID, SubscriberName, SubscriptionDate) VALUES
(1, 'Emily Clark', '2023-01-10'),
(2, 'Chris Adams', '2023-02-15'),
(3, 'Jordan Smith', '2023-03-05');

INSERT INTO WatchHistory (HistoryID, SubscriberID, ShowID, WatchTime) VALUES
(1, 1, 1, 100),
(2, 1, 2, 10),
(3, 2, 1, 20),
(4, 2, 2, 40),
(5, 2, 3, 10),
(6, 3, 2, 10),
(7, 3, 1, 10);

3. Execute the SQL scripts for each question in this order:

   - q1.sql: Creates ListAllSubscribers() procedure
   - q2.sql: Creates GetWatchHistoryBySubscriber(IN sub_id INT) procedure
   - q3.sql: Creates AddSubscriberIfNotExists(IN subName VARCHAR(100)) procedure
   - q4.sql: Creates SendWatchTimeReport() procedure
   - q5.sql: Creates procedure that loops through all subscribers and calls GetWatchHistoryBySubscriber()

4. To test each procedure, call it using the CALL statement. Examples:

   CALL ListAllSubscribers();
   CALL GetWatchHistoryBySubscriber(1);
   CALL AddSubscriberIfNotExists('New Subscriber Name');
   CALL SendWatchTimeReport();
   CALL PrintAllSubscribersWatchHistory();  -- Procedure name from q5.sql

Git Repository Link:
https://github.com/shadesin/SSD_Lab2

Notes:
- Ensure all SQL files are executed in the above order to satisfy dependencies.
- The procedures assume data as provided above and were tested in MySQL Workbench.