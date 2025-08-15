-- q3.sql
-- Procedure: AddSubscriberIfNotExists
-- Adds a new subscriber into the Subscribers table if the name does not exist

DELIMITER $$

CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    DECLARE sub_exists INT DEFAULT 0;

    -- Check if subscriber with the given name already exists
    SELECT COUNT(*) INTO sub_exists
    FROM Subscribers
    WHERE SubscriberName = subName;

    -- If subscriber does not exist, insert the new subscriber
    IF sub_exists = 0 THEN
        INSERT INTO Subscribers (SubscriberName, SubscriptionDate)
        VALUES (subName, CURDATE());
    END IF;
END $$

DELIMITER ;
