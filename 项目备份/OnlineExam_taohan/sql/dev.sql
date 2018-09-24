SELECT * FROM GradeInfo;
UPDATE GradeInfo SET gradeName='' WHERE gradeId=100;
SELECT b.* FROM GradeInfo a INNER JOIN ClassInfo b ON a.gradeId=b.gradeId WHERE a.gradeId=2;

SELECT * FROM ClassInfo;
SELECT * FROM ClassInfo a INNER JOIN TeacherInfo b ON a.teacherId=b.teacherId INNER JOIN GradeInfo c ON a.gradeId=c.gradeId;
SELECT a.*, gradeName FROM ClassInfo a INNER JOIN GradeInfo b ON a.gradeId=b.gradeId INNER JOIN TeacherInfo c ON a.classId=c.classId  WHERE a.gradeId=1 AND className LIKE'%一%';
SELECT a.*,b.classId,b.className FROM TeacherInfo a INNER JOIN ClassInfo b ON a.teacherId=b.teacherId;
SELECT * FROM ClassInfo WHERE teacherId=1;

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
SELECT studentId FROM StudentInfo WHERE studentAccount='lanni' AND studentPwd='123456';
SELECT COUNT(studentId) AS studentCount, className 
FROM StudentInfo a 
INNER JOIN ClassInfo b ON a.`classId`=b.`classId` 
INNER JOIN GradeInfo c ON b.`gradeId`=c.`gradeId`
# where  c.`gradeId`=3
GROUP BY a.`classId`;

SELECT COUNT(studentId) AS studentCount, className 
FROM ClassInfo a 
INNER JOIN StudentInfo b ON a.`classId`=b.`classId`
INNER JOIN GradeInfo c ON a.`gradeId`=c.`gradeId`
WHERE a.`gradeId`=1
GROUP BY a.`classId`;

SELECT * FROM ExamPaperInfo;
SELECT a.*,b.gradeName FROM ExamPaperInfo a INNER JOIN GradeInfo b ON a.gradeId=b.gradeId;
UPDATE ExamPaperInfo SET examPaperName='', subjectNum=2, examPaperTime=12, examPaperScore=23, division=1, examPaperEasy=0, gradeId=1 WHERE examPaperId=100;
UPDATE ExamPaperInfo SET examPaperScore=examPaperScore+4 WHERE examPaperId=1;
UPDATE ExamPaperInfo SET subjectNum=subjectNum+-1 WHERE examPaperId=1;


SELECT * FROM SubjectInfo;
SELECT COUNT(subjectId) FROM SubjectInfo;
SELECT a.*, b.courseName, c.gradeName FROM SubjectInfo a INNER JOIN CourseInfo b ON a.courseId=b.courseId INNER JOIN GradeInfo c ON a.gradeId=c.gradeId;
UPDATE SubjectInfo SET subjectName='', OptionA='', OptionB='', OptionC='', OptionD='', rightResult='', subjectScore=1, subjectType=1, courseId=1, gradeId=1, subjectEasy=2, division=1 WHERE subjectId=1000;
INSERT INTO SubjectInfo VALUES(NULL, '已知集合A={0，2}，B={-2，-1，0，1，2},则A∩B=（   ）', '{0,2}', '{1,2}', '{0}', '{-2,-1,0,1,2}', 'A', 4, 0, 2, 1, 0, 0);


SELECT * FROM ExamSubjectMiddleInfo;
SELECT a.esmId, a.exampaperId, b.examPaperName, c.*, d.courseName, e.gradeName
FROM ExamSubjectMiddleInfo a
INNER JOIN ExamPaperInfo b ON a.examPaperId=b.examPaperId
INNER JOIN SubjectInfo c ON a.subjectId=c.subjectId
INNER JOIN CourseInfo d ON c.courseId=d.courseId
INNER JOIN GradeInfo e ON c.gradeId=e.gradeId
WHERE a.examPaperId=4
	/*d.courseName like '%学%'*/
	/*d.courseId=2*/;
SELECT a.esmId, a.exampaperId, b.examPaperName, c.*, d.courseName, e.gradeName FROM ExamSubjectMiddleInfo a INNER JOIN ExamPaperInfo b ON a.examPaperId=b.examPaperId INNER JOIN SubjectInfo c ON a.subjectId=c.subjectId INNER JOIN CourseInfo d ON c.courseId=d.courseId INNER JOIN GradeInfo e ON c.gradeId=e.gradeId WHERE a.examPaperId=1 AND e.gradeId=1
INSERT INTO ExamSubjectMiddleInfo VALUES
	(NULL, 1, 45),
	(NULL, 1, 50),
	(NULL, 1, 90);
DELETE FROM ExamSubjectMiddleInfo WHERE examPaperId=1 AND subjectId=100000;
SELECT esmId FROM ExamSubjectMiddleInfo WHERE examPaperId=1 AND subjectId=1;


SELECT * FROM ExamPlanInfo;
SELECT a.*,b.courseName,c.className,d.examPaperName,d.subjectNum FROM ExamPlanInfo a
INNER JOIN CourseInfo b ON a.courseId=b.courseId
INNER JOIN ClassInfo c ON a.classId=c.classId
INNER JOIN ExamPaperInfo d ON a.examPaperId=d.examPaperId
WHERE a.courseId=2 OR a.examPaperId=1 OR d.subjectNum IN(0, 100);
SELECT a.*,d.exampaperName,d.subjectNum,d.examPaperScore,d.examPaperEasy,d.examPaperTime,e.courseName FROM ExamPlanInfo a
INNER JOIN ClassInfo b ON a.classId=b.classId
INNER JOIN GradeInfo c ON b.gradeId=c.gradeId
INNER JOIN ExamPaperInfo d ON a.examPaperId=d.examPaperId
INNER JOIN CourseInfo e ON a.courseId=e.courseId
WHERE a.classId=1 AND b.gradeId=1;
SELECT a.beginTime, b.examPaperTime FROM ExamPlanInfo a LEFT JOIN ExamPaperInfo b ON a.examPaperId=b.examPaperId;
DELETE FROM ExamPlanInfo WHERE examPlanId=100;

