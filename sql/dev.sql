SELECT * FROM GradeInfo;
UPDATE GradeInfo SET gradeName='' WHERE gradeId=100;
SELECT b.* FROM GradeInfo a INNER JOIN ClassInfo b ON a.gradeId=b.gradeId WHERE a.gradeId=2;

SELECT * FROM ClassInfo;
SELECT * FROM ClassInfo a INNER JOIN TeacherInfo b ON a.teacherId=b.teacherId INNER JOIN GradeInfo c ON a.gradeId=c.gradeId;
SELECT a.*, gradeName FROM ClassInfo a INNER JOIN GradeInfo b ON a.gradeId=b.gradeId INNER JOIN TeacherInfo c ON a.classId=c.classId  WHERE a.gradeId=1 AND className LIKE'%一%';


SELECT * FROM TeacherInfo;
SELECT COUNT(teacherId) FROM TeacherInfo;
INSERT INTO TeacherInfo VALUES(NULL, '张三', 'zhangsan', '123456', 0, 0);
SELECT * FROM TeacherInfo WHERE isWork=0;
SELECT teacherAccount, teacherPwd, adminPower FROM TeacherInfo WHERE teacherAccount='liyinping';
SELECT teacherAccount, teacherPwd, adminPower FROM TeacherInfo WHERE teacherAccount='pcs';
SELECT a.*,b.className,c.gradeName FROM TeacherInfo a INNER JOIN ClassInfo b ON a.classId=b.classId INNER JOIN GradeInfo c ON b.gradeId=c.gradeId;
UPDATE TeacherInfo SET isWork=1 WHERE teacherId=100;
SELECT a.*,b.classId,b.className FROM TeacherInfo a LEFT JOIN ClassInfo b ON a.teacherId=b.teacherId;
UPDATE TeacherInfo SET teacherName='', teacherAccount='', teacherPwd='', adminPower=1 WHERE teacherId=100;
DELETE FROM TeacherInfo WHERE teacherId=100;

SELECT * FROM CourseInfo;
SELECT * FROM CourseInfo a INNER JOIN GradeInfo b ON a.gradeId=b.gradeId WHERE a.gradeId=1;
UPDATE CourseInfo SET courseName='', division=NULL WHERE courseId=100;

SELECT * FROM StudentInfo;
SELECT COUNT(studentId) FROM StudentInfo;
INSERT INTO StudentInfo VALUES(NULL, '删除测试', 'ceshi', '123456', 3);
SELECT a.*,b.className, c.gradeName FROM StudentInfo a INNER JOIN ClassInfo b ON a.classId=b.classId INNER JOIN GradeInfo c ON b.gradeId=c.gradeId WHERE studentId=1 OR b.classId=1 OR c.gradeId=1;
UPDATE StudentInfo SET studentName='', studentAccount='', studentPwd='', classId=1 WHERE studentId=100;

SELECT * FROM ExamPaperInfo;
SELECT a.*,b.gradeName FROM ExamPaperInfo a INNER JOIN GradeInfo b ON a.gradeId=b.gradeId;
UPDATE ExamPaperInfo SET examPaperName='', subjectNum=2, examPaperTime=12, examPaperScore=23, division=1, examPaperEasy=0, gradeId=1 WHERE examPaperId=100;


SELECT * FROM SubjectInfo;
SELECT COUNT(subjectId) FROM SubjectInfo;
SELECT a.*, b.courseName, c.gradeName FROM SubjectInfo a INNER JOIN CourseInfo b ON a.courseId=b.courseId INNER JOIN GradeInfo c ON a.gradeId=c.gradeId;
UPDATE SubjectInfo SET subjectName='', OptionA='', OptionB='', OptionC='', OptionD='', rightResult='', subjectScore=1, subjectType=1, courseId=1, gradeId=1, subjectEasy=2, division=1 WHERE subjectId=1000;
INSERT INTO SubjectInfo VALUES(NULL, '已知集合A={0，2}，B={-2，-1，0，1，2},则A∩B=（   ）', '{0,2}', '{1,2}', '{0}', '{-2,-1,0,1,2}', 'A', 4, 0, 2, 1, 0, 0);

