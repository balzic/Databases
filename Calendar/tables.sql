CREATE TABLE Customers (
	kid INT CONSTRAINT kid PRIMARY KEY,
	name VARCHAR(255),
	address VARCHAR(255)
);

CREATE TABLE Orders (
    ordid INT CONSTRAINT ordid PRIMARY KEY,
    status VARCHAR(255) 
    	CONSTRAINT status CHECK (status IN ('Klar til afsendelse', 'Venter på tekstil', 'Aflyst', 
    		'Venter på tryk', 'Venter på tryk og tekstil', 'Klar til produktion', 'Under produktion', 'Ordre afsendt', 'Ordre færdig')),
    deadline TIMESTAMP,
    kid INT CONSTRAINT orders_kid REFERENCES Customers(kid),
    the_user VARCHAR(255)
);

CREATE TABLE Item (
	ordid INT CONSTRAINT item_ordid REFERENCES Orders(ordid),
	kid INT CONSTRAINT item_kid REFERENCES Customers(kid),
	iid INT CONSTRAINT iid PRIMARY KEY,
	name VARCHAR(255),
	delivery_status VARCHAR(255)
		CONSTRAINT delivery_status CHECK (delivery_status IN ('Venter på levering','Aflyst','Modtaget', 'Overskredet'))
);

CREATE TABLE Event (
	eid INT CONSTRAINT eid PRIMARY KEY,
	ordid INT CONSTRAINT event_ordid REFERENCES Orders(ordid),
	iid INT CONSTRAINT event_iid REFERENCES Item(iid),
	start_time TIMESTAMP,
	end_time TIMESTAMP,
	type VARCHAR(255)
);
