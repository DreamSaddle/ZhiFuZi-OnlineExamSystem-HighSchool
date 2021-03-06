# 智夫子-在线考试系统 #
## 在校项目##
- <font style="color:red;">项目在 项目备份 目录里</font>

## 题外话 ##
- 该项目是一个在校期间的项目
- 第一次使用SSM开发便应用在此项目

## 开发环境 ##
- tomcat6
- MySQL5.1
- Eclipse JUNO
- FireFox/Chrome

## 相关技术 ##
- css、JavaScript、Jsp、jstl
- poi
- Spring SpringMVC MyBatis
- bootstrap
- 来自 jq22 上的前端插件，如：在线编辑器，弹出层等

## 项目总结 ##
- 该项目是我自学SSM后的第一次使用SSM的一个练习，也是一次实践
- 由于是第一次使用框架开发，也没什么经验，所以，在后台代码中存在很多臃肿代码，代码质量不高，还待提升
- 前端框架用得不是很熟练
- 业务处理流程还待熟悉、加强

## 更改 ##
- 改善后台页面效果
- 学生(考试)信息后台数据可视化展示



<h2 id="outline">项目基本模块</h2>
- [年级管理](#grade)
- [班级管理](#class)
- [科目管理](#course)
- [教师管理](#teacher)
- [学生管理](#student)
- [试卷管理](#examPaper)
- [试题管理](#subject)
- [考试安排](#examPlan)
- [历史考试信息](#examHistory)
- [其他](#other)

## 各模块描述 ##

<h3 id="grade">年级管理模块</h3>
	年级模块包含年级编号和年级名称
- 年级模块区别管理员和普通教师
> 管理员可对年级进行 CRUD
> 
> 普通教师只能进行查看

- 管理员或教师都可以通过点击班级按钮查看当前年级下的所有班级信息

[Top](#outline)

<h3 id="class">班级管理模块</h3>
	班级模块包含班级编号、名称、所属年级、班主任
- 班级模块区别管理员和普通教师
> 管理员可对班级进行 CRUD
>
> 普通教师只能进行查看

- 修改、添加班级时可以指定班主任（只能是当前非班主任状态的教师）
> 修改: 班主任需要将之前班主任改为非班主任状态，将当前指定班主任改为班主任状态
> 
> 添加: 只需将指定班主任改为班主任状态
> 
> 删除: 只需将之前班主任改为非班主任状态

[Top](#outline)

<h3 id="course">科目管理模块</h3>
	科目模块包括科目编号、名称、分科情况(未分科/文科/理科)、所属年级
- 科目模块区别管理员和普通教师
> 管理员可对科目进行 CRUD
> 
> 普通教师只能进行查看

[Top](#outline)

<h3 id="teacher">教师管理模块</h3>
	教师模块包括教师编号、姓名、后台登录账户、后台登录密码、后台权限、是否为班主任(如果为班主任就显示管理班级)
- 教师模块区别管理员和普通教师
> 管理员可对教师进行 CRUD
> 
> 普通教师只能进行查看、且不能查看其他教师密码

- 管理员可查看教师后台登录密码和重置密码
- 添加、修改教师信息时不能指定其管理班级

[Top](#outline)

<h3 id="student">学生管理模块</h3>
	学生模块包括学生编号、姓名、前台登录账户、前台登录密码、就读班级
- 学生模块不区别管理员和普通教师，都可对其进行指定操作
- 后台只能对学生进行查看、修改和删除
- 后台可重置学生密码

[Top](#outline)

<h3 id="examPaper">试卷管理模块</h3>
	试卷模块包括试卷编号、名称、题目数量、总分(鸡肋字段)、考试时长、分科情况、难易程度、所属年级
- 试卷模块不区别管理员和普通教师，都可对其进行指定操作
- 添加试卷只需指定以上信息（不可同步添加试题，只有添加完试卷再添加试题）
- 修改试卷只需修改指定信息（不可同步修改试卷中的试题信息）
- 查看试卷处可点击查看试题按钮查看当前指定试卷中的所有试题信息，且可从试卷中移除指定试题

> 移除试题需动态刷新试卷栏显示的试题数量和总分信息

- 查看试题时可向指定试卷中添加试题

#### 手动添加试题到试卷 ####
> 加载出所有试题信息，提供复选框供用户选择
>
> 记录用户选择的试题量（试题信息，可查看已选择的试题）
>
> 如果当前试题已经存在该试卷中，则不能进行添加
>
> 添加完成后就情况之前选择试题信息，刷新试卷试题数量和总分信息

#### 随机添加试题到试卷 ####
> 用户可选择添加试题数量，试题分值，难易程度，分科情况约束
>
> 添加成功刷新试卷试题数量和总分信息

[Top](#outline)

<h3 id="subject">试题管理模块</h3>
	试题模块包括试题编号、题干、答案、正确答案、分值、难易程度等信息
- 试卷模块不区别管理员和普通教师，都可对其进行指定操作

[Top](#outline)

<h3 id="examPlan">考试安排模块</h3>
	考试安排模块包括试卷信息、科目信息、班级信息、开考时间
- 不区别管理员和普通教师，都可对其进行指定操作
- 后台添加考试安排试卷给指定年级下的指定班级，考生可登录查看待考信息
- 后台添加定时任务 移除过期考试安排记录

[Top](#outline)

<h3 id="examHistory">历史考试记录</h3>
- 后台可查看学生考试记录，不区分管理员和普通教师
- 前台学生登录也可查看自己的考试记录
> 由于数据库设计不周到，查看考试记录时无法查看对应考试时间

[Top](#outline)

<h2 id="other">其他</h2>
### 考生进入考试 ###
- 前台控制 考试时间未到学生不能进入考试
- 由于后台使用定时任务移除考试安排记录，考生考试完成当前考试记录可能还会存在考试中心，需控制其不能再次进入考试
- 如果考试过期，但是后台还没将其移出，考生再次进入考试时提示其当前试卷过期

[Top](#outline)

### 考生考试 ###
- 试题和答题卡对应控制
- 考试倒计时控制 (考试结束时间-当前时间)
- 考生选择/修改试题答案 刷新记录信息
- 考试考试如果未提交退出，再次进入加载之前选择答案记录
- 考生提交试卷后退出考试，加入对应历史记录

[Top](#outline)

### 考生/教师查看历史考试纪录###
- 查看总分、试题对应选择答案(如答案选择错误显示正确答案)

[Top](#outline)

### 后台导入外部试题文件 ###
- 后台管理员或教师可以导入试题文件(Excel)
- 导入试题文件必须是满足指定格式的文件
- 导入选择

> 只导入试题 <br />
> 导入试题到已有试卷中 <br />
> 导入试题到新建试卷中 <br />

[Top](#outline)

### 学生信息、考试信息数据可视化 ###

[Top](#outline)

