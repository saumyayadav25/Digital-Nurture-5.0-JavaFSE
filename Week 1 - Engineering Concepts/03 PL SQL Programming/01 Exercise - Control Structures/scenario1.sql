SET SERVEROUTPUT ON;

DECLARE
    age NUMBER;
BEGIN

    FOR customer_rec IN (
        SELECT CustomerID, DOB
        FROM Customers
    )
    LOOP
        age := TRUNC(
            MONTHS_BETWEEN(SYSDATE, customer_rec.DOB) / 12
        );

        IF age > 60 THEN
            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE CustomerID = customer_rec.CustomerID;

            DBMS_OUTPUT.PUT_LINE(
                'Discount applied to Customer ID: '
                || customer_rec.CustomerID
            );
        END IF;
    END LOOP;
    COMMIT;

END;
/