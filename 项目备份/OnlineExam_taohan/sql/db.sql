DROP DATABASE IF EXISTS examDB;
CREATE DATABASE examDB;
USE examDB;

/*
drop table if exists ClassInfo;

drop table if exists CourseInfo;

drop table if exists ExamChooseInfo;

drop table if exists ExamHistoryInfo;

drop table if exists ExamPaperInfo;

drop table if exists ExamSubjectMiddleInfo;

drop table if exists GradeInfo;

drop table if exists StudentInfo;

drop table if exists SubjectInfo;

drop table if exists TeacherInfo;
*/


/*==============================================================*/
/* Table: ExamChooseInfo          考试答案选择信息表            */
/*==============================================================*/
CREATE TABLE ExamChooseInfo
(
   chooseId             INT NOT NULL AUTO_INCREMENT,
   studentId            INT NOT NULL,
   examPaperId          INT NOT NULL,
   subjectId            INT NOT NULL,
   chooseResult         VARCHAR(500) NOT NULL,
   PRIMARY KEY (chooseId)
);

/*==============================================================*/
/* Table: ExamHistoryInfo                 考试历史信息表        */
/*==============================================================*/
CREATE TABLE ExamHistoryInfo
(
   historyId            INT NOT NULL AUTO_INCREMENT,
   studentId            INT NOT NULL,
   examPaperId          INT NOT NULL,
   examScore            INT,
   PRIMARY KEY (historyId)
);

/*==============================================================*/
/* Table: ExamPaperInfo                      试卷信息表         */
/*==============================================================*/
CREATE TABLE ExamPaperInfo
(
   examPaperId          INT NOT NULL AUTO_INCREMENT,
   examPaperName        VARCHAR(50) NOT NULL,
   subjectNum           INT NOT NULL,
   examPaperTime        INT NOT NULL,
   examPaperScore       INT NOT NULL,
   gradeId              INT NOT NULL,
   division             INT DEFAULT 0 CHECK(division=0 OR division=1 OR division=2),
   examPaperEasy        INT DEFAULT 1 CHECK(examPaperEasy=0 OR examPaperEasy=1 OR examPaperEasy=2),
   PRIMARY KEY (examPaperId)
);

/*==============================================================*/
/* Table: ExamSubjectMiddleInfo              试卷试题关联中间表 */
/*==============================================================*/
CREATE TABLE ExamSubjectMiddleInfo
(
   esmId                INT NOT NULL AUTO_INCREMENT,
   examPaperId          INT NOT NULL,
   subjectId            INT NOT NULL,
   PRIMARY KEY (esmId)
);


/*==============================================================*/
/* Table: GradeInfo                             年级信息表      */
/*==============================================================*/
CREATE TABLE GradeInfo
(
   gradeId              INT NOT NULL AUTO_INCREMENT,
   gradeName            VARCHAR(50) NOT NULL,
   PRIMARY KEY (gradeId)
);


/*==============================================================*/
/* Table: CourseInfo                         科目信息表         */
/*==============================================================*/
CREATE TABLE CourseInfo
(
   courseId             INT NOT NULL AUTO_INCREMENT,
   courseName          VARCHAR(50) NOT NULL,
   division             INT DEFAULT 0 CHECK(division=0 OR division=1 OR division=2),  # 0: 未分科  1：文科   2：理科
   gradeId		INT,
   PRIMARY KEY (courseId),
   FOREIGN KEY (gradeId) REFERENCES GradeInfo (gradeId)
);

/*==============================================================*/
/* Table: StudentInfo                           学生信息表      */
/*==============================================================*/
CREATE TABLE StudentInfo
(
   studentId            INT NOT NULL AUTO_INCREMENT,
   studentName          VARCHAR(10) NOT NULL,
   studentAccount       VARCHAR(10) NOT NULL,
   studentPwd           VARCHAR(10) NOT NULL,
   classId              INT NOT NULL,
   PRIMARY KEY (studentId)
);


