/* 교수 */
CREATE TABLE Professor (
	ssn NUMBER NOT NULL, /* 아이디 */
	name VARCHAR2(40) NOT NULL, /* 이름 */
	age NUMBER NOT NULL, /* 나이 */
	rank CHAR, /* 직위 */
	speciality VARCHAR2(40) /* 연구 분야 */
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

/* 학과 */
CREATE TABLE Dept (
	dno NUMBER NOT NULL, /* 학과번호 */
	ssn NUMBER, /* 아이디 */
	dname VARCHAR2(40), /* 학과이름 */
	office VARCHAR2(40) /* 학과사무실 */
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

/* 대학원생 */
CREATE TABLE Graduate (
	ssn NUMBER NOT NULL, /* 아이디 */
	name VARCHAR2(40) NOT NULL, /* 이름 */
	age NUMBER NOT NULL, /* 나이 */
	deg_prog VARCHAR2(30), /* 학위과정 */
	adssn NUMBER, /* 선임 대학원생 */
	dno NUMBER /* 학과번호 */
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

/* 과제 */
CREATE TABLE Project (
	pid NUMBER NOT NULL, /* 과제번호 */
	sponsor VARCHAR2(40), /* 지원기관 */
	start_date DATE, /* 개시일 */
	end_date DATE, /* 종료일 */
	budget INTEGER, /* 예산액 */
	ssn NUMBER /* 아이디 */
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

/* 학과_근무 */
CREATE TABLE work_dept (
	dno NUMBER NOT NULL, /* 학과번호 */
	ssn NUMBER NOT NULL, /* 아이디 */
	pct_time NUMBER /* 참여백분율 */
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

/* 과제_수행 */
CREATE TABLE work_in (
	ssn NUMBER NOT NULL, /* 아이디 */
	pid NUMBER NOT NULL /* 과제번호 */
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

/* 수행_대학원생 */
CREATE TABLE work_prog (
	ssn NUMBER NOT NULL, /* 아이디 */
	pid NUMBER NOT NULL /* 과제번호 */
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