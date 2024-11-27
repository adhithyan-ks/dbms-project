-- procedure to register participants
DELIMITER //
CREATE PROCEDURE Register(
  IN p_id INT,
  IN p_name VARCHAR(20),
  IN p_age INT,
  IN p_gender CHAR(1),
  IN p_dept_id CHAR(2),
  IN p_contact_no CHAR(10)
)
BEGIN
  INSERT INTO PARTICIPANTS (P_ID, P_NAME, AGE, GENDER, DEPT_ID, CONTACT_NO)
  VALUES (p_id, p_name, p_age, p_gender, p_dept_id, p_contact_no);
END //

-- procedure to register item
CREATE PROCEDURE RegisterItem(IN itemid INT, IN pid INT)
BEGIN
	INSERT INTO PARTICIPATION (ITEM_ID, P_ID)
	VALUES (itemid, pid);
END //

-- procedure to update positions
CREATE PROCEDURE UpdPos(IN itemid INT,IN pid INT,IN pos INT)
BEGIN
	UPDATE PARTICIPATION SET POSITION=pos 
	WHERE ITEM_ID=itemid AND P_ID=pid;
END //

-- procedure to view item participated by a participant
CREATE PROCEDURE Participant(IN p_id INT)
BEGIN
    SELECT 
        p.P_NAME AS Participant_Name,
        i.ITEM_NAME AS Item_Name
    FROM 
        PARTICIPATION pi
    JOIN 
        PARTICIPANTS p ON pi.P_ID = p.P_ID
    JOIN 
        ITEMS i ON pi.ITEM_ID = i.ITEM_ID
    WHERE 
        p.P_ID = p_id;
END //

-- procedure to view partcipants of an item
CREATE PROCEDURE Item(IN itemId INT)
BEGIN
    SELECT 
        P.P_ID,
        P.P_NAME,
        P.AGE,
        P.GENDER,
        D.DEPT_NAME,
        P.CONTACT_NO
    FROM 
        PARTICIPANTS P
    JOIN 
        PARTICIPATION PI ON P.P_ID = PI.P_ID
    JOIN 
        DEPARTMENTS D ON P.DEPT_ID = D.DEPT_ID
    WHERE 
        PI.ITEM_ID = itemId;
END //

-- procedure to insert result into result table
CREATE PROCEDURE CalcResult()
BEGIN
    DECLARE pid INT;
    DECLARE itemid INT;
    DECLARE pos INT;
    DECLARE pname VARCHAR(20);
    DECLARE itemname VARCHAR(15);
    DECLARE gen CHAR(1);
    DECLARE FLAG INT DEFAULT 0;
    DECLARE C1 CURSOR FOR 
        SELECT B.P_ID, A.P_NAME, A.GENDER, B.ITEM_ID, C.ITEM_NAME, B.POSITION 
        FROM PARTICIPANTS A 
        JOIN PARTICIPATION B ON A.P_ID = B.P_ID 
        JOIN ITEMS C ON C.ITEM_ID = B.ITEM_ID 
        WHERE B.POSITION != 0;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET FLAG = 1;
    DELETE FROM RESULT;
    OPEN C1;
    read_loop: LOOP
        FETCH C1 INTO pid, pname, gen, itemid, itemname, pos;
        IF FLAG = 1 THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO RESULT (P_ID, P_NAME, GENDER, ITEM_ID, ITEM_NAME, POSITION) 
        VALUES (pid, pname, gen, itemid, itemname, pos);
    END LOOP;
    CLOSE C1;
END //

-- trigger to limit item participation for a participant
CREATE TRIGGER MAXITEMS BEFORE INSERT ON PARTICIPATION FOR EACH ROW 
BEGIN 
	DECLARE PI_COUNT INT;
	SELECT COUNT(*) INTO PI_COUNT FROM PARTICIPATION WHERE P_ID=NEW.P_ID;
	IF PI_COUNT >=3 THEN
		SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT="Error, A participant cannot participant in more than 3 items";
	END IF;
END //
DELIMITER ;