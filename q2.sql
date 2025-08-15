-- q2.sql
-- Procedure: GetWatchHistoryBySubscriber
-- Returns all shows watched by the subscriber along with watch time

DELIMITER $$

CREATE PROCEDURE GetWatchHistoryBySubscriber(IN sub_id INT)
BEGIN
    SELECT
        S.Title AS ShowTitle,
        WH.WatchTime
    FROM
        WatchHistory WH
        INNER JOIN Shows S ON WH.ShowID = S.ShowID
    WHERE
        WH.SubscriberID = sub_id;
END $$

DELIMITER ;