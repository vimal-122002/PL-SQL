 ----------------------------------SUM---------------------------------------

DECLARE
 NUM1 NUMBER:=10;
 NUM2 NUMBER:=10;
 RESULT NUMBER;
 
BEGIN
  RESULT:= NUM1+NUM2;
  DBMS_OUTPUT.PUT_LINE('THE SUM IS '||RESULT);
  
END;

---------------------------PRODUCT AND DIFFERENCE-------------- ------------   

DECLARE
 NUM1 NUMBER :=&NUM1;
 NUM2 NUMBER :=&NUM2;
 PRODUCT NUMBER;
 DIFFERENCE NUMBER;
 
BEGIN

  PRODUCT := NUM1*NUM2;
  DIFFERENCE := NUM1-NUM2;
  
  DBMS_OUTPUT.PUT_LINE('THE PRODUCT IS '||PRODUCT);
  DBMS_OUTPUT.PUT_LINE('THE DIFFERENCE IS '||DIFFERENCE);
  
END;

----------------------------IF STATEMNET------------------------------------
DECLARE
 NUM1 NUMBER :=&NUM1;
 NUM2 NUMBER :=&NUM2;
 
BEGIN
IF NUM1> NUM2 THEN
  DBMS_OUTPUT.PUT_LINE('NUM1 IS GREATEST');
  ELSE
    DBMS_OUTPUT.PUT_LINE('NUM2 IS GREATEST');
    END IF;
  
END; 
 
------------------------------ELSEIF----------------------------------------
DECLARE
    NUM1 NUMBER := &NUM1;

BEGIN
    IF NUM1 > 0 THEN
        DBMS_OUTPUT.PUT_LINE(NUM1 || ' IS POSITIVE');
    ELSIF NUM1 < 0 THEN
        DBMS_OUTPUT.PUT_LINE(NUM1 || ' IS NEGATIVE');
    ELSE
        DBMS_OUTPUT.PUT_LINE(NUM1 || ' IS ZERO');
    END IF;

END;


-------------------------------CASE----------------------------------------


DECLARE
 
CH VARCHAR2(3) := '&CH';  

BEGIN
  CASE
    WHEN CH= 'A' OR CH='a' THEN
      DBMS_OUTPUT.PUT_LINE('VOWEL');
     WHEN CH= 'E' OR CH = 'e' THEN
      DBMS_OUTPUT.PUT_LINE('VOWEL'); 
      WHEN CH= 'I' OR CH= 'i' THEN
      DBMS_OUTPUT.PUT_LINE('VOWEL');
      WHEN CH= 'O' OR CH='o' THEN
      DBMS_OUTPUT.PUT_LINE('VOWEL');
      WHEN CH= 'U' OR CH='u' THEN
      DBMS_OUTPUT.PUT_LINE('VOWEL');
      ELSE
       DBMS_OUTPUT.PUT_LINE('NOT A VOWEL'); 
       
       END CASE;  
END;


---------------------------------LOOP----------------------------------------


DECLARE
    I NUMBER:=1;

BEGIN
    LOOP
      DBMS_OUTPUT.PUT_LINE('HELLO '|| I);
      I:= I+1;
      EXIT WHEN I>5;
      END LOOP;
     

END;

-----------------------------WHILE----------------------------------------------
DECLARE
    I NUMBER:=1;

BEGIN
  WHILE I<=5
    LOOP
      DBMS_OUTPUT.PUT_LINE('HELLO '|| I);
      I:= I+1;
      END LOOP;
     
END;


-------------------------------FOR LOOP---------------------------------------

DECLARE
    I NUMBER;

BEGIN
  FOR I IN 1..5
    LOOP
      DBMS_OUTPUT.PUT_LINE('HELLO '|| I);
      END LOOP;
     
END;
----------------------------REVERSE IN FOR LOOP-------------------------------

DECLARE
    I NUMBER;

BEGIN
  FOR I IN REVERSE 1..5
    LOOP
      DBMS_OUTPUT.PUT_LINE('HELLO '|| I);
      END LOOP;
     
END;


-----------------------------------------------------------------------------

DECLARE
    v_employee_id NUMBER := 1001;
    v_new_salary NUMBER := 80000;
BEGIN
    UPDATE employees
    SET salary = v_new_salary
    WHERE employee_id = v_employee_id;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Salary updated for employee ID: ' || v_employee_id);
END;
-----------------------------------------------------------------------------

DECLARE
    v_employee_id NUMBER := 1001;
BEGIN
    DELETE FROM employees
    WHERE employee_id = v_employee_id;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Employee deleted with ID: ' || v_employee_id);
END;

----------------------------------ODD OR EVEN----------------------------------------------------

DECLARE
    NUM1 NUMBER := &NUM1;
BEGIN
    IF MOD(NUM1, 2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('NUM1 IS EVEN');
    ELSE
        DBMS_OUTPUT.PUT_LINE('NUM1 IS ODD');
    END IF;
END;

----------------------------------PRIME NUMBER--------------------------------------------------

DECLARE
    NUM1 NUMBER := &NUM1; 
    PRIME VARCHAR2(10);
BEGIN
    IF NUM1 < 2 THEN
        PRIME := 'NOT PRIME';
    ELSIF NUM1 = 2 THEN
        PRIME := 'PRIME';
    ELSIF MOD(NUM1, 2) = 0 THEN
        PRIME := 'NOT PRIME';
    ELSE
        PRIME := 'PRIME';
    END IF;

    DBMS_OUTPUT.PUT_LINE(NUM1 || ' is ' || PRIME);
END;

---------------------------------ARMSTRONG NUMBER-------------------------------------------



DECLARE
    NUM1 NUMBER := &NUM1; 
    ARMSTRONG VARCHAR2(20); 
    TEMP NUMBER := NUM1;
    SUM1 NUMBER := 0;
    DIGITS NUMBER;
BEGIN
    WHILE TEMP > 0 LOOP
        DIGITS := MOD(TEMP, 10); 
        SUM1 := SUM1 + POWER(DIGITS, 3); 
        TEMP := FLOOR(TEMP / 10); 
    END LOOP;

    IF SUM1 = NUM1 THEN
        ARMSTRONG := 'ARMSTRONG';
    ELSE
        ARMSTRONG := 'NOT ARMSTRONG';
    END IF;

    DBMS_OUTPUT.PUT_LINE(NUM1 || ' is ' || ARMSTRONG);
END;

-------------------------------------PALINDROME------------------------------------------------------
DECLARE
    NUM1 NUMBER := &NUM1; 
    REVERSED NUMBER := 0;
    ORIGINAL NUMBER := NUM1;
BEGIN

    WHILE NUM1 > 0 LOOP
        REVERSED := REVERSED * 10 + MOD(NUM1, 10);
        NUM1 := FLOOR(NUM1 / 10); 
    END LOOP;

    IF ORIGINAL = REVERSED THEN
        DBMS_OUTPUT.PUT_LINE(ORIGINAL || ' is a PALINDROME');
    ELSE
        DBMS_OUTPUT.PUT_LINE(ORIGINAL || ' is NOT a PALINDROME');
    END IF;
END; 

------------------------------------------------------------------------------

DECLARE
ENO EMP.EMPNO%TYPE;
ENM EMP.ENAME%TYPE;

BEGIN
  SELECT EMPNO,ENAME INTO ENO,ENM FROM EMP WHERE EMPNO=7839;
  DBMS_OUTPUT.PUT_LINE('EMPNO'||ENO);
  END;


--------------------CURSOR-------------------------------------
DECLARE
 Vname EMP.ENAME%TYPE;
 Vjob EMP.JOB%TYPE;
 
 CURSOR C_EMPLIST IS SELECT ENAME,JOB FROM EMP;
 BEGIN
   OPEN C_EMPLIST;
   LOOP FETCH C_EMPLIST INTO Vname,Vjob;
   EXIT WHEN C_EMPLIST%NOTFOUND;
   
   DBMS_OUTPUT.PUT_LINE(Vname||'JOB ROLE IS'||Vjob);
   END LOOP;
    DBMS_OUTPUT.PUT_LINE('NO OF RECORDS'||C_EMPLIST%ROWCOUNT);
    CLOSE C_EMPLIST;
    END;
 
------------------------------------------------------------------

SELECT * FROM DEPT;
SELECT * FROM EMP;

SELECT ENAME,DNAME FROM EMP JOIN DEPT ON DEPT.DEPTNO=EMP.DEPTNO;
-------------------------------------------------------------------
DECLARE
 Ename EMP.ENAME%TYPE;
 Dname DEPT.DNAME%TYPE;
 
 CURSOR C_NAME IS SELECT ENAME,DNAME FROM EMP JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO;
 BEGIN
   OPEN C_NAME;
   LOOP FETCH C_NAME INTO Ename,Dname;
   EXIT WHEN C_NAME%NOTFOUND;
   
   DBMS_OUTPUT.PUT_LINE(Ename||' DEPT NAME IS '||Dname);
   END LOOP;
    DBMS_OUTPUT.PUT_LINE('NO OF RECORDS'||C_NAME%ROWCOUNT);
    CLOSE C_NAME;
    END;
   
-----------------------------------------------------------------

SELECT DNAME ,COUNT(ENAME) AS COUNT FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO GROUP BY DNAME
HAVING COUNT(E.ENAME) >2;

-------------------------------------------------
DECLARE
 Dname DEPT.DNAME%TYPE;
 TOTAL NUMBER;
 
 CURSOR C_NAME IS SELECT DNAME ,COUNT(ENAME) AS COUNT FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO GROUP BY DNAME
HAVING COUNT(E.ENAME) >2;
 BEGIN
   OPEN C_NAME;
   LOOP FETCH C_NAME INTO Dname,TOTAL;
   EXIT WHEN C_NAME%NOTFOUND;
   
   DBMS_OUTPUT.PUT_LINE(Dname||'  TOTAL NUMBER OF EMPLOYEE IS  '||TOTAL);
   END LOOP;
    DBMS_OUTPUT.PUT_LINE('NO OF RECORDS'||C_NAME%ROWCOUNT);
    CLOSE C_NAME;
    END;
  
-------------------------CURSOR WITH PARAMETER--------------------------------------------------------

DECLARE
 Vname EMP.ENAME%TYPE;
 Vjob EMP.JOB%TYPE;
 SAL EMP.SAL%TYPE; 
 CURSOR C_EMPLIST(PARAMETER NUMNBER) IS SELECT SAL,ENAME,JOB FROM EMP WHERE SAL=PARAMETER;
 BEGIN
   OPEN C_EMPLIST(30);
   LOOP FETCH C_EMPLIST INTO Vname,Vjob,SAL;
   EXIT WHEN C_EMPLIST%NOTFOUND;
   
   DBMS_OUTPUT.PUT_LINE('SALARY IS'||SAL);
   END LOOP;
    DBMS_OUTPUT.PUT_LINE('NO OF RECORDS'||C_EMPLIST%ROWCOUNT);
    CLOSE C_EMPLIST;
    END;
 
------------------------------------------REFER CURSOR---------------------- 

DECLARE 

TYPE REFER_CURS_EMP IS REF CURSOR;------CREATING REFERENCE TYPE CURSOR BY USING TYPE--

EMDP_LIST REFER_CURS_EMP; ----DECLARING VARIBALE FOR THE REF  TYPE WE CREATED--

VNAME EMP.ENAME%TYPE;
VSAL EMP.SAL%TYPE;
VDNAME DEPT.DNAME%TYPE;
VLOC DEPT.LOC%TYPE;


BEGIN
   OPEN EMDP_LIST FOR SELECT E.ENAME,E.SAL FROM EMP E;
   DBMS_OUTPUT.PUT_LINE('lIST OF EMPLOYEES');
   DBMS_OUTPUT.PUT_LINE('----------------');
   
   LOOP
     FETCH EMDP_LIST INTO VNAME,VSAL;
     EXIT WHEN EMDP_LIST%NOTFOUND;
     DBMS_OUTPUT.PUT_LINE(' NAME OF EMPLOYEE     ' || VNAME ||'    AND SALARY    '||VSAL);
     END LOOP;
     DBMS_OUTPUT.PUT_LINE('----------------------------------');
     CLOSE EMDP_LIST;
     
     OPEN EMDP_LIST FOR SELECT D.DNAME, D.LOC FROM DEPT D;
      DBMS_OUTPUT.PUT_LINE('DEPT NAME & LOCATIONS');
      DBMS_OUTPUT.PUT_LINE('---------------------');
      
      LOOP
        FETCH EMDP_LIST INTO VDNAME,VLOC;
     EXIT WHEN EMDP_LIST%NOTFOUND;
     DBMS_OUTPUT.PUT_LINE('    NAME OF DEPARTMENT' || VDNAME ||'   LOCATION     '||VLOC);
     END LOOP;
     DBMS_OUTPUT.PUT_LINE('----------');
     CLOSE EMDP_LIST;
     END;
     
 ----------------------------------------------------------
 
 DECLARE
 TYPE REF_CURS_DEPT IS REF CURSOR RETURN DEPT%ROWTYPE;
 
 DEP_LIST REF_CURS_DEPT;
 VDEP_ROW DEPT%ROWTYPE;
 
 BEGIN
   OPEN DEP_LIST FOR SELECT * FROM DEPT; 
   DBMS_OUTPUT.PUT_LINE('DEPARTMENTNAME');
   DBMS_OUTPUT.PUT_LINE('-----------------');
   
   LOOP
     FETCH DEP_LIST INTO VDEP_ROW;
     EXIT WHEN DEP_LIST%NOTFOUND;
     DBMS_OUTPUT.PUT_LINE(' DEPARTMENTNO   ' || VDEP_ROW.DEPTNO);
     DBMS_OUTPUT.PUT_LINE(' DEPARTNMENTNAME  ' || VDEP_ROW.DNAME);
     DBMS_OUTPUT.PUT_LINE(' DEPARTMENTLOCATION ' || VDEP_ROW.LOC);
     DBMS_OUTPUT.PUT_LINE('-----------------');
     END LOOP;
     CLOSE DEP_LIST;
     END;
        
--------------------------------PROCEDURE-------------------------------------------

CREATE OR REPLACE PROCEDURE PROC_GREETINGS
AS
BEGIN
  DBMS_OUTPUT.put_line('HAPPY LEARNING');
  END;
  
 BEGIN
   PROC_GREETINGS;
   END;
   
       
CREATE OR REPLACE PROCEDURE PROC_GREETINGS2(VNAME VARCHAR2)
AS
BEGIN
  DBMS_OUTPUT.put_line('WELCOME  '||VNAME);
  END;
  
  BEGIN
   PROC_GREETINGS2('VIMAL');
   END;
  
  
--------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE PROC_MULTI(X IN NUMBER, Y IN NUMBER)
AS
    Z NUMBER;
BEGIN
    Z := X * Y;
    DBMS_OUTPUT.put_line('RESULT: ' || Z);
END;


BEGIN
    PROC_MULTI(10, 5);
END;




--------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE PROC_MULTI(X IN OUT NUMBER, Y IN NUMBER)
AS
BEGIN
    X := X * Y;
    END;
    
    
    DECLARE 
    A NUMBER:= &A;
    B NUMBER:= &B;
    
    BEGIN
      PROC_MULTI(A,B);
      DBMS_OUTPUT.put_line('PRODUCT  ' || A);
      END;

-------------------------------------------------------------------------------


CREATE OR REPLACE PROCEDURE PROC_DEPT1(IN_DEPTNO IN NUMBER, IN_DNAME IN VARCHAR2, IN_LOC IN VARCHAR2)
AS
BEGIN
    INSERT INTO DEPT(DEPTNO, DNAME, LOC) VALUES(IN_DEPTNO, IN_DNAME, IN_LOC);
    DBMS_OUTPUT.PUT_LINE('DEPARTMENT ADDED ' || IN_DEPTNO || ' SUCCESSFULLY'); 
END;


BEGIN
    PROC_DEPT1(21, 'DIGITAL', 'NEW YORK');
END;

-------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE DELETE_DEPT1(DEPID DEPT.DEPTNO%type)
AS
BEGIN
    DELETE FROM DEPT WHERE DEPTNO= DEPID;
    DBMS_OUTPUT.PUT_LINE('DEPARTMENT DELETED ' || DEPID || ' SUCCESSFULLY'); 
END;


BEGIN
    DELETE_DEPT1();
END;

-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE LIST_EMPLOYEES
AS
    ENAME EMPLOYEENAME.EMPNAME%TYPE;
    DEPNAME DEPT.DEPTNAME%TYPE;  

    CURSOR CUR_NAMES IS 
        SELECT ENAME, DNAME FROM EMP JOIN DEPT ON DEPT.DEPTNO = EMP.DEPTNO;

BEGIN
    OPEN CUR_NAMES;
    LOOP
        FETCH CUR_NAMES INTO ENAME, DEPNAME;
        EXIT WHEN CUR_NAMES%NOTFOUND;  
        DBMS_OUTPUT.put_line('NAME OF EMPLOYEE: ' || ENAME || ' DEPARTMENT: ' || DEPNAME); 
    END LOOP;
    
    DBMS_OUTPUT.put_line('------------------------');
    DBMS_OUTPUT.put_line('TOTAL RECORDS: ' || CUR_NAMES%ROWCOUNT);  
    CLOSE CUR_NAMES;
END;

---------------------------------FUNCTIONS-------------------------------------------------   
 
CREATE OR REPLACE  FUNCTION EMPLOYEE_FUNCTION (V_EMP IN NUMBER)
RETURN NUMBER
IS
V_SAL NUMBER;
V_N_SAL NUMBER;
BEGIN
  SELECT SAL INTO V_SAL FROM EMP WHERE EMPNO=V_EMP;
  IF(V_SAL>1500) THEN
  V_N_SAL:= V_SAL + (V_SAL*0.1);
  ELSE
    V_N_SAL:= V_SAL + (V_SAL*0.2);
    END IF;
    RETURN V_SAL;
    END;
    
    
SELECT EMPLOYEE_FUNCTION(7900) FROM DUAL;
   

SELECT * FROM EMP;


------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION FUN_SUM1(X IN NUMBER, Y IN NUMBER)
RETURN NUMBER
IS
BEGIN 
  RETURN X + Y;
END;
 
DECLARE
    SUM1 NUMBER;
BEGIN
    SUM1 := FUN_SUM1(200, 20);
    DBMS_OUTPUT.PUT_LINE('SUM IS ' || SUM1);
END;


SELECT ENAME,FUN_SUM1(SAL,COMM)TOTALSALARY FROM EMP;

----------------------------ARRAY--------------------------------------

declare
type v_arr is varray(4) of varchar2(40);
v_color v_arr := v_arr(null,null,null,null);

begin
  v_color(1) := 'Red';
  v_color(2) := 'Green';
  v_color(3) := 'Blue';
  v_color(4) := 'Black';
  
  for i in 1..v_color.count
    loop
      dbms_output.put_line(v_color(i));
      end loop;
      end;
  
-------------------------------Exceptions-----------------------------------------------
      
DECLARE
 CREDIT_LIMIT EXCEED EXCEPTION;
 PRAGMA EXCEPTION_INIT(CREDIT_LIMIT_EXCEED,-20111);
 
 
 I_CUSTOMER_ID CUSTOMERS.CUSTOMER_ID%TYPE:= CUSTOMER_ID;
 I_CREDIT_LIMIT CUSTOMERS.CREDIT_LIMIT%TYPE:= &CREDIT_LIMIT;
 I_CUSTOMER_CREDIT CUSTOMERS.CREDIT_LIMIT%TYPE;
 
 BEGIN
   SELECT CREDIT_LIMIT INTO I_CUSTOMER_CREDIT
   FROM CUSTOMERS WHERE CUSTOMER_ID = I_CUSTOMER_ID;
   
   
   IF I_CUSTOMER_CREDIT. I_CREDIT_LIMIT THEN
     RAISE_APPLICATION_ERROR(-20111,'CREDIT LIMIT EXCEEDED');
     END IF;
     DMBS_OUTPUT.PUT_LINE('CREDIT LIMIT IS CHECKED AND PASSED');
     
     
     EXCEPTION
       WHEN NO_DATA_FOUND THEN
         DBMS_OUTPUT.put_line('CUSTOMER EITH ID' || I_CUSTOMER_ID ||'DOES NOT EXIST');
         END;
         
------------------------------------TRIGGERS-----------------------------------------

CREATE OR REPLACE TRIGGER TRIGGER_DML2
BEFORE INSERT
ON EMP
FOR EACH ROW
  BEGIN
    DBMS_OUTPUT.put_line('INSERTING RECORD.... TRIGGER MSG');
    END;
    
CREATE OR REPLACE TRIGGER TRIGGER_DML1
AFTER INSERT
ON EMP
FOR EACH ROW
  BEGIN
    DBMS_OUTPUT.put_line('RECORD INSERTED.... TRIGGER MSG');
    END;
       
    
    
CREATE OR REPLACE TRIGGER NO_DELETION
BEFORE DELETE
ON EMP
  BEGIN
    RAISE_APPLICATION_ERROR(-20000,'DELETEION NOT SUPPORTED IN THIS TABLE');
    END; 
    
    DELETE FROM EMP WHERE EMPNO=7839;   

SELECT * FROM EMP;

----------------------------------------------------------------------


CREATE TABLE EMP_HISTORY1 AS SELECT *  FROM EMP;

SELECT * FROM EMP_HISTORY1;

DELETE FROM EMP_HISTORY1;

------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER TRIGGER_DEL_EMPLOYEE
BEFORE DELETE ON EMP
FOR EACH ROW
   BEGIN
     INSERT INTO EMP_HISTORY1 VALUES
     (:OLD.EMPNO,:OLD.ENAME,:OLD.JOB,:OLD.MGR,:OLD.HIREDATE,:OLD.SAL,:OLD.COMM,OLD.DEPTNO);
     DBMS_OUTPUT.put_line('TOOK BACKUP');
     END;
     
     
DELETE FROM EMP WHERE EMPNO=7002;

SELECT * FROM EMP_HISTORY1;

ALTER TRIGGER TRIGGER_DEL_EMPLOYEE DISABLE;

SELECT * FROM EMP; 


-------------------------------------EMI CALCULATOR------------------------------

CREATE OR REPLACE FUNCTION EMI_CAL(P NUMBER,N NUMBER,R number)
RETURN NUMBER IS
V_EMI NUMBER;
BEGIN
  V_EMI:=(P*R*((1+R)**N))/(((1+R)**N)-1);

RETURN V_EMI;
END;
DECLARE
EMI number;
begin
  EMI:=EMI_CAL(100000,12,12);
  dbms_output.put_line('EMI IS '||EMI);
end;


---------------------------------MARK-------------------------------------------
CREATE OR REPLACE FUNCTION GRADE(MARK NUMBER)
RETURN VARCHAR2
IS
    grade VARCHAR2(10);
BEGIN
    CASE 
        WHEN MARK >= 90 THEN
            grade := 'A+';
        WHEN MARK >= 80 THEN
            grade := 'A';
        WHEN MARK >= 70 THEN
            grade := 'B';
        WHEN MARK >= 60 THEN
            grade := 'C';
        WHEN MARK >= 50 THEN
            grade := 'D';
        WHEN MARK >= 40 THEN
            grade := 'E';
        ELSE 
            grade := 'F';
    END CASE;

    RETURN grade;
END;

DECLARE
    s_grade VARCHAR2(10);
BEGIN
    s_grade := GRADE(30); 
    DBMS_OUTPUT.PUT_LINE('Grade is ' || s_grade);
END;



-----------------------------------------VIEW----------------------------------------

CREATE OR REPLACE VIEW COM_EMP_DEP_VIEWNEW1 AS
SELECT E.EMPNO, E.ENAME, E.JOB,E.HIREDATE,E.SAL,E.COMM,E.DEPTNO,D.DNAME,D.LOC
FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO;


CREATE OR REPLACE TRIGGER TRG_EMPDP_VIEW2
INSTEAD OF INSERT ON COM_EMP_DEP_VIEWNEW1
DECLARE
CHECK_EXISTS NUMBER;
BEGIN
  SELECT COUNT(*) INTO CHECK_EXISTS FROM DEPT D WHERE D.DEPTNO=:NEW.DEPTNO;
  IF CHECK_EXISTS=0 THEN
    INSERT INTO DEPT(DEPTNO,DNAME,LOC)VALUES(:NEW.DEPTNO,:NEW.DNAME,:NEW.LOC);
    END IF;
    INSERT INTO EMP(EMPNO,ENAME,JOB,HIREDATE,SAL,COMM,DEPTNO)VALUES(:NEW.EMPNO,:NEW.ENAME,:NEW.JOB,:NEW.HIREDATE,:NEW.SAL,:NEW.COMM,:NEW.DEPTNO);
END;


INSERT INTO COM_EMP_DEP_VIEWNEW1(EMPNO, ENAME, JOB, HIREDATE, SAL, COMM, DEPTNO, DNAME, LOC)
VALUES(1112, 'RAJU', 'ANALYST', '12-JAN-2023', 3000, 200, 99, 'MARKETING', 'NEWYORK');


SELECT * FROM COM_EMP_DEP_VIEWNEW1 WHERE EMPNO=1112;
---------------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE DEPT_PACKAGE1 IS
    BONUS_RATE NUMBER := 0.10;
    PROCEDURE ADD_RECORD(D_DEPTNO IN NUMBER, D_DNAME IN VARCHAR2, D_LOC IN VARCHAR2);
    FUNCTION CALC_BONUS(P_SAL IN NUMBER) RETURN NUMBER;
END DEPT_PACKAGE1; 
/

CREATE OR REPLACE PACKAGE BODY DEPT_PACKAGE1 IS
    PROCEDURE ADD_RECORD(D_DEPTNO IN NUMBER, D_DNAME IN VARCHAR2, D_LOC IN VARCHAR2) IS
    BEGIN
        INSERT INTO DEPT(DEPTNO, DNAME, LOC) VALUES (D_DEPTNO, D_DNAME, D_LOC);
        DBMS_OUTPUT.PUT_LINE('DEPARTMENT ' || D_DNAME || ' SUCCESSFULLY ADDED');
    END ADD_RECORD;

    FUNCTION CALC_BONUS(P_SAL IN NUMBER) RETURN NUMBER AS
        BONUS NUMBER;
    BEGIN
        BONUS := P_SAL * BONUS_RATE;
        RETURN BONUS;
    END CALC_BONUS;
END DEPT_PACKAGE1;
/

BEGIN 
    DEPT_PACKAGE1.ADD_RECORD(54, 'Sales', 'delhi');
END;
/
select ename,DEPT_PACKAGE1.CALC_BONUS(sal) as bonus from emp;

select * from dept;

--------------------------------records and collections------------------------------------------------------

DECLARE
  emp_rec emp%ROWTYPE;
BEGIN
  SELECT * INTO emp_rec FROM emp WHERE empno = 7839;
  DBMS_OUTPUT.PUT_LINE('Job Role: ' || emp_rec.job);
END;


DECLARE
  CURSOR EM_CURS IS
    SELECT EMPNO, ENAME, SAL FROM EMP;
  emp_rec EM_CURS%ROWTYPE;  
BEGIN
  OPEN EM_CURS;
  LOOP
    FETCH EM_CURS INTO emp_rec;  
    EXIT WHEN EM_CURS%NOTFOUND;  
    DBMS_OUTPUT.PUT_LINE(emp_rec.EMPNO || ' ' || emp_rec.ENAME || ' ' || emp_rec.SAL);
  END LOOP;
  CLOSE EM_CURS;  
END;


DECLARE
  TYPE MYREC_TYPE IS RECORD (STUDENT_NAME VARCHAR2(30), AGE NUMBER);
  MY_REC MYREC_TYPE;
BEGIN
  MY_REC.STUDENT_NAME := 'OK';  
  MY_REC.AGE := 22;
  
  DBMS_OUTPUT.PUT_LINE(MY_REC.STUDENT_NAME || ' ' || MY_REC.AGE);
END;


DECLARE
  TYPE MYREC_TYPE IS RECORD (RNAME VARCHAR2(30), RSALARY NUMBER);
  MY_REC MYREC_TYPE;
BEGIN
  SELECT ENAME,SAL INTO MY_REC FROM EMP WHERE EMPNO=7839;
  
  DBMS_OUTPUT.PUT_LINE(MY_REC.RNAME || ' ' || MY_REC.RSALARY);
END;

-------------------------------------TRANSACTIONS----------------------------------------------

CREATE OR REPLACE PROCEDURE PROCESS22
IS PRAGMA AUTONOMOUS_TRANSACTION;

BEGIN
  INSERT INTO DEPT VALUES(82,'Sales','delhi');
  
  INSERT INTO DEPT VALUES(72,'Sales','delhi');
  SAVEPOINT PROC1;
  
  INSERT INTO DEPT VALUES(93,'Sales','delhi');
  ROLLBACK TO PROC1;
  COMMIT;
  END;
  
  
BEGIN
  PROCESS22;
  END;
  
SELECT * FROM DEPT where deptno=72;

------------------------------bulk-------------------------------------------------

DECLARE
 TYPE T_RECORD IS RECORD(VNAME VARCHAR2(35), VSALARY NUMBER);
 
 TYPE T_TABLE IS TABLE OF t_RECORD;
 
 T_EMPLOYEE T_TABLE;
 BEGIN
   SELECT ENAME,SAL BULK COLLECT INTO T_EMPLOYEE FROM EMP;
   DBMS_OUTPUT.PUT_LINE('EMPLOYEE DATA');
   DBMS_OUTPUT.put_line('-------------');
   
   FOR I IN T_EMPLOYEE.FIRST..T_EMPLOYEE.LAST
     LOOP
       DBMS_OUTPUT.PUT_LINE(T_EMPLOYEE(I).VNAME||' WITH A SALARY OF '||T_EMPLOYEE(I).VSALARY);
       
       END LOOP;
       END;
        
---------------------------------------------------------------------------------
DECLARE
    C_LIMIT CONSTANT PLS_INTEGER DEFAULT 3;
    CURSOR EMPLOYEE_CUR IS SELECT * FROM EMP;

    TYPE EMP_TB IS TABLE OF EMP%ROWTYPE INDEX BY BINARY_INTEGER;
    EMP_T EMP_TB;
BEGIN
    OPEN EMPLOYEE_CUR;
    LOOP
        FETCH EMPLOYEE_CUR BULK COLLECT INTO EMP_T LIMIT C_LIMIT; 
        EXIT WHEN EMP_T.COUNT = 0;
        DBMS_OUTPUT.put_line('RETRIEVED ROWS ' || EMP_T.COUNT);
        
        FOR I IN 1 .. EMP_T.COUNT LOOP
            DBMS_OUTPUT.put_line(EMP_T(I).EMPNO || ' - ' || EMP_T(I).ENAME);
        END LOOP;
    END LOOP;
    CLOSE EMPLOYEE_CUR;
END;

---------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE UPD_DYN_PROC_VIMAL(P_TABLE VARCHAR2, P_COLUMN VARCHAR2, N_VALUE VARCHAR2, P_CONDITION VARCHAR2)
AS
    V_SQL VARCHAR2(1000);
BEGIN
    V_SQL := 'UPDATE ' || P_TABLE || ' SET ' || P_COLUMN || ' = :1 WHERE ' || P_CONDITION;
    EXECUTE IMMEDIATE V_SQL USING N_VALUE;
    DBMS_OUTPUT.PUT_LINE('UPDATED... ' || V_SQL);
END;


BEGIN
    UPD_DYN_PROC_VIMAL('DEPT', 'LOC', 'Delhi', 'DEPTNO = 60');
END;

    
    SELECT * FROM DEPT;
    
-----------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE UPD_DYN_PROC_VIMAL1(P_TABLE VARCHAR2, P_CONDITION VARCHAR2)
AS
    V_SQL VARCHAR2(1000);
BEGIN
    V_SQL := 'DELETE FROM ' || P_TABLE || ' WHERE ' || P_CONDITION;
    EXECUTE IMMEDIATE V_SQL;
    DBMS_OUTPUT.PUT_LINE('DELETED... ' || V_SQL);
END;

BEGIN
    UPD_DYN_PROC_VIMAL1('DEPT', 'DEPTNO = 41');
END;

SELECT * FROM DEPT WHERE DEPTNO=41;

----------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE UPD_DYN_PROC_VIMAL1(P_TABLE VARCHAR2, P_DEPTNO NUMBER, P_DNAME VARCHAR2, P_LOC VARCHAR2)
AS
    V_SQL VARCHAR2(1000);
BEGIN
    V_SQL := 'INSERT INTO ' || P_TABLE || ' (DEPTNO, DNAME, LOC) VALUES (:1, :2, :3)';
    EXECUTE IMMEDIATE V_SQL USING P_DEPTNO, P_DNAME, P_LOC;
    DBMS_OUTPUT.PUT_LINE('INSERTED... ' || V_SQL);
END;


BEGIN
    UPD_DYN_PROC_VIMAL1('DEPT', 47, 'Sales', 'Delhi');
END;


SELECT * FROM DEPT WHERE DEPTNO=47;


---------------------------------------------------------------------------------










