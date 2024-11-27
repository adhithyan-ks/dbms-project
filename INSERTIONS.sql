INSERT INTO DEPARTMENTS VALUES
  ('CT','COMPUTER ENGINEERING'),
  ('TD','TOOL AND DIE'),
  ('EC','ELECTRONICS AND COMM');
  
INSERT INTO ITEMS (ITEM_ID, ITEM_NAME) VALUES 
  (1, '100m Race'),
  (2, '200m Race'),
  (3, 'Long Jump'),
  (4, 'High Jump'),
  (5, 'Triple Jump');
  
CALL Register(101, 'NIVEDH BAIJU', 20, 'M', 'CT', '9876543210');
CALL Register(102, 'ABHIJITH K KANNAN', 21, 'M', 'TD', '9123456789');
CALL Register(103, 'ABHIJITH N', 22, 'M', 'EC', '9876501234');
CALL Register(104, 'ABHINAND K S', 19, 'M', 'CT', '9876543222');
CALL Register(105, 'ABINAV C S', 21, 'M', 'TD', '9123456790');
CALL Register(106, 'ABINAV K A', 20, 'M', 'EC', '9876501235');
CALL Register(107, 'ADARSH C R', 22, 'M', 'CT', '9876543233');
CALL Register(201, 'ALEENA M J', 20, 'F', 'EC', '9876501245');
CALL Register(202, 'ANJANA P', 23, 'F', 'CT', '9876543266');
CALL Register(203, 'ATHULYA M', 20, 'F', 'EC', '9876501267');
CALL Register(204, 'CHRISTY VARGHESE', 21, 'F', 'EC', '9876501278');
CALL Register(205, 'DIVYA M', 21, 'F', 'TD', '9123456734');

CALL RegisterItem(1, 101);
CALL RegisterItem(1, 104);
CALL RegisterItem(1, 107);

CALL RegisterItem(2, 102);
CALL RegisterItem(2, 103);
CALL RegisterItem(2, 105);

CALL RegisterItem(3, 106);
CALL RegisterItem(3, 107);
CALL RegisterItem(3, 105);

CALL RegisterItem(4, 201);
CALL RegisterItem(4, 204);

CALL RegisterItem(5, 202);
CALL RegisterItem(5, 205);
CALL RegisterItem(5, 203);

CALL UpdPos(1, 101, 1);
CALL UpdPos(1, 104, 2);
CALL UpdPos(1, 107, 3);

CALL UpdPos(2, 102, 1);
CALL UpdPos(2, 103, 2);
CALL UpdPos(2, 105, 3);