SELECT * FROM ExamChooseInfo;
SELECT * FROM ExamChooseInfo WHERE studentId=2 AND examPaperId=1 AND subjectId=1;
UPDATE ExamChooseInfo SET chooseResult='C' WHERE chooseId=100;
SELECT 
a.chooseid,
a.chooseResult,
a.subjectId,
b.rightResult,
b.subjectScore
FROM ExamChooseInfo a 
INNER JOIN subjectInfo b ON a.subjectId=b.subjectId
WHERE studentId=2 AND examPaperId=1;

SELECT * FROM ExamHistoryInfo;
SELECT
a.examScore,b.examPaperId,b.examPaperName,b.examPaperScore,b.subjectNum,c.beginTime
FROM ExamHistoryInfo a
INNER JOIN examPaperInfo b ON a.examPaperId=b.exampaperId
LEFT JOIN examPlanInfo c ON b.examPaperId=c.examPaperId
WHERE a.studentId=1;
SELECT COUNT(*) FROM ExamHistoryInfo WHERE studentId=2 AND examPaperId=100;

SELECT
a.examPaperId,a.examPaperName,a.examPaperScore,
b.studentId,b.chooseResult,
c.subjectId,c.subjectName,c.optionA,c.optionB,c.optionC,c.optionD,c.rightResult,c.subjectScore,c.subjectEasy
FROM ExamPaperInfo a 
INNER JOIN ExamChooseInfo b ON a.examPaperId=b.examPaperId
INNER JOIN SubjectInfo c ON b.subjectId=c.subjectId
WHERE b.examPaperId=1 AND b.studentId=2;

SELECT
other.*,d.chooseResult,
c.subjectId,c.subjectName,c.optionA,c.optionB,c.optionC,c.optionD,c.rightResult,c.subjectScore,c.subjectEasy
FROM
(
	SELECT
	a.examPaperId,a.examPaperName,a.examPaperScore,b.subjectId
	FROM ExamPaperInfo a 
	LEFT JOIN ExamSubjectMiddleInfo b ON a.examPaperId=b.examPaperId WHERE a.examPaperId=2
) AS other
LEFT JOIN ExamChooseInfo d ON other.examPaperId=d.examPaperId
INNER JOIN SubjectInfo c ON other.subjectId=c.subjectId
WHERE other.examPaperId=2 AND d.studentId=2;

SELECT
*
FROM ExamChooseInfo a
RIGHT JOIN ExamSubjectMiddleInfo b ON a.subjectId=b.subjectId
LEFT JOIN SubjectInfo c ON a.subjectId=c.subjectId
WHERE a.studentId=1 AND a.examPaperId=2;

SELECT
*
FROM ExamSubjectMiddleInfo a
INNER JOIN SubjectInfo b ON a.subjectId=b.subjectId
INNER JOIN
(
    SELECT * FROM ExamChooseInfo WHERE studentId=1 AND examPaperId=2
) AS c ON b.subjectid=c.subjectId


SELECT
*
FROM
(
    SELECT a.subjectname,a.subjectId FROM SubjectInfo a
    INNER JOIN ExamSubjectMiddleInfo b ON a.subjectId=b.subjectId WHERE b.examPaperId=2
) AS a
LEFT JOIN ExamChooseInfo b ON a.subjectId=b.subjectId
WHERE b.studentId=1;


SELECT 
*
FROM SubjectInfo a
INNER JOIN ExamSubjectMiddleInfo b ON a.subjectId=b.subjectId 
WHERE b.examPaperId=2;

SELECT * FROM ExamChooseInfo WHERE studentId=1 AND examPaperId=1;


SELECT
a.examScore,b.examPaperId,b.examPaperName,b.examPaperScore,b.subjectNum,d.studentName
FROM ExamHistoryInfo a
INNER JOIN examPaperInfo b ON a.examPaperId=b.exampaperId
LEFT JOIN StudentInfo d ON a.studentId=d.studentId;

SELECT historyId FROM ExamHistoryInfo WHERE studentId=1 AND examPaperId=2;
SELECT COUNT(*) FROM ExamHistoryInfo WHERE studentId=1 AND examPaperId=0;

SELECT
a.studentId,a.studentName,COUNT(historyId) `examSum`
FROM StudentInfo a
LEFT JOIN ExamHistoryInfo b ON a.studentId=b.studentId
WHERE classId=1
GROUP BY a.studentId;

SELECT 
a.studentId,studentName,examScore,examPaperName,examPaperScore
FROM StudentInfo a
LEFT JOIN ExamHistoryInfo b ON a.studentId=b.studentId
INNER JOIN ExamPaperInfo c ON b.examPaperId=c.examPaperId
WHERE a.studentId=2;


SELECT 
SUM(examScore) avgScore, COUNT(historyId) examSum, a.studentName
FROM StudentInfo a
LEFT JOIN ExamHistoryInfo b ON a.studentId=b.studentId
LEFT JOIN ExamPaperInfo c ON b.examPaperId=c.examPaperId
WHERE a.classId=1
GROUP BY a.studentId;