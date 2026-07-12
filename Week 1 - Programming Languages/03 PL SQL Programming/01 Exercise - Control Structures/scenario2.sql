-- add isvip col
ALTER TABLE Customers
ADD IsVIP CHAR(1);

SET SERVEROUTPUT ON;

BEGIN

    FOR customer_rec IN (
        SELECT CustomerID, Balance
        FROM Customers
    )
    LOOP
        IF customer_rec.Balance > 10000 THEN
            UPDATE Customers
            SET IsVIP = 'Y'
            WHERE CustomerID = customer_rec.CustomerID;

            DBMS_OUTPUT.PUT_LINE(
                'VIP assigned to Customer ID: '
                || customer_rec.CustomerID
            );
        END IF;
    END LOOP;

    COMMIT;

END;
/