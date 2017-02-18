-- insert attendee record
INSERT INTO surgetech_conference.ATTENDEE (FIRST_NAME, LAST_NAME)
VALUES ('Thomas','Nield')

-- insert multiple attendees
INSERT INTO surgetech_conference.ATTENDEE (FIRST_NAME, LAST_NAME, PHONE, EMAIL, VIP)
VALUES
('Jon', 'Skeeter',4802185842,'john.skeeter@rex.net', 1),
('Sam','Scala',2156783401,'sam.scala@gmail.com', 0),
('Brittany','Fisher',5932857296,'brittany.fisher@outlook.com', 0)

-- insert from another table
INSERT INTO ATTENDEE (FIRST_NAME, LAST_NAME, PHONE, EMAIL)
SELECT FIRST_NAME, LAST_NAME, PHONE, EMAIL
FROM SOME_OTHER_TABLE

-- insert foreign key value
INSERT INTO COMPANY (NAME, DESCRIPTION, PRIMARY_CONTACT_ID)
VALUES ('RexApp Solutions', 'A mobile app delivery service', 3)
DELETE

-- delete values from table
DELETE FROM ATTENDEE
WHERE PHONE IS NULL
AND EMAIL IS NULL

-- e-mail to uppercase
UPDATE ATTENDEE SET EMAIL = UPPER(EMAIL)

-- update name to uppercase
UPDATE ATTENDEE SET FIRST_NAME = UPPER(FIRST_NAME),
LAST_NAME = UPPER(LAST_NAME)



