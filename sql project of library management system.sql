-- Step 1: Create Database and Use It
CREATE DATABASE library_demo;
USE library_demo;

-- Step 2: Create readers Table
CREATE TABLE readers (
    reader_id VARCHAR(6),
    fname VARCHAR(30),
    mname VARCHAR(30),
    ltname VARCHAR(30),
    city VARCHAR(15),
    mobileno VARCHAR(10),
    occupation VARCHAR(10),
    dob DATE,
    CONSTRAINT readers_pk PRIMARY KEY(reader_id)
);

-- Step 3: Insert Values into readers (added commas and corrected column name)
INSERT INTO readers VALUES("00001", "ramesh", "chandra", "sharma", "delhi", "9876456787", "service", "2015-11-05");
INSERT INTO readers VALUES("00002", "hemant", NULL, "sharma", "delhi", "9867456797", "worker", "2019-01-09");
INSERT INTO readers VALUES("00003", "atul", NULL, "mittal", "haryana", "9876234562", "service", "2020-02-05");
INSERT INTO readers VALUES("00004", "akileshwar", "prasad", "sharma", "mumbai", "8765456789", "seller", "2016-11-05");
INSERT INTO readers VALUES("00005", "sachin", NULL, "gupta", "delhi", "9976450788", "business", "2019-04-06");
INSERT INTO readers VALUES("00006", "rahul", "kumar", "yadav", "delhi", "9070456797", "doctor", "2015-07-01");
INSERT INTO readers VALUES("00007", "diya", NULL, "sharma", "delhi", "8876456735", "engineer", "2025-11-05");
INSERT INTO readers VALUES("00008", "gungun", "lalit", "sharma", "up", "9864096744", "teacher", "2024-01-17");
INSERT INTO readers VALUES("00009", "hemlata", "kumari", "joshi", "pune", "786456284", "nurse", "2023-09-14");
INSERT INTO readers VALUES("00010", "kashish", NULL, "kaushik", "rajasthan", "8873566712", "trainer", "2025-07-29");
INSERT INTO readers VALUES("00011", "khushi", NULL, "dubey", "assam", "7896541230", "worker", "2023-07-09");
INSERT INTO readers VALUES("00012", "anamika", "gautam", "kumari", "bihar", "9845632178", "teacher", "2025-09-16");

SELECT * FROM readers;

-- Step 4: Create book Table
CREATE TABLE book (
    bid VARCHAR(6),
    bname VARCHAR(40),
    bdomain VARCHAR(40),
    CONSTRAINT book_id_pk PRIMARY KEY (bid)
);

-- Step 5: Insert into book
INSERT INTO book VALUES ("B00001", "The Cat in the Hat", "Story");
INSERT INTO book VALUES ("B00002", "The Brain", "Story");
INSERT INTO book VALUES ("B00003", "The Living World", "Chapter");

-- Step 6: Create active_readers Table
CREATE TABLE active_readers (
    account_id VARCHAR(6),
    reader_id VARCHAR(6),
    bid VARCHAR(6),
    atype VARCHAR(10),
    astatus VARCHAR(10),
    CONSTRAINT activereaders_acnumber_pk PRIMARY KEY(account_id),
    CONSTRAINT account_readerid_fk FOREIGN KEY(reader_id) REFERENCES readers(reader_id),
    CONSTRAINT account_bid_fk FOREIGN KEY(bid) REFERENCES book(bid)
);

-- Step 7: Insert into active_readers (Corrected table name - was mistakenly written as book)
INSERT INTO active_readers VALUES ("A00001", "00001", "B00001", "Premium", "Active");
INSERT INTO active_readers VALUES ("A00002", "00002", "B00002", "Regular", "Active");
INSERT INTO active_readers VALUES ("A00003", "00003", "B00003", "Premium", "Active");
INSERT INTO active_readers VALUES ("A00004", "00004", "B00001", "Regular", "Active");
INSERT INTO active_readers VALUES ("A00005", "00005", "B00002", "Premium", "Suspended");
INSERT INTO active_readers VALUES ("A00006", "00006", "B00003", "Premium", "Active");
INSERT INTO active_readers VALUES ("A00007", "00007", "B00001", "Regular", "Active");
INSERT INTO active_readers VALUES ("A00008", "00008", "B00002", "Premium", "Active");
INSERT INTO active_readers VALUES ("A00009", "00009", "B00003", "Premium", "Active");
INSERT INTO active_readers VALUES ("A00010", "00010", "B00001", "Regular", "Active");
INSERT INTO active_readers VALUES ("A00011", "00011", "B00002", "Premium", "Terminated");
INSERT INTO active_readers VALUES ("A00012", "00012", "B00003", "Premium", "Active");

SELECT * FROM active_readers;

-- Step 8: Create bookissue_details Table (Fixed foreign key reference)
CREATE TABLE bookissue_details (
    issuenumber VARCHAR(6),
    account_id VARCHAR(6),
    bid VARCHAR(6),
    bookname VARCHAR(50),
    numbers_of_book_issued INT,
    CONSTRAINT trandetails_tnumber_pk PRIMARY KEY(issuenumber),
    CONSTRAINT trandetails_acnumber_fk FOREIGN KEY(account_id) REFERENCES active_readers(account_id),
    CONSTRAINT trandetails_bid_fk FOREIGN KEY(bid) REFERENCES book(bid)
);

-- Step 9: Insert into bookissue_details
INSERT INTO bookissue_details VALUES ("T00001", "A00001", "B00001", "The Cat in the Hat", 2);
INSERT INTO bookissue_details VALUES ("T00002", "A00001", "B00003", "The Living World", 4);
INSERT INTO bookissue_details VALUES ("T00003", "A00002", "B00001", "The Cat in the Hat", 4);
INSERT INTO bookissue_details VALUES ("T00004", "A00002", "B00003", "The Living World", 5);

-- Step 10: Queries
SELECT * FROM active_readers;
SELECT * FROM active_readers WHERE astatus = "Terminated";
SELECT * FROM active_readers WHERE astatus = "Active";
SELECT COUNT(account_id) FROM active_readers WHERE atype = "Premium";
