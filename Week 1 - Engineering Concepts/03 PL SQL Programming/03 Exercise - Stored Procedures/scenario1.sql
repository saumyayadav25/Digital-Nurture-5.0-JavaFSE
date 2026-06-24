CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS
BEGIN

    FOR acc IN (
        SELECT AccountID, Balance
        FROM Accounts
        WHERE AccountType = 'Savings'
    )
    LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Account ID: ' || acc.AccountID ||
            ' | Old Balance: ' || acc.Balance
        );

        UPDATE Accounts
        SET Balance = Balance + (Balance * 0.01)
        WHERE AccountID = acc.AccountID;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        'Monthly interest processed successfully.'
    );

END;
/

-- running procedure
BEGIN
    ProcessMonthlyInterest;
END;
/

SELECT AccountID, AccountType, Balance
FROM Accounts
WHERE AccountType = 'Savings';