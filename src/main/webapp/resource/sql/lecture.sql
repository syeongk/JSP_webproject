
create table lecture(
	lecId int not null auto_increment,
	lecName varchar(50),
	teacherName varchar(10),
	lecDescription varchar(150),
	lecCategory varchar(15),
	lecLevel varchar(2),
	lecPrice int(10),
	lecReviewCount int(5),
	image TEXT,
	video TEXT,
	primary key (lecId)
);

drop table lecture

select * from lecture

	
INSERT INTO lecture (lecName, teacherName, lecDescription, lecCategory, lecLevel, lecPrice, lecReviewCount, image, video)
VALUES ('한입 크기로 잘라 먹는 리액트(React.js) : 기초부터 실전까지',
		 '이정환',
		 '개념부터 독특한 프로젝트까지 함께 다뤄보며 자바스크립트와 리액트를 이 강의로 한 번에 끝내요. 학습은 짧게, 응용은 길게 17시간 분량의 All-in-one 강의!',
		 '프론트엔드',
		 '초급',
		 36300,
		 308,
		 'React.png',
		 'React.mov'),
		('이득우의 언리얼 프로그래밍 Part1 - 언리얼 C++의 이해',
		 '이득우',
		 '대기업 현업자들이 수강하는 언리얼 C++ 프로그래밍 전문 과정입니다. 언리얼 엔진 프로그래머라면 게임 개발전에 반드시 알아야 하는 언리얼 C++ 기초에 대해 알려드립니다.',
		 '게임 프로그래밍',
		 '중급',
		 99000,
		 250,
		 'unreal.png',
		 'unreal.mov'),
		('처음하는 MongoDB와 NoSQL 데이터베이스 부트캠프 [입문부터 활용까지]',
		 '잔재미코딩',
		 '최신 스타트업에서 활용하는 풀스택과 데이터과학 기술의 기본 기술 중 하나인 빅데이터를 다룰 수 있는 NoSQL 기술을 익힙니다. 몽고DB는 NoSQL 중에서도 가장 쉬우면서 빠르게 활용할 수 있는 기술입니다.',
		 '데이터 분석',
		 '초급',
		 49500,
		 147,
		 'mongodb.png',
		 'mongodb.mov'),
		('AWS 클라우드 서비스 인프라 구축 이해와 해킹, 보안',
		 '보안프로젝트',
		 '아마존 AWS 클라우드 환경 보안을 위해 알아야 할 기본적인 가상 인프라 구축부터, 각 영역별 보안 위협 모니터링, 취약점 진단 관점을 통해 보안 실무를 배우게 됩니다.',
		 '보안',
		 '초급',
		 99000,
		 143,
		 'security.png',
		 'security.mov'),
		('Kotlin 문법 총 정리 - 1시간',
		 '오준석',
		 '1시간 안에 학습할 수 있는 코틀린 문법 총 정리 강의입니다.',
		 '앱 개발',
		 '초급',
		 9900,
		 53,
		 'kotlin.png',
		 'kotlin.mov'
		 );