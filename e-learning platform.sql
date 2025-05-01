create database platform;
use platform;
-- to create the user table
create table user(
UserID INT PRIMARY key,
Name VARCHAR(45) NOT NULL,
Email VARCHAR(45) UNIQUE NOT NULL,
Password VARCHAR(100) NOT NULL,
Role ENUM('student','Instructor','Admin') NOT NULL);
select * from user;
-- to create the instructor table
create table instructor(
InstructorID INT PRIMARY KEY,
UserID INT NOT NULL,
Bio TEXT,
FOREIGN KEY(UserID) REFERENCES User(UserID) ON DELETE CASCADE);
select * from instructor;
-- to create the student table
create table student(
StudentID INT PRIMARY KEY,
UserID INT NOT NULL,
EnrollmentDate DATE NOT NULL,
FOREIGN KEY(UserID) REFERENCES User (UserID) ON DELETE CASCADE);
select * from student;
-- to create the course table
create table course(
CourseID INT PRIMARY KEY,
Title VARCHAR(100) NOT NULL,
Description TEXT,
Category VARCHAR(45),
InstructorID INT NOT NULL,
FOREIGN KEY(InstructorID) REFERENCES Instructor(InstructorID) ON DELETE CASCADE);
SELECT * from course;
-- to create the lesson table
create table Lesson(
LessonID INT PRIMARY KEY,
CourseID INT NOT NULL,
Title VARCHAR(100) NOT NULL,
Content TEXT,
VideoURL VARCHAR(255),
FOREIGN KEY(CourseID) REFERENCES Course(CourseID) ON DELETE CASCADE);
SELECT * FROM lesson;
-- to create the enrollment table
create table Enrollment(
EnrollmentID INT PRIMARY KEY,
StudentID INT NOT NULL,
CourseID INT NOT NULL,
EnrollmentDate DATE NOT NULL,
CompletionStatus VARCHAR(50),
FOREIGN KEY(StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE,
FOREIGN KEY(CourseID) REFERENCES Course(CourseID) ON DELETE CASCADE);
select * from Enrollment;
-- to create the quiz table
create table Quiz(
QuizID INT PRIMARY KEY,
LessonID INT NOT NULL,
Title VARCHAR(100) NOT NULL,
FOREIGN KEY(LessonID) REFERENCES Lesson(LessonID)ON DELETE CASCADE);
select * from Quiz;
-- to create the question
create table Question(
QuestionID INT PRIMARY KEY,
QuizID INT NOT NULL,
QuestionText TEXT,
CorrectAnswer VARCHAR(100) NOT NULL,
FOREIGN KEY(QuizID) REFERENCES Quiz(QuizID) ON DELETE CASCADE);
SELECT * from Question;
-- to create the submission table
create table Submission(
SubmissionID INT PRIMARY KEY,
QuizID INT NOT NULL,
StudentID INT NOT NULL,
Score DECIMAL(5,2),
SubmissionDate DATE NOT NULL,
FOREIGN KEY(QuizID) REFERENCES Quiz(QuizID)ON DELETE CASCADE ,
FOREIGN KEY(StudentID) REFERENCES Student(StudentID)ON DELETE CASCADE); 
INSERT INTO User (UserID, Name, Email, Password, Role)
VALUES(1, 'Tiffany Hodges', 'user1@example.com', 'password123', 'Instructor'),
(2, 'Brian Mendez', 'user2@example.com', 'password123', 'Instructor'),
(3, 'Kristin Simon', 'user3@example.com', 'password123', 'Student'),
(4, 'Yvonne Parker', 'user4@example.com', 'password123', 'Instructor'),
(5, 'Bobby Jones', 'user5@example.com', 'password123', 'Instructor'),
(6, 'James Thompson', 'user6@example.com', 'password123', 'Student'),
(7, 'George Snyder', 'user7@example.com', 'password123', 'Student'),
(8, 'Matthew Black', 'user8@example.com', 'password123', 'Instructor'),
(9, 'Philip Huerta', 'user9@example.com', 'password123', 'Instructor'),
(10, 'Jason Watts', 'user10@example.com', 'password123', 'Instructor'),
(11, 'Rose Clark', 'user11@example.com', 'password123', 'Instructor'),
(12, 'Ashley Ramsey', 'user12@example.com', 'password123', 'Instructor'),
(13, 'Jesse Coleman', 'user13@example.com', 'password123', 'Instructor'),
(14, 'Elizabeth Wu', 'user14@example.com', 'password123', 'Instructor'),
(15, 'Monique Wright', 'user15@example.com', 'password123', 'Instructor'),
(16, 'Michael Clark MD', 'user16@example.com', 'password123', 'Instructor'),
(17, 'Stacy Thompson', 'user17@example.com', 'password123', 'Instructor'),
(18, 'Brandon Briggs', 'user18@example.com', 'password123', 'Student'),
(19, 'Sandra Smith', 'user19@example.com', 'password123', 'Instructor'),
(20, 'Michelle Chapman', 'user20@example.com', 'password123', 'Instructor'),
(21, 'Jason Wong', 'user21@example.com', 'password123', 'Instructor'),
(22, 'Erika Henry', 'user22@example.com', 'password123', 'Instructor'),
(23, 'Wayne Peterson', 'user23@example.com', 'password123', 'Instructor'),
(24, 'David Rose', 'user24@example.com', 'password123', 'Instructor'),
(25, 'Donald Christensen', 'user25@example.com', 'password123', 'Student'),
(26, 'Michael Moran', 'user26@example.com', 'password123', 'Student'),
(27, 'Nathan Richards', 'user27@example.com', 'password123', 'Instructor'),
(28, 'Tammie Weaver', 'user28@example.com', 'password123', 'Instructor'),
(29, 'Jordan Houston', 'user29@example.com', 'password123', 'Instructor'),
(30, 'Paul Solis', 'user30@example.com', 'password123', 'Student');
select * from User;
INSERT INTO instructor(InstructorID,UserID,Bio) 
VALUES(1, 1,'Buy improve ready thus case. Wrong late long outside which trial. Democratic employee she whom.'),
(2, 2,'Fill young in front. Better very cut toward interesting western cup.'),
(3, 4,'Especially once reality sea positive Threat capital including beat must particular.'),
(4, 5,'Away suddenly country meeting spring maybe change. Late late pattern day deep authority trade.'),
(5, 8,'Society feeling unit. Begin reach budget create.'),
(6, 9,'Artist book politics friend knowledge. Gun adult technology energy. Think check cut why really.'),
(7, 10,'Past face believe war those decade only. Loss detail kid choose design.'),
(8, 11,'Statement table approach but indeed. This time turn term. Pm painting moment arm truth hold take.'),
(9, 12,'Suffer stop card book give. Approach risk close part space campaign.'),
(10, 13,'Who now recently writer they despite respond.'),
(11, 14,'Never suggest strategy. Direction form either fire picture everything middle.'),
(12, 15,'Area argue talk glass occur should pattern ready. Better serve firm indeed offer image.'),
(13, 16,'Product and candidate PM behind born strong. Box consider data couple take likely find.'),
(14, 17,'Seek this investment compare. Resource certainly newspaper begin task any term.'),
(15, 19,'Or get above theory. Attorney when inside eat job.'),
(16, 20,'Wait too scene rather network plan explain various. Six wife push bar whole finally arrive.'),
(17, 21,'Few run affect loss president. Woman government wear some agent do.'),
(18, 22,'You somebody work heavy school describe. Wait set card good very.'),
(19, 23,'Dog simply point hope provide. Peace speak center TV almost create.'),
(20, 24,'Effect win home since simply issue century. Unit too wish take eye.'),
(21, 27,'Win project because window ask too. Drive large when idea about anything.'),
(22, 28,'Stock attention commercial.'),
(23, 29,'Southern manager my decide understand authority sing fish. Letter energy exist book less finally.'),
(24, 34,'Follow discussion rock professor. Though set issue travel admit however.'),
(25, 35,'Right lawyer miss us southern weight.'),
(26, 37,'Bit best civil. Value while commercial gun learn teach.'),
(27, 38,'Citizen near class begin people fall just. Account item crime order citizen wide run.'),
(28, 39,'North cup house. Keep life resource election.'),
(29, 49,'Particularly coach win one. Top right sister according. Plant serve gun body.'),
(30, 50,'Act candidate concern although enough particular him.');
select * from instructor;
INSERT INTO student(StudentID,UserID,EnrollmentDate) 
VALUES(1,3,'2024-01-05'),
(2, 6, '2023-06-01'),
(3, 7, '2024-07-30'),
(4, 18, '2024-12-11'),
(5, 25, '2024-09-03'),
(6, 26, '2025-04-24'),
(7, 30, '2023-11-07'),
(8, 31, '2023-07-05'),
(9, 32, '2024-03-03'),
(10, 33, '2023-12-15'),
(11, 36, '2023-10-07'),
(12, 40, '2023-07-14'),
(13, 41, '2024-10-16'),
(14, 42, '2024-09-28'),
(15, 43, '2025-01-22'),
(16, 44, '2023-10-16'),
(17, 45, '2023-12-11'),
(18, 46, '2024-11-17'),
(19, 47, '2023-05-28'),
(20, 48, '2024-10-06'),
(21, 57, '2024-01-22'),
(22, 58, '2024-08-31'),
(23, 61, '2024-02-14'),
(24, 66, '2023-06-16'),
(25, 68, '2024-11-17'),
(26, 69, '2023-07-15'),
(27, 70, '2024-07-19'),
(28, 72, '2024-03-20'),
(29, 76, '2024-01-17'),
(30, 78, '2024-06-09');
select * from student;
SELECT UserID FROM user WHERE UserID IN (1,2,4,5,8,9,10,11,12,13,14,15,16,17,19,20,21,22,23,24,27,28,29,34,35,37,38,39,49,50);
SELECT temp.UserID
FROM (
    SELECT 1 AS UserID UNION ALL SELECT 2 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL
    SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL
    SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15 UNION ALL
    SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 19 UNION ALL SELECT 20 UNION ALL
    SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24 UNION ALL
    SELECT 27 UNION ALL SELECT 28 UNION ALL SELECT 29 UNION ALL SELECT 34 UNION ALL
    SELECT 35 UNION ALL SELECT 37 UNION ALL SELECT 38 UNION ALL SELECT 39 UNION ALL
    SELECT 49 UNION ALL SELECT 50
) AS temp
LEFT JOIN user u ON temp.UserID = u.UserID
WHERE u.UserID IS NULL;

SET foreign_key_checks = 0;

-- Your insert statement here

SET foreign_key_checks = 1;
INSERT INTO course (CourseID, Title, Description, Category, InstructorID) 
VALUES(1, 'Eye whether where involve.', 'Floor part have size camera catch attorney. Environment reach name. Environment floor guy word.',
'Programming', 8),
(2, 'Age score network.', 'Plan community memory friend guy surface. Attention become month your. Machine even purpose hair.',
'Design', 6),
(3, 'Nice phone read nice question.', 'Improve fight response guess see which yard. Occur treat dream. Tv scientist Congress oil.
While foreign similar visit.', 'Business', 54),
(4, 'Environmental write or.', 'Option condition show agree evening. Law treat answer room brother son.', 'Design', 32),
(5, 'Far kid tough kitchen.', 'Necessary full receive federal staff. Everybody probably simple hard. Dinner teach certainly fast watch can
understand.', 'Programming', 4),
(6, 'President similar section this.', 'Term follow of security successful similar. Public weight fine where range thing.', 'Design', 39),
(7, 'Class candidate relationship town just.', 'Speak customer billion ok defense method. Left natural today identify hair. Bad certain
usually choose.', 'Math', 5),
(8, 'Develop when resource newspaper.', 'Deal place people. Serve imagine resource scene.
Fact meeting me believe. Ever total late central call develop want. Realize face next charge a.', 'Programming', 1),
(9, 'Discover suddenly.', 'Machine start movie whatever form level could. South fight animal.
Claim democratic baby sport. Election painting politics himself station weight.', 'Math', 30),
(10, 'Challenge we traditional.', 'Discuss test smile. Role try sell.
Discover challenge by rise building writer Democrat. Follow likely war goal.', 'Business', 42),
(11, 'Describe wind tonight home.', 'Surface treat tonight law experience worker. Fine guess chance view shoulder water.
Stay arrive power bit. Person situation fish great information.', 'History', 37),
(12, 'Tonight society eight.', 'Back Mr successful over interview those. Sure office those right.
Style PM computer tax respond. Trial maintain push smile laugh.', 'Design', 41),
(13, 'Drug drive where.', 'Forget difficult individual cell go ready.
Soldier if option. Possible such some after rate.', 'History', 13),
(14, 'Language today whom.', 'Book peace serious account Mrs by.Kind doctor person may accept. Whatever make bad across
politics long hard.', 'Science', 25),
(15, 'Prepare shoulder.', 'Memory drop owner six enter. Ability month structure center right phone discussion.', 'Programming', 49),
(16, 'Job person dog especially.', 'Of southern require dinner.
Himself skill listen role over career some bill. Sit democratic race morning war.', 'Science', 38),
(17, 'Impact pass base work now.', 'Ago international together along standard note. Soon eye put trip like race fund agree. Value
mean space decision list.', 'Design', 35),
(18, 'Loss southern same.', 'Card discover station picture. Animal something arrive where something. Month conference issue page.',
'Business', 21),
(19, 'Quickly then herself.', 'Woman music tell story partner drive.', 'Science', 9),
(20, 'Next our health.', 'Bag size star perhaps decade if. Radio apply vote physical. Value none huge important.', 'Programming', 48),
(21, 'Safe trouble message ago thing.', 'Area claim indicate class ability necessary generation. Choice push listen statement
necessary million work.', 'Math', 10),
(22, 'For leave election bag.', 'Movie ball though exactly away small social figure. Different note baby man. Investment collection
special nothing.', 'Design', 44),
(23, 'Actually special good.', 'Home we beautiful south American. Instead simply great sort.
Property film me no. Join past state role. Actually rest share act someone part when.', 'Programming', 42),
(24, 'Moment light.', 'Cup thus act occur power. Whole father through. Arm not picture summer end.', 'History', 2),
(25, 'Report each degree old seek.', 'Southern several fall think treatment second base. Suddenly effect everybody record just may
my.', 'Design', 51),
(26, 'Yourself world contain professional.', 'Memory many whether meet suggest. Rest behavior two quite church both natural.
Light car action evidence policy base. Great decide once event.', 'Programming', 27),
(27, 'Under determine.', 'Occur far tough. Decade check your better another figure right score.', 'History', 9),
(28, 'Impact computer soon gas.', 'Explain cut hour center. Finish me high opportunity control community million. Age entire who
difference sound grow.', 'Science', 52),
(29, 'Finally imagine win.', 'We surface movement month enter from still. Quickly full model industry less him well. ContaiContain fight
beyond all vote.', 'Science', 21),
(30, 'International three.', 'Put TV form tree agency. Fund pressure its method young part number how.', 'Math', 26);
select * from course;
SET foreign_key_checks = 0;
SET foreign_key_checks = 1;
INSERT INTO lesson (LessonID, CourseID, Title, Content, VideoURL) 
VALUES(1, 1, 'Pick wide these already husband show consider.', 'Situation system wide. Its he sure lead suggest represent. Add card
collection yourself poor it.
History line heavy high. Meeting fund use create bad job table window.
Own allow president friend. House while administration leader.', 'http://ward.com/'),
(2, 1, 'Serious successful person main.', 'Suggest free family whether in. Pretty break own receive certainly dream. When series
young Congress education far organization plant.
Can fast last election. Congress free bed.', 'https://johns.com/'),
(3, 15, 'Treat very evidence under citizen investment affect.', 'Last weight case increase available magazine. Tv care exactly simple
third growth teacher vote. Factor assume very series read both under.
Yourself audience new high current. Fight degree bad protect fight. Even base thus this goal to.', 'http://www.zhang-scott.com/'),
(4, 22, 'Pick suddenly director beautiful series.', 'Option live newspaper test long whose sell book. Into mouth might. Because such
drug others risk size husband city. Simple defense lead condition.
Open big ask discuss. Minute need somebody entire her work argue. Response finish kitchen family.', 'https://www.davis.biz/'),
(5, 5, 'Left this value house.', 'Hundred when however tough Democrat off bank. Player defense you foreign by site.
Bar direction doctor man. Never build budget real let police season. Team air relationship keep idea.', 'http://www.blair.info/'),
(6, 28, 'Culture morning find stuff guess probably.', 'Seven image its cause. Policy second market yet soon political. Appear causebehavior draw far bed member Mr.
Candidate war southern game. Once turn school reveal hit note.', 'https://ward.net/'),
(7, 3, 'Step dream foot tax which task benefit.', 'Learn measure cover property fight catch while. Site onto tree need enough.
Do energy analysis would prepare. Fight east crime there religious.
Social social finish industry. Them child direction recent.', 'https://www.walker-hoffman.org/'),
(8, 3, 'Different stop hit method last.', 'The stuff lead under. Glass director event large reach positive maybe minute. Heavy age eat
firm peace should.
Various range culture. Budget use send mention help career five. Customer community activity group huge last letter.',
'https://carter-sexton.com/'),
(9, 28, 'Life director region forward while up.', 'Likely paper be what yes. Land decade that catch white. Produce majority end hear
change single yeah address.
Idea back early local office example. Employee often admit oil page fly.', 'https://www.moran-greene.info/'),
(10, 21, 'Total risk Mr month institution marriage staff.', 'Man enjoy wide from. Sort be discussion from at. She according class yet
kitchen turn.
On hand open pull difficult. Yourself charge left.
True capital lay would. Role my again media someone. Fill change vote fish.', 'http://turner-sanders.biz/'),
(11, 27, 'Remember left which agency general.', 'Large then brother bed. Perhaps question employee case exist.
Get speak energy others year event. Man rich than challenge suffer note. Trade you I along skin.
Visit list pay American energy own reveal. Read similar miss long.', 'https://www.henderson-suarez.com/'),
(12, 6, 'Never air after individual kind bank born.', 'Guy some size quite according training. Information bring above outside. Daughtecreate factor remain whether better effort.
Score help instead service wind save plant tree. Relate song listen debate leader price spring.', 'https://boone-johns.com/'),
(13, 10, 'Accept cut water talk paper.', 'Eat someone positive movement management contain safe. Majority star hear town serve
purpose think. Magazine maintain school economic box seat.
Mission key street. Share suffer plant cell.', 'https://rodriguez.com/'),
(14, 7, 'Professor few become among feel performance.', 'Coach amount human ready Mr artist group. Professor them mother not.
People book able physical situation another.
Investment music campaign most sort. Thought throw development his bit vote.', 'http://buckley.com/'),
(15, 10, 'Act according catch try modern skin prove.', 'New continue official spring situation idea head. Middle kind wish better above
girl low. Cold hard artist lay edge at.
Study source team soldier body policy. Support force material rest stock toward down scientist.', 'https://www.frye.com/'),
(16, 26, 'Goal college consumer PM increase.', 'Today entire bag nature environment.
Tax no enough and heart than road. Relate herself green. Participant performance like performance admit.
Decide raise only authority born hand. American board white walk.', 'http://www.elliott.info/'),
(17, 27, 'New plant support people suddenly pass.', 'Method either whole Congress bar step brother.
Cup letter mean long natural decision put. Husband peace bar process.
Not practice which sea southern open. Loss animal agree. Woman among what step whose call card.', 'http://www.todd-hall.biz/'),
(18, 2, 'Serve mean budget best share affect.', 'During blood hotel tend bar situation. Defense station become color only open receive.
Protect economy cold feel poor sure sea include. Hair bed others together bar realize bed board.', 'http://www.santana.org/'),
(19, 22, 'Here test fund TV popular worry.', 'Article memory someone suddenly region. Share information growth south some bank bad
consider. Order should four minute fund time financial practice.', 'http://www.henderson.biz/'),
(20, 16, 'Sort attack economy political executive so worry.', 'Firm amount wall modern less. Option discussion themselves south.
Daughter conference agreement school other.
Tough sing administration great room. Finish improve member arrive movie number campaign.', 'http://www.nelson-leon.org/'),
(21, 29, 'Stuff church opportunity without.', 'Heavy make animal case between that option across. Lay society there rest prove body.
Believe single president.
Here ask PM. Kid subject we gun.
Maybe by little wall size street. Phone benefit hair. Whose light direction election as thousand.', 'http://www.castro.info/'),
(22, 28, 'Skill no read wish way much quickly foot.', 'Perform cup question account accept. Minute yard scene ten way finally. Lose
enough cup light along form sometimes full.
Bring firm strong western. Congress phone item sit ability growth month.', 'https://wood.com/'),
(23, 17, 'Agency response summer then of door couple.', 'Nice choose prevent data across along. State stop stage health western.
State attention standard scene before certain game.
Family and necessary best appear six eight. Term send laugh owner learn article. Growth quickly large size.',
'https://cooper-carr.com/'),
(24, 23, 'Support first opportunity.', 'Force trouble fast else. Product trip writer prevent training. World realize risk window me produce.
Fight mission adult white community he. Somebody soon commercial.', 'https://hernandez.net/'),
(25, 19, 'Customer under suggest manage pass under.', 'Just view institution pull. Key represent produce story apply suffer small.
Day voice walk real. Them yes view drop. Direction share eight professor.', 'http://baldwin.info/'),
(26, 16, 'Next reduce political event history night.', 'Defense role really medical card state. Treat no per himself fly since on.
Ago city region pressure toward clear. Leg evidence chair.
Process hard avoid ball firm affect key. Same lay occur describe through. Accept cell final who use foot.','https://www.stevenson-graham.com/'),
(27, 14, 'Network talk network knowledge cut real.', 'Develop happy special time four ten. Visit among hear TV send how fact by.
Yourself could guy visit top main. One whom visit movie force pretty.
Upon half behavior bed. Fly often including like fall. Explain bill remain may fire herself social.', 'http://bass-scott.com/'),
(28, 15, 'Clear read never present sit.', 'Cost it school probably strategy executive yet. Air nor time possible.
Reduce whom support listen. Reveal whose something price prepare collection sure.
Shoulder perform believe. Themselves actually grow indeed eye. Discussion sister save.', 'http://wallace.org/'),
(29, 1, 'Such operation term degree just itself evening.', 'Seek owner although room cup a. Serve task box official issue build. Side
skin establish front south.
Size read yes carry office. Course ten too television thing everybody. Beyond drop reduce wife door response professor financial.',
'http://www.johnson.com/'),
(30, 17, 'Beautiful compare that economic food none recently decade.', 'Walk loss end hair seem. Whose inside crime office certainly
respond food energy.
Sing his side baby. And structure vote trouble ever later now. Reality morning interest sell.', 'https://hoffman.com/');
select * from lesson;
SET foreign_key_checks = 0;
SET foreign_key_checks = 1;
INSERT INTO enrollment (EnrollmentID, StudentID, CourseID, EnrollmentDate, CompletionStatus) VALUES
(1, 38, 15, '2023-12-01', 'In Progress'),
(2, 19, 15, '2023-10-25', 'Completed'),
(3, 29, 6, '2025-03-08', 'Not Started'),
(4, 20, 4, '2024-10-08', 'Not Started'),
(5, 11, 7, '2024-02-12', 'Completed'),
(6, 15, 13, '2025-01-02', 'Not Started'),
(7, 3, 22, '2024-03-05', 'In Progress'),
(8, 14, 20, '2024-09-27', 'Not Started'),
(9, 3, 9, '2025-02-01', 'Not Started'),
(10, 33, 12, '2025-02-02', 'Not Started'),
(11, 38, 24, '2025-01-20', 'In Progress'),
(12, 10, 29, '2023-07-03', 'Completed'),
(13, 6, 4, '2024-12-08', 'Not Started'),
(14, 31, 20, '2025-03-20', 'Not Started'),
(15, 39, 25, '2024-06-17', 'In Progress'),
(16, 29, 2, '2024-09-08', 'In Progress'),
(17, 1, 11, '2023-10-24', 'Completed'),
(18, 35, 24, '2024-07-23', 'Completed'),
(19, 21, 9, '2023-08-15', 'In Progress'),
(20, 35, 7, '2024-03-21', 'Completed'),
(21, 36, 10, '2023-09-19', 'Not Started')