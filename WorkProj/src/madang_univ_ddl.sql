/* ���� */
CREATE TABLE Professor (
	ssn NUMBER NOT NULL, /* ���̵� */
	name VARCHAR2(40) NOT NULL, /* �̸� */
	age NUMBER NOT NULL, /* ���� */
	rank CHAR, /* ���� */
	speciality VARCHAR2(40) /* ���� �о� */
);

CREATE UNIQUE INDEX PK_Professor
	ON Professor (
		ssn ASC
	);

ALTER TABLE Professor
	ADD
		CONSTRAINT PK_Professor
		PRIMARY KEY (
			ssn
		);

/* �а� */
CREATE TABLE Dept (
	dno NUMBER NOT NULL, /* �а���ȣ */
	ssn NUMBER, /* ���̵� */
	dname VARCHAR2(40), /* �а��̸� */
	office VARCHAR2(40) /* �а��繫�� */
);

CREATE UNIQUE INDEX PK_Dept
	ON Dept (
		dno ASC
	);

ALTER TABLE Dept
	ADD
		CONSTRAINT PK_Dept
		PRIMARY KEY (
			dno
		);

/* ���п��� */
CREATE TABLE Graduate (
	ssn NUMBER NOT NULL, /* ���̵� */
	name VARCHAR2(40) NOT NULL, /* �̸� */
	age NUMBER NOT NULL, /* ���� */
	deg_prog VARCHAR2(30), /* �������� */
	adssn NUMBER, /* ���� ���п��� */
	dno NUMBER /* �а���ȣ */
);

CREATE UNIQUE INDEX PK_Graduate
	ON Graduate (
		ssn ASC
	);

ALTER TABLE Graduate
	ADD
		CONSTRAINT PK_Graduate
		PRIMARY KEY (
			ssn
		);

/* ���� */
CREATE TABLE Project (
	pid NUMBER NOT NULL, /* ������ȣ */
	sponsor VARCHAR2(40), /* ������� */
	start_date DATE, /* ������ */
	end_date DATE, /* ������ */
	budget INTEGER, /* ����� */
	ssn NUMBER /* ���̵� */
);

CREATE UNIQUE INDEX PK_Project
	ON Project (
		pid ASC
	);

ALTER TABLE Project
	ADD
		CONSTRAINT PK_Project
		PRIMARY KEY (
			pid
		);

/* �а�_�ٹ� */
CREATE TABLE work_dept (
	dno NUMBER NOT NULL, /* �а���ȣ */
	ssn NUMBER NOT NULL, /* ���̵� */
	pct_time NUMBER /* ��������� */
);

CREATE UNIQUE INDEX PK_work_dept
	ON work_dept (
		dno ASC,
		ssn ASC
	);

ALTER TABLE work_dept
	ADD
		CONSTRAINT PK_work_dept
		PRIMARY KEY (
			dno,
			ssn
		);

/* ����_���� */
CREATE TABLE work_in (
	ssn NUMBER NOT NULL, /* ���̵� */
	pid NUMBER NOT NULL /* ������ȣ */
);

CREATE UNIQUE INDEX PK_work_in
	ON work_in (
		ssn ASC,
		pid ASC
	);

ALTER TABLE work_in
	ADD
		CONSTRAINT PK_work_in
		PRIMARY KEY (
			ssn,
			pid
		);

/* ����_���п��� */
CREATE TABLE work_prog (
	ssn NUMBER NOT NULL, /* ���̵� */
	pid NUMBER NOT NULL /* ������ȣ */
);

CREATE UNIQUE INDEX PK_work_prog
	ON work_prog (
		ssn ASC,
		pid ASC
	);

ALTER TABLE work_prog
	ADD
		CONSTRAINT PK_work_prog
		PRIMARY KEY (
			ssn,
			pid
		);

ALTER TABLE Dept
	ADD
		CONSTRAINT FK_Professor_TO_Dept
		FOREIGN KEY (
			ssn
		)
		REFERENCES Professor (
			ssn
		);

ALTER TABLE Graduate
	ADD
		CONSTRAINT FK_Graduate_TO_Graduate
		FOREIGN KEY (
			adssn
		)
		REFERENCES Graduate (
			ssn
		);

ALTER TABLE Graduate
	ADD
		CONSTRAINT FK_Dept_TO_Graduate
		FOREIGN KEY (
			dno
		)
		REFERENCES Dept (
			dno
		);

ALTER TABLE Project
	ADD
		CONSTRAINT FK_Professor_TO_Project
		FOREIGN KEY (
			ssn
		)
		REFERENCES Professor (
			ssn
		);

ALTER TABLE work_dept
	ADD
		CONSTRAINT FK_Dept_TO_work_dept
		FOREIGN KEY (
			dno
		)
		REFERENCES Dept (
			dno
		);

ALTER TABLE work_dept
	ADD
		CONSTRAINT FK_Professor_TO_work_dept
		FOREIGN KEY (
			ssn
		)
		REFERENCES Professor (
			ssn
		);

ALTER TABLE work_in
	ADD
		CONSTRAINT FK_Professor_TO_work_in
		FOREIGN KEY (
			ssn
		)
		REFERENCES Professor (
			ssn
		);

ALTER TABLE work_in
	ADD
		CONSTRAINT FK_Project_TO_work_in
		FOREIGN KEY (
			pid
		)
		REFERENCES Project (
			pid
		);

ALTER TABLE work_prog
	ADD
		CONSTRAINT FK_Graduate_TO_work_prog
		FOREIGN KEY (
			ssn
		)
		REFERENCES Graduate (
			ssn
		);

ALTER TABLE work_prog
	ADD
		CONSTRAINT FK_Project_TO_work_prog
		FOREIGN KEY (
			pid
		)
		REFERENCES Project (
			pid
		);