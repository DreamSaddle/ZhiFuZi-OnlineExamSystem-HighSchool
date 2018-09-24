create database examDB;
use examDB;

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
/* Table: ClassInfo                                             */
/*==============================================================*/
create table ClassInfo
(
   classId              int not null,
   className            varchar(50) not null,
   gradeId              int not null,
   primary key (classId)
);

alter table ClassInfo comment '班级信息表';

/*==============================================================*/
/* Table: CourseInfo                                            */
/*==============================================================*/
create table CourseInfo
(
   courseId             int not null,
   courseNameq          varchar(50) not null,
   division             int default NULL,
   primary key (courseId)
);

alter table CourseInfo comment '科目信息表';

/*==============================================================*/
/* Table: ExamChooseInfo                                        */
/*==============================================================*/
create table ExamChooseInfo
(
   chooseId             int not null,
   studentId            int not null,
   examPaperId          int not null,
   subjectId            int not null,
   chooseResult         varchar(500) not null,
   primary key (chooseId)
);

alter table ExamChooseInfo comment '考试答案选择信息表';

/*==============================================================*/
/* Table: ExamHistoryInfo                                       */
/*==============================================================*/
create table ExamHistoryInfo
(
   historyId            int not null,
   studentId            int not null,
   examPaperId          int not null,
   examScore            int,
   primary key (historyId)
);

alter table ExamHistoryInfo comment '考试历史信息表';

/*==============================================================*/
/* Table: ExamPaperInfo                                         */
/*==============================================================*/
create table ExamPaperInfo
(
   examPaperId          int not null,
   examPaperName        varchar(50) not null,
   SubjectNum           int not null,
   examPaperTime        int not null,
   examPaperScore       int not null,
   gradeId              int not null,
   division             int default NULL,
   examPaperEasy        varchar(10) default 'B',
   primary key (examPaperId)
);

alter table ExamPaperInfo comment '试卷信息表';

/*==============================================================*/
/* Table: ExamSubjectMiddleInfo                                 */
/*==============================================================*/
create table ExamSubjectMiddleInfo
(
   esmId                int not null,
   examPaperId          int not null,
   subjectId            int not null,
   primary key (esmId)
);

alter table ExamSubjectMiddleInfo comment '试卷试题关联中间表';

/*==============================================================*/
/* Table: GradeInfo                                             */
/*==============================================================*/
create table GradeInfo
(
   gradeId              int not null,
   gradeName            varchar(50) not null,
   primary key (gradeId)
);

alter table GradeInfo comment '年级信息表';

/*==============================================================*/
/* Table: StudentInfo                                           */
/*==============================================================*/
create table StudentInfo
(
   studentId            int not null,
   studentName          varchar(10) not null,
   studentAccount       varchar(10) not null,
   studentPwd           varchar(10) not null,
   classId              int not null,
   primary key (studentId)
);

alter table StudentInfo comment '学生信息表';

/*==============================================================*/
/* Table: SubjectInfo                                           */
/*==============================================================*/
create table SubjectInfo
(
   subjectId            int not null,
   subjectName          varchar(500) not null,
   OptionA              varchar(500) not null,
   OptionB              varchar(500) not null,
   OptionC              varchar(500) not null,
   OptionD              varchar(500) not null,
   rightResult          varchar(500) not null,
   subjectScore         int not null,
   subjectType          int default 0,
   courseId             int not null,
   gradeId              int not null,
   subjectEasy          varchar(10) default NULL,
   division             int default NULL,
   primary key (subjectId)
);

alter table SubjectInfo comment '试题信息表';

/*==============================================================*/
/* Table: TeacherInfo                                           */
/*==============================================================*/
create table TeacherInfo
(
   teacherId            int,
   teacherName          varchar(10),
   teacherAccount       varchar(10),
   teacherPwd           varchar(10),
   adminPower           int default 0,
   classId              int
);

alter table TeacherInfo comment '教师信息表';



alter table ClassInfo add constraint FK_Reference_1 foreign key (gradeId)
      references GradeInfo (gradeId) on delete restrict on update restrict;

alter table ExamChooseInfo add constraint FK_Reference_11 foreign key (studentId)
      references StudentInfo (studentId) on delete restrict on update restrict;

alter table ExamChooseInfo add constraint FK_Reference_12 foreign key (examPaperId)
      references ExamPaperInfo (examPaperId) on delete restrict on update restrict;

alter table ExamChooseInfo add constraint FK_Reference_13 foreign key (subjectId)
      references SubjectInfo (subjectId) on delete restrict on update restrict;

alter table ExamHistoryInfo add constraint FK_Reference_10 foreign key (studentId)
      references StudentInfo (studentId) on delete restrict on update restrict;

alter table ExamHistoryInfo add constraint FK_Reference_9 foreign key (examPaperId)
      references ExamPaperInfo (examPaperId) on delete restrict on update restrict;

alter table ExamPaperInfo add constraint FK_Reference_4 foreign key (gradeId)
      references GradeInfo (gradeId) on delete restrict on update restrict;

alter table ExamSubjectMiddleInfo add constraint FK_Reference_7 foreign key (examPaperId)
      references ExamPaperInfo (examPaperId) on delete restrict on update restrict;

alter table ExamSubjectMiddleInfo add constraint FK_Reference_8 foreign key (subjectId)
      references SubjectInfo (subjectId) on delete restrict on update restrict;

alter table StudentInfo add constraint FK_Reference_3 foreign key (classId)
      references ClassInfo (classId) on delete restrict on update restrict;

alter table SubjectInfo add constraint FK_Reference_5 foreign key (courseId)
      references CourseInfo (courseId) on delete restrict on update restrict;

alter table SubjectInfo add constraint FK_Reference_6 foreign key (gradeId)
      references GradeInfo (gradeId) on delete restrict on update restrict;

alter table TeacherInfo add constraint FK_Reference_2 foreign key (classId)
      references ClassInfo (classId) on delete restrict on update restrict;
