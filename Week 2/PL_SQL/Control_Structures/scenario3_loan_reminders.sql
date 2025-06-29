DECLARE
  v_due_date loans.due_date%TYPE;
  v_customer_name customers.name%TYPE;
BEGIN
  FOR rec IN (SELECT l.loan_id, l.due_date, c.name
                FROM loans l
                JOIN customers c ON l.customer_id = c.customer_id
               WHERE l.due_date BETWEEN SYSDATE AND SYSDATE + 30)
  LOOP
    DBMS_OUTPUT.PUT_LINE('Reminder: Loan ' || rec.loan_id || ' for customer ' || rec.name ||
                         ' is due on ' || TO_CHAR(rec.due_date, 'DD-MON-YYYY'));
  END LOOP;
END;
/ 