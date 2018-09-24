USE ExamDB;
SHOW TABLES;

INSERT INTO GradeInfo VALUES(NULL, '高一');
INSERT INTO GradeInfo VALUES(NULL, '高二');
INSERT INTO GradeInfo VALUES(NULL, '高三');

INSERT INTO CourseInfo VALUES(NULL, '语文', 1, 3);
INSERT INTO CourseInfo VALUES(NULL, '数学', 0, 2);
INSERT INTO CourseInfo VALUES(NULL, '英语', 1, 1);
INSERT INTO CourseInfo VALUES(NULL, '常识题', 0, 1);
INSERT INTO CourseInfo VALUES(NULL, '理化类', 0, 1);
INSERT INTO CourseInfo VALUES(NULL, '天文类', 0, 1);
INSERT INTO CourseInfo VALUES(NULL, '文史类', 0, 1);
INSERT INTO CourseInfo VALUES(NULL, '文体类', 0, 1);

INSERT INTO TeacherInfo VALUES(NULL, '李银萍', 'liyinping', '123456', 0, 1);
INSERT INTO TeacherInfo VALUES(NULL, '皮长山', 'pcs', '123123', 1, 1);
INSERT INTO TeacherInfo VALUES(NULL, '方正', 'fangzheng', '123456', 0, 1);

INSERT INTO ClassInfo VALUES(NULL, '高一一班', 1, 1);
INSERT INTO ClassInfo VALUES(NULL, '高二二班', 2, 2);
INSERT INTO ClassInfo VALUES(NULL, '高三二班', 3, 3);

INSERT INTO SubjectInfo VALUES(NULL, '1+1=?', '2', '3', '4', '5', 'A', 2, 0, 2, 1, 2, 0);
INSERT INTO SubjectInfo VALUES(NULL, '1+2=?', '10', '23', '34', '3', 'D', 2, 0, 2, 1, 0, 0);
INSERT INTO SubjectInfo VALUES(NULL, '1+3=?', '11', '13', '4', '15', 'C', 2, 0, 2, 1, 1, 0);
INSERT INTO SubjectInfo VALUES(NULL, '1+4=?', '12', '33', '43', '5', 'D', 2, 0, 2, 1, 2, 2);
INSERT INTO SubjectInfo VALUES(NULL, '1+5=?', '23', '233', '6', '3', 'C', 2, 0, 2, 1, 1, 0);
INSERT INTO SubjectInfo VALUES(NULL, '1+6=?', '45', '7', '23', '225', 'B', 2, 0, 2, 1, 3, 0);
INSERT INTO SubjectInfo VALUES(NULL, '1+7=?', '8', '54', '4', '5', 'A', 2, 0, 2, 1, 2,1);
INSERT INTO SubjectInfo VALUES(NULL, '1+8=?', '90', '23', '9', '15', 'C', 2, 0, 2, 1, 1, 0);
INSERT INTO SubjectInfo VALUES(NULL, '1+9=?', '21', '44', '422', '10', 'D', 2, 0, 2, 1, 2, 0);
INSERT INTO SubjectInfo VALUES(NULL, '1+10=?', '11', '223', '234', '115', 'A', 2, 0, 2, 1, 0, 0);

INSERT INTO StudentInfo VALUES(NULL, '谢鹏飞', 'xiepengfei', '123123', 2);
INSERT INTO StudentInfo VALUES(NULL, '兰妮', 'lanni', '123456', 1);
INSERT INTO StudentInfo VALUES(NULL, '皮志高', 'pizhigao', '123456', 3);

INSERT INTO ExamPaperInfo VALUES(NULL, '第三单元测试', 8, 20, 16, 1, 0, 1);

INSERT INTO ExamSubjectMiddleInfo VALUES(NULL, 1, 1);
INSERT INTO ExamSubjectMiddleInfo VALUES(NULL, 3, 1);
INSERT INTO ExamSubjectMiddleInfo VALUES(NULL, 6, 1);
INSERT INTO ExamSubjectMiddleInfo VALUES(NULL, 5, 1);
INSERT INTO ExamSubjectMiddleInfo VALUES(NULL, 2, 1);
INSERT INTO ExamSubjectMiddleInfo VALUES(NULL, 4, 1);
INSERT INTO ExamSubjectMiddleInfo VALUES(NULL, 7, 1);
INSERT INTO ExamSubjectMiddleInfo VALUES(NULL, 8, 1);
INSERT INTO ExamSubjectMiddleInfo VALUES(NULL, 9, 1);

INSERT INTO ExamHistoryInfo VALUES(NULL, 1, 1, 16);

INSERT INTO ExamChooseInfo VALUES(NULL, 1, 1, 1, 'A');
INSERT INTO ExamChooseInfo VALUES(NULL, 1, 1, 2, 'D');
INSERT INTO ExamChooseInfo VALUES(NULL, 1, 1, 3, 'C');
INSERT INTO ExamChooseInfo VALUES(NULL, 1, 1, 4, 'D');
INSERT INTO ExamChooseInfo VALUES(NULL, 1, 1, 5, 'C');
INSERT INTO ExamChooseInfo VALUES(NULL, 1, 1, 6, 'B');
INSERT INTO ExamChooseInfo VALUES(NULL, 1, 1, 7, 'A');
INSERT INTO ExamChooseInfo VALUES(NULL, 1, 1, 8, 'C');
INSERT INTO ExamChooseInfo VALUES(NULL, 1, 1, 9, 'D');

SELECT * FROM GradeInfo;
SELECT * FROM CourseInfo;
SELECT * FROM TeacherInfo;
SELECT * FROM ClassInfo;
SELECT * FROM SubjectInfo;
SELECT * FROM StudentInfo;
SELECT * FROM ExamPaperInfo;
SELECT * FROM ExamSubjectMiddleInfo;
SELECT * FROM ExamHistoryInfo;
SELECT * FROM ExamChooseInfo;

SELECT * FROM ExamPaperInfo a
INNER JOIN ExamSubjectMiddle b ON a.examPaperId=b.examPaperId
INNER JOIN SubjectInfo c ON b.subjectId=c.subjectId;