/*==============================================================*/
/* Table: SubjectInfo                             试题信息表    */
/*==============================================================*/
CREATE TABLE SubjectInfo
(
   subjectId            INT NOT NULL AUTO_INCREMENT,
   subjectName          VARCHAR(500) NOT NULL,
   optionA              VARCHAR(500) NOT NULL,
   optionB              VARCHAR(500) NOT NULL,
   optionC              VARCHAR(500) NOT NULL,
   optionD              VARCHAR(500) NOT NULL,
   rightResult          VARCHAR(500) NOT NULL,
   subjectScore         INT NOT NULL,
   subjectType          INT DEFAULT 0 CHECK(subjectType=0 OR subjectType=1 OR subjectType=2), #0:单选 1:多选 2：填空
   courseId             INT NOT NULL,
   gradeId              INT NOT NULL,
   subjectEasy          INT DEFAULT 1 CHECK(subjectEasy=0 OR subjectEasy=1 OR subjectEasy=2),  # 0:简单 1：普通 2：困难
   division             INT DEFAULT 0 CHECK(division=0 OR division=1 OR division=2),
   PRIMARY KEY (subjectId)
);


/*==============================================================*/
/* Table: TeacherInfo                           教师信息表      */
/*==============================================================*/
CREATE TABLE TeacherInfo
(
   teacherId            INT NOT NULL AUTO_INCREMENT,
   teacherName          VARCHAR(10),
   teacherAccount       VARCHAR(10),
   teacherPwd           VARCHAR(10),
   adminPower           INT DEFAULT 0 CHECK(adminPower=0 OR adminPower=1),
   isWork		INT DEFAULT 0 CHECK(isWork=0 OR isWork=1),  # 是否为班主任 0：不是 1：是
   PRIMARY KEY (teacherId)
);



/*==============================================================*/
/* Table: ClassInfo                               班级信息表    */
/*==============================================================*/
CREATE TABLE ClassInfo
(
   classId              INT NOT NULL AUTO_INCREMENT,
   className            VARCHAR(50) NOT NULL,
   gradeId              INT NOT NULL,
   teacherId		INT,   # 班主任
   PRIMARY KEY (classId),
   FOREIGN KEY (teacherId) REFERENCES TeacherInfo (teacherId)
);


/*==============================================================*/
/* Table: ClassInfo                               考试安排表    */
/*==============================================================*/
CREATE TABLE ExamPlanInfo
(
    examPlanId  	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    courseId		INT NOT NULL,
    classId		INT NOT NULL,
    examPaperId 	INT NOT NULL,
    beginTime		DATETIME NOT NULL,
    
    FOREIGN KEY (courseId) REFERENCES CourseInfo (courseId),
    FOREIGN KEY (classId) REFERENCES ClassInfo (classId),
    FOREIGN KEY (examPaperId) REFERENCES ExamPaperInfo (examPaperId)
);


ALTER TABLE ClassInfo ADD CONSTRAINT FK_Reference_1 FOREIGN KEY (gradeId)
      REFERENCES GradeInfo (gradeId) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ExamChooseInfo ADD CONSTRAINT FK_Reference_11 FOREIGN KEY (studentId)
      REFERENCES StudentInfo (studentId) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ExamChooseInfo ADD CONSTRAINT FK_Reference_12 FOREIGN KEY (examPaperId)
      REFERENCES ExamPaperInfo (examPaperId) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ExamChooseInfo ADD CONSTRAINT FK_Reference_13 FOREIGN KEY (subjectId)
      REFERENCES SubjectInfo (subjectId) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ExamHistoryInfo ADD CONSTRAINT FK_Reference_10 FOREIGN KEY (studentId)
      REFERENCES StudentInfo (studentId) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ExamHistoryInfo ADD CONSTRAINT FK_Reference_9 FOREIGN KEY (examPaperId)
      REFERENCES ExamPaperInfo (examPaperId) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ExamPaperInfo ADD CONSTRAINT FK_Reference_4 FOREIGN KEY (gradeId)
      REFERENCES GradeInfo (gradeId) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ExamSubjectMiddleInfo ADD CONSTRAINT FK_Reference_7 FOREIGN KEY (examPaperId)
      REFERENCES ExamPaperInfo (examPaperId) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ExamSubjectMiddleInfo ADD CONSTRAINT FK_Reference_8 FOREIGN KEY (subjectId)
      REFERENCES SubjectInfo (subjectId) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE StudentInfo ADD CONSTRAINT FK_Reference_3 FOREIGN KEY (classId)
      REFERENCES ClassInfo (classId) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE SubjectInfo ADD CONSTRAINT FK_Reference_5 FOREIGN KEY (courseId)
      REFERENCES CourseInfo (courseId) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE SubjectInfo ADD CONSTRAINT FK_Reference_6 FOREIGN KEY (gradeId)
      REFERENCES GradeInfo (gradeId) ON DELETE RESTRICT ON UPDATE RESTRICT;
