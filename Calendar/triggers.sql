-- Function and trigger for incrementing primary key of Customers
CREATE OR REPLACE FUNCTION IncrementId() RETURNS TRIGGER AS $IncrementId$
DECLARE highestkid INT;
BEGIN  

    SELECT MAX(kid) INTO highestkid
    FROM Customers;

    IF (highestkid IS NULL) THEN
	NEW.kid = 0;
    ELSE
        NEW.kid = highestkid + 1;
    END IF;

    return NEW;    
END;
$IncrementId$ LANGUAGE plpgsql;

CREATE TRIGGER CustomersId
BEFORE INSERT ON Customers
FOR EACH ROW
EXECUTE PROCEDURE IncrementId();

-- Function and trigger for incrementing primary key of Orders
CREATE OR REPLACE FUNCTION IncrementOId() RETURNS TRIGGER AS $IncrementOId$
DECLARE highestordid INT;
BEGIN  

    SELECT MAX(ordid) INTO highestordid
    FROM Orders;

    IF (highestordid IS NULL) THEN
	NEW.ordid = 0;
    ELSE
        NEW.ordid = highestordid + 1;
    END IF;

    return NEW;    
END;
$IncrementOId$ LANGUAGE plpgsql;

CREATE TRIGGER OrderId
BEFORE INSERT ON Orders
FOR EACH ROW
EXECUTE PROCEDURE IncrementOId();

-- Function and trigger for incrementing primary key of Item
CREATE OR REPLACE FUNCTION IncrementIId() RETURNS TRIGGER AS $IncrementIId$
DECLARE highestiid INT;
BEGIN  

    SELECT MAX(iid) INTO highestiid
    FROM Item;

    IF (highestiid IS NULL) THEN
	NEW.iid = 0;
    ELSE
        NEW.iid = highestiid + 1;
    END IF;

    return NEW;    
END;
$IncrementIId$ LANGUAGE plpgsql;


CREATE TRIGGER ItemId
BEFORE INSERT ON Item
FOR EACH ROW
EXECUTE PROCEDURE IncrementIId();

-- Function and trigger for incrementing primary key of Event
CREATE OR REPLACE FUNCTION IncrementEId() RETURNS TRIGGER AS $IncrementEId$
DECLARE highesteid INT;
BEGIN  

    SELECT MAX(eid) INTO highesteid
    FROM Event;

    IF (highesteid IS NULL) THEN
	    NEW.eid = 0;
    ELSE
        NEW.eid = highesteid + 1;
    END IF;

    return NEW;    
END;
$IncrementEId$ LANGUAGE plpgsql;


CREATE TRIGGER EventId
BEFORE INSERT ON Event
FOR EACH ROW
EXECUTE PROCEDURE IncrementEId();

INSERT INTO Customers(kid,name,address) VALUES (0,'Saxo Bank', 'Hellerup');
