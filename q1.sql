-- q1.sql
-- Procedure: ListAllSubscribers
-- This procedure uses a cursor to iterate through all Subscribers and prints their names

DELIMITER $$

CREATE PROCEDURE ListAllSubscribers()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE sub_name VARCHAR(100);
    DECLARE cur CURSOR FOR SELECT SubscriberName FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO sub_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Print subscriber's name
        SELECT sub_name AS SubscriberName;
    END LOOP;

    CLOSE cur;
END $$

DELIMITER ;

call ListAllSubscribers()