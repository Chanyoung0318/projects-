create database 숙소_웹;

use 숙소_웹;

create table 한국(
	지역번호 char(10) not null,
	지역명 char(20),
	primary key(지역번호)
);

insert 한국 values('02','서울');
insert 한국 values('031','경기도');
insert 한국 values('033','강원도');
insert 한국 values('043','충청도');
insert 한국 values('063','전라도');
insert 한국 values('054','경상도');
insert 한국 values('064','제주도');


select *
from 한국;

create table 숙소(
	주소 char(50) not null,
	숙소명 char(30),
	전용주차장 char(10),
	전용풀장 char(10),
	피트니스센터 char(10),
	카페테리아 char(10),
	조식 char(10),
	지역번호 char(10),
	primary key(주소),
	foreign key(지역번호) references 한국(지역번호)
);

insert 숙소 values('서울 중구 남대문로 7길','크라운파크호텔','O','X','O','O','O','02');
insert 숙소 values('서울 중구 삼일대로 362','롯데시티호텔','O','O','O','O','O','02');
insert 숙소 values('서울 중구 장충단로 198','써미트호텔','O','X','X','O','O','02');
insert 숙소 values('경기도 가평 북한강로 2245','마이다스호텔','O','X','X','X','X','031');
insert 숙소 values('경기도 이천 서이천로 449','에덴파라다이스호텔','O','X','X','X','X','031');
insert 숙소 values('경기도 평택 평택1로 7','스테이호텔','X','X','X','X','X','031');
insert 숙소 values('강원도 평창 오목길 107','라마다호텔','O','X','X','O','O','033');
insert 숙소 values('강원도 동해시 136','동해오션시티호텔','O','O','X','X','X','033');
insert 숙소 values('강원도 원주 만대로 7','베니키아원주호텔','O','O','X','O','O','033');
insert 숙소 values('충청도 부여 규암면 400','롯대부여호텔','O','O','X','O','O','043');
insert 숙소 values('충청도 천안 동남구 200','소노벨호텔','O','O','X','X','X','043');
insert 숙소 values('충청도 보령 해수욕장8길','데이나이스호텔','O','X','X','X','X','043');
insert 숙소 values('전라도 여수 시청서6길','베니키아여수호텔','O','O','X','O','O','063');
insert 숙소 values('전라도 영광 옥당로 74','더스타호텔','O','X','X','O','O','063');
insert 숙소 values('전라도 목포 대불로 91','현대라한호텔','O','O','O','O','O','063');
insert 숙소 values('경상도 부산 진구 서전로 39','토요코인호텔','O','O','X','O','O','054');
insert 숙소 values('경상도 부산 진구 새싹로 35','티티호텔','O','X','X','O','X','054');
insert 숙소 values('경상도 부산 해운대구 달맞이길 62','미포오션사이드호텔','O','O','X','X','X','054');
insert 숙소 values('제주도 사장3길 33','더원호텔','O','X','X','O','X','064');
insert 숙소 values('제주도 애월읍 애월해안로 554','애월비치호텔','O','O','X','O','O','064');
insert 숙소 values('제주도 서귀포 태평로 436','브릿지호텔','O','O','X','O','O','064');



select *
from 숙소;

create table 객실(
	객실번호 int not null,
	방호수 int,
	가격 int,
	방크기 char(20),
	전망 char(30),
	인원수 int,
	침대사이즈 char(20),
	침대개수 int,
	주소 char(50),
	primary key(객실번호),
	foreign key(주소) references 숙소(주소)
);

insert 객실 values(4403,101,98000,'19m^2','도시전망',2,'싱글침대',2,'서울 중구 남대문로 7길');
insert 객실 values(1855,102,165000,'27m^2','도시전망',3,'싱글침대',3,'서울 중구 남대문로 7길');
insert 객실 values(6538,103,300000,'40m^2','도시전망',4,'더블침대',2,'서울 중구 남대문로 7길');
insert 객실 values(5499,201,98000,'19m^2','도시전망',2,'싱글침대',2,'서울 중구 남대문로 7길');
insert 객실 values(7945,202,165000,'27m^2','도시전망',3,'싱글침대',3,'서울 중구 남대문로 7길');
insert 객실 values(6771,203,300000,'40m^2','도시전망',4,'더블침대',2,'서울 중구 남대문로 7길');
insert 객실 values(7191,101,121000,'22m^2','도시전망',2,'더블침대',1,'서울 중구 삼일대로 362');
insert 객실 values(552,102,169000,'25m^2','도시전망',2,'싱글침대',2,'서울 중구 삼일대로 362');
insert 객실 values(2059,103,323000,'52m^2','도시전망',2,'더블침대',1,'서울 중구 삼일대로 362');
insert 객실 values(1317,201,121000,'22m^2','도시전망',2,'더블침대',1,'서울 중구 삼일대로 362');
insert 객실 values(7458,202,169000,'25m^2','도시전망',2,'싱글침대',2,'서울 중구 삼일대로 362');
insert 객실 values(8247,203,323000,'52m^2','도시전망',2,'더블침대',1,'서울 중구 삼일대로 362');
insert 객실 values(1550,101,77000,'18m^2','도시전망',2,'더블침대',1,'서울 중구 장충단로 198');
insert 객실 values(3998,102,88000,'21m^2','도시전망',2,'싱글침대',2,'서울 중구 장충단로 198');
insert 객실 values(4062,103,130000,'25m^2','도시전망',4,'더블침대',2,'서울 중구 장충단로 198');
insert 객실 values(6414,201,77000,'18m^2','도시전망',2,'더블침대',1,'서울 중구 장충단로 198');
insert 객실 values(5149,202,88000,'21m^2','도시전망',2,'싱글침대',2,'서울 중구 장충단로 198');
insert 객실 values(7542,203,130000,'25m^2','도시전망',4,'더블침대',2,'서울 중구 장충단로 198');
insert 객실 values(7637,101,54000,'14m^2','도시전망',1,'싱글침대',1,'경상도 부산 진구 서전로 39');
insert 객실 values(3257,102,64000,'16m^2','도시전망',2,'더블침대',1,'경상도 부산 진구 서전로 39');
insert 객실 values(5366,103,74000,'18m^2','도시전망',3,'싱글침대',3,'경상도 부산 진구 서전로 39');
insert 객실 values(7277,201,54000,'14m^2','도시전망',1,'싱글침대',1,'경상도 부산 진구 서전로 39');
insert 객실 values(784,202,64000,'16m^2','도시전망',2,'더블침대',1,'경상도 부산 진구 서전로 39');
insert 객실 values(6388,203,74000,'18m^2','도시전망',3,'싱글침대',3,'경상도 부산 진구 서전로 39');
insert 객실 values(9829,101,122000,'49m^2','도시전망',3,'싱글침대',3,'경상도 부산 진구 새싹로 35');
insert 객실 values(7342,102,194000,'74m^2','바다전망',4,'싱글침대',4,'경상도 부산 진구 새싹로 35');
insert 객실 values(8320,103,88000,'27m^2','도시전망',2,'싱글침대',2,'경상도 부산 진구 새싹로 35');
insert 객실 values(7535,201,122000,'49m^2','도시전망',3,'싱글침대',3,'경상도 부산 진구 새싹로 35');
insert 객실 values(7507,202,194000,'74m^2','바다전망',4,'싱글침대',4,'경상도 부산 진구 새싹로 35');
insert 객실 values(9354,203,88000,'27m^2','도시전망',2,'싱글침대',2,'경상도 부산 진구 새싹로 35');
insert 객실 values(2410,203,88000,'27m^2','도시전망',2,'싱글침대',2,'경상도 부산 진구 새싹로 35');
insert 객실 values(4784,101,61000,'26m^2','도시전망',2,'더블침대',1,'경상도 부산 해운대구 달맞이길 62');
insert 객실 values(3491,102,65000,'20m^2','도시전망',2,'싱글침대',2,'경상도 부산 해운대구 달맞이길 62');
insert 객실 values(6224,103,81000,'26m^2','바다전망',2,'더블침대',1,'경상도 부산 해운대구 달맞이길 62');
insert 객실 values(990,201,61000,'26m^2','도시전망',2,'더블침대',1,'경상도 부산 해운대구 달맞이길 62');
insert 객실 values(1065,202,65000,'20m^2','도시전망',2,'싱글침대',2,'경상도 부산 해운대구 달맞이길 62');
insert 객실 values(7436,203,81000,'26m^2','바다전망',2,'더블침대',1,'경상도 부산 해운대구 달맞이길 62');
insert 객실 values(6578,101,182000,'29m^2','호수전망',2,'더블침대',1,'경기도 가평 북한강로 2245');
insert 객실 values(6858,102,300000,'41m^2','정원전망',2,'싱글침대',3,'경기도 가평 북한강로 2245');
insert 객실 values(2293,103,430000,'65m^2','강전망',3,'싱글침대',3,'경기도 가평 북한강로 2245');
insert 객실 values(9328,201,182000,'29m^2','호수전망',2,'더블침대',1,'경기도 가평 북한강로 2245');
insert 객실 values(6614,202,300000,'41m^2','정원전망',2,'싱글침대',3,'경기도 가평 북한강로 2245');
insert 객실 values(5893,203,430000,'65m^2','강전망',3,'싱글침대',3,'경기도 가평 북한강로 2245');
insert 객실 values(5383,101,140000,'29m^2','정원전망',2,'싱글침대',2,'경기도 이천 서이천로 449');
insert 객실 values(4573,102,160000,'31m^2','정원전망',2,'더블침대',1,'경기도 이천 서이천로 449');
insert 객실 values(3705,103,220000,'48m^2','정원전망',4,'싱글침대',4,'경기도 이천 서이천로 449');
insert 객실 values(9509,201,140000,'29m^2','정원전망',2,'싱글침대',2,'경기도 이천 서이천로 449');
insert 객실 values(1927,202,160000,'31m^2','정원전망',2,'더블침대',1,'경기도 이천 서이천로 449');
insert 객실 values(6520,203,220000,'48m^2','정원전망',4,'싱글침대',4,'경기도 이천 서이천로 449');
insert 객실 values(9559,101,77000,'23m^2',null,2,'싱글침대',2,'경기도 평택 평택1로 7');
insert 객실 values(8528,102,88000,'24m^2',null,2,'더블침대',1,'경기도 평택 평택1로 7');
insert 객실 values(8739,103,129000,'49m^2','도시전망',4,'더블침대',4,'경기도 평택 평택1로 7');
insert 객실 values(5211,201,77000,'23m^2',null,2,'싱글침대',2,'경기도 평택 평택1로 7');
insert 객실 values(2155,202,88000,'24m^2',null,2,'더블침대',1,'경기도 평택 평택1로 7');
insert 객실 values(7866,203,129000,'49m^2','도시전망',4,'더블침대',4,'경기도 평택 평택1로 7');
insert 객실 values(3038,101,123000,'26m^2','산전망',2,'더블침대',1,'강원도 평창 오목길 107');
insert 객실 values(1997,102,152000,'26m^2','산전망',2,'싱글침대',2,'강원도 평창 오목길 107');
insert 객실 values(9000,103,335000,'88m^2','산전망',4,'더블침대',2,'강원도 평창 오목길 107');
insert 객실 values(8057,201,123000,'26m^2','산전망',2,'더블침대',1,'강원도 평창 오목길 107');
insert 객실 values(9835,202,152000,'26m^2','산전망',2,'싱글침대',2,'강원도 평창 오목길 107');
insert 객실 values(5216,203,335000,'88m^2','산전망',4,'더블침대',2,'강원도 평창 오목길 107');
insert 객실 values(9395,101,97000,'31m^2','산전망',4,'더블침대',2,'강원도 동해시 136');
insert 객실 values(3188,102,140000,'55m^2','바다전망',4,'더블침대',2,'강원도 동해시 136');
insert 객실 values(9598,103,210000,'53m^2','바다전망',6,'더블침대',3,'강원도 동해시 136');
insert 객실 values(4845,201,97000,'31m^2','산전망',4,'더블침대',2,'강원도 동해시 136');
insert 객실 values(7611,202,140000,'55m^2','바다전망',4,'더블침대',2,'강원도 동해시 136');
insert 객실 values(484,203,210000,'53m^2','바다전망',6,'더블침대',3,'강원도 동해시 136');
insert 객실 values(3732,101,110000,'30m^2','산전망',2,'더블침대',1,'강원도 원주 만대로 7');
insert 객실 values(1625,102,230000,'53m^2','도시전망',2,'더블침대',1,'강원도 원주 만대로 7');
insert 객실 values(6035,103,140000,'53m^2','도시전망',4,'더블침대',2,'강원도 원주 만대로 7');
insert 객실 values(5646,201,110000,'30m^2','산전망',2,'더블침대',1,'강원도 원주 만대로 7');
insert 객실 values(4178,202,230000,'53m^2','도시전망',2,'더블침대',1,'강원도 원주 만대로 7');
insert 객실 values(6443,203,140000,'53m^2','도시전망',4,'더블침대',2,'강원도 원주 만대로 7');
insert 객실 values(9319,101,150000,'59m^2','정원전망',2,'더블침대',1,'충청도 부여 규암면 400');
insert 객실 values(5702,102,170000,'62m^2','정원전망',3,'싱글침대',3,'충청도 부여 규암면 400');
insert 객실 values(1791,103,200000,'102m^2','정원전망',4,'더블침대',2,'충청도 부여 규암면 400');
insert 객실 values(7246,201,150000,'59m^2','정원전망',2,'더블침대',1,'충청도 부여 규암면 400');
insert 객실 values(8186,202,170000,'62m^2','정원전망',3,'싱글침대',3,'충청도 부여 규암면 400');
insert 객실 values(854,203,200000,'102m^2','정원전망',4,'더블침대',2,'충청도 부여 규암면 400');
insert 객실 values(1391,101,120000,'82m^2','산전망',1,'더블침대',1,'충청도 천안 동남구 200');
insert 객실 values(6759,102,160000,'82m^2','산전망',4,'더블침대',2,'충청도 천안 동남구 200');
insert 객실 values(5514,103,190000,'102m^2','산전망',4,'더블침대',2,'충청도 천안 동남구 200');
insert 객실 values(2090,201,120000,'82m^2','산전망',1,'더블침대',1,'충청도 천안 동남구 200');
insert 객실 values(6994,202,160000,'82m^2','산전망',4,'더블침대',2,'충청도 천안 동남구 200');
insert 객실 values(7336,203,190000,'102m^2','산전망',4,'더블침대',2,'충청도 천안 동남구 200');
insert 객실 values(9687,101,94000,'32m^2','바다전망',2,'더블침대',1,'충청도 보령 해수욕장8길');
insert 객실 values(5824,102,124000,'49m^2','바다전망',2,'싱글침대',2,'충청도 보령 해수욕장8길');
insert 객실 values(5422,103,480000,'106m^2','바다전망',3,'싱글침대',3,'충청도 보령 해수욕장8길');
insert 객실 values(9936,201,94000,'32m^2','바다전망',2,'더블침대',1,'충청도 보령 해수욕장8길');
insert 객실 values(8541,202,124000,'49m^2','바다전망',2,'싱글침대',2,'충청도 보령 해수욕장8길');
insert 객실 values(6225,203,480000,'106m^2','바다전망',3,'싱글침대',3,'충청도 보령 해수욕장8길');
insert 객실 values(3302,101,88000,'35m^2','도시전망',2,'싱글침대',2,'전라도 여수 시청서6길');
insert 객실 values(7483,102,120000,'44m^2','바다전망',2,'싱글침대',2,'전라도 여수 시청서6길');
insert 객실 values(3093,103,131000,'49m^2','바다전망',2,'더블침대',1,'전라도 여수 시청서6길');
insert 객실 values(5575,201,88000,'35m^2','도시전망',2,'싱글침대',2,'전라도 여수 시청서6길');
insert 객실 values(2073,202,120000,'44m^2','바다전망',2,'싱글침대',2,'전라도 여수 시청서6길');
insert 객실 values(4493,203,131000,'49m^2','바다전망',2,'더블침대',1,'전라도 여수 시청서6길');
insert 객실 values(5836,101,92000,'17m^2','산전망',2,'더블침대',1,'전라도 영광 옥당로 74');
insert 객실 values(9309,102,128000,'25m^2','산전망',2,'싱글침대',2,'전라도 영광 옥당로 74');
insert 객실 values(3166,103,210000,'45m^2','산전망',2,'더블침대',1,'전라도 영광 옥당로 74');
insert 객실 values(3821,201,92000,'17m^2','산전망',2,'더블침대',1,'전라도 영광 옥당로 74');
insert 객실 values(4869,202,128000,'25m^2','산전망',2,'싱글침대',2,'전라도 영광 옥당로 74');
insert 객실 values(264,203,210000,'45m^2','산전망',2,'더블침대',1,'전라도 영광 옥당로 74');
insert 객실 values(3061,101,90000,'35m^2','도시전망',2,'싱글침대',2,'전라도 목포 대불로 91');
insert 객실 values(8287,102,130000,'35m^2','바다전망',2,'더블침대',1,'전라도 목포 대불로 91');
insert 객실 values(8624,103,201000,'69m^2','바다전망',2,'싱글침대',2,'전라도 목포 대불로 91');
insert 객실 values(9899,201,90000,'35m^2','도시전망',2,'싱글침대',2,'전라도 목포 대불로 91');
insert 객실 values(5344,202,130000,'35m^2','바다전망',2,'더블침대',1,'전라도 목포 대불로 91');
insert 객실 values(6559,203,201000,'69m^2','바다전망',2,'싱글침대',2,'전라도 목포 대불로 91');
insert 객실 values(1967,101,76000,'25m^2','도시전망',2,'싱글침대',2,'제주도 사장3길 33');
insert 객실 values(6572,102,81000,'27m^2','도시전망',2,'싱글침대',2,'제주도 사장3길 33');
insert 객실 values(9043,103,115000,'43m^2','도시전망',4,'더블침대',2,'제주도 사장3길 33');
insert 객실 values(5541,201,76000,'25m^2','도시전망',2,'싱글침대',2,'제주도 사장3길 33');
insert 객실 values(6933,202,81000,'27m^2','도시전망',2,'싱글침대',2,'제주도 사장3길 33');
insert 객실 values(3311,203,115000,'43m^2','도시전망',4,'더블침대',2,'제주도 사장3길 33');
insert 객실 values(5027,101,47000,'25m^2',null,1,'싱글침대',1,'제주도 애월읍 애월해안로 554');
insert 객실 values(3882,102,77000,'27m^2','바다전망',2,'싱글침대',2,'제주도 애월읍 애월해안로 554');
insert 객실 values(515,103,140000,'27m^2','바다전망',2,'더블침대',1,'제주도 애월읍 애월해안로 554');
insert 객실 values(2518,201,47000,'25m^2',null,1,'싱글침대',1,'제주도 애월읍 애월해안로 554');
insert 객실 values(4115,202,77000,'27m^2','바다전망',2,'싱글침대',2,'제주도 애월읍 애월해안로 554');
insert 객실 values(7374,203,140000,'27m^2','바다전망',2,'더블침대',1,'제주도 애월읍 애월해안로 554');
insert 객실 values(5104,101,48000,'25m^2','도시전망',2,'더블침대',1,'제주도 서귀포 태평로 436');
insert 객실 values(9642,102,131000,'28m^2','바다전망',3,'싱글침대',3,'제주도 서귀포 태평로 436');
insert 객실 values(9946,103,48000,'28m^2','바다전망',4,'더블침대',2,'제주도 서귀포 태평로 436');
insert 객실 values(4801,201,48000,'25m^2','도시전망',2,'더블침대',1,'제주도 서귀포 태평로 436');
insert 객실 values(5657,202,131000,'28m^2','바다전망',3,'싱글침대',3,'제주도 서귀포 태평로 436');
insert 객실 values(959,203,48000,'28m^2','바다전망',4,'더블침대',2,'제주도 서귀포 태평로 436');






select *
from 객실;

create table 이용자(
	전화번호 char(20) not null,
	이름 char(20),
	primary key(전화번호)
);
insert 이용자 values('010-8289-4220','심인정');
insert 이용자 values('010-1508-9350','허상원');
insert 이용자 values('010-4129-5915','탁재하');
insert 이용자 values('010-4337-2075','송동욱');
insert 이용자 values('010-2075-8693','이서언');
insert 이용자 values('010-6359-1698','류지희');
insert 이용자 values('010-7434-2401','조재철');
insert 이용자 values('010-1287-9444','제갈희수');
insert 이용자 values('010-2461-2317','이유주');
insert 이용자 values('010-5854-4925','류지수');


select *
from 이용자;


create table 예약현황(
	주소 char(50) not null,
	객실번호 int not null,
	전화번호 char(20) not null,
	primary key(주소,객실번호,전화번호),
	foreign key(주소)references 숙소(주소),
	foreign key(객실번호)references 객실(객실번호),
	foreign key(전화번호)references 이용자(전화번호)
);

insert 예약현황 values('전라도 영광 옥당로 74',5836,'010-5854-4925');
insert 예약현황 values('제주도 사장3길 33',5541,'010-2461-2317');
insert 예약현황 values('충청도 천안 동남구 200',6759,'010-8289-4220');
insert 예약현황 values('경기도 가평 북한강로 2245',6858,'010-4129-5915');
insert 예약현황 values('경상도 부산 진구 새싹로 35',2410,'010-1508-9350');
insert 예약현황 values('제주도 서귀포 태평로 436',4801,'010-1287-9444');


select *
from 예약현황;


-- 1. 서울의 숙소를 전부 검색하시오.

select 주소, 숙소명
from 숙소
where 주소 like '서울%%';

--2. 전용주차장이 X 표시된 숙소의 숙소명을 검색하시오.

select 숙소명
from 숙소
where 전용주차장 = 'X';

--3. 전국 숙소의 객실 중 4명이 정원인 객실의 정보를 검색하시오.

select *
from 객실
where 인원수 = 4;

--4. 전국 숙소의 객실 중 가격이 100000원 아래인 객실의 객실번호와 가격,주소를 검색하시오.

select 객실번호, 가격, 주소
from 객실
where 가격 <= 100000;

--5. 예약자 중 제주도를 예약한 사람의 전화번호를 찾으시오.

select 전화번호
from 예약현황
where 주소 like '제주도%%';

--6. 제주도 숙소에서 전용 풀장이 있는 숙소의 숙소명을 찾으시오.

select 숙소명
from 숙소
where 주소 like '제주도%%' and 전용풀장 = 'O';

--7. 서울 객실 중 방크기가 30m^2이 넘는 방의 가격과 주소를 구하시오.

select 주소, 가격
from 객실
where 방크기 >= '30m^2' and 주소 like '서울%%';

--8. 강원도 숙소의 가격이 150000원보다 높은 객실의 주소와 가격을 오름차순으로 정리하시오.

select 주소, 가격
from 객실
where 가격 >= 150000 and 주소 like '강원도%%'
order by 가격 Asc;

--9. 제갈희수의 전화번호로 제갈희수가 예약한 방의 객실번호를 검색하시오.

select 객실번호
from 이용자, 예약현황
where 이용자.전화번호 = 예약현황.전화번호 and 이름 = '제갈희수';

--10. 예약된 이용자 중 100000원 이상 쓴 사람의 전화번호를 찾으시오.(웹 이용자 이벤트 문자 용도)

select 전화번호
from 예약현황, 객실
where 예약현황.객실번호 = 객실.객실번호 and 가격 >= 100000;

--11. 경상도에서 바다전망이 보이는 객실의 가격과 주소를 검색하시오.

select 가격, 주소
from 객실
where 전망 = '바다전망' and 주소 like '경상도%%';

--12. 객실 평균가보다 높은 객실의 정보를구하시오.

select *
from 객실
where 가격 >=(
				select AVG(가격)
				from 객실
				);

--13. 가장 높은 가격의 객실의 정보를 검색하시오.

select *
from 객실
where 가격 = (
				select Max(가격)
				from 객실
				);

--14. 객실번호 6572의 객실을 '010-2075-8693'의 번호를 가진'이서언'님이 예약하셨습니다. 객실번호 6572를 가진 숙소의 주소를 찾아 예약현황을 추가하시오.

select 주소
from 객실
where 객실번호 = 6572;

insert 예약현황 values('제주도 사장3길 33',6572,'010-2075-8693');

select *
from 예약현황;

--15. '010-2075-8693'로 예약한 '이서언' 님이 예약을 취소하고 싶다고 합니다. 예약현황에서 없애십시오.

delete
from 예약현황
where 전화번호 = '010-2075-8693';

select *
from 예약현황;

--16. 크라운파크호텔이 리모델링 공사에 들어갔습니다. 주소 '서울 중구 남대문로 7길'를 통해 크라운 파크 호텔의 정보를 전부 없애십시오.

delete
from 객실
where 주소 = '서울 중구 남대문로 7길';

delete
from 숙소
where 주소 = '서울 중구 남대문로 7길';

select *
from 숙소, 객실
where 숙소명 = '크라운파크호텔';

--17. 전망이 없는 객실의 정보를 검색하시오.

select *
from 객실
where 전망 is null;

--18. 이용자 '송동욱'이 이름을 '송재형'으로 바꿨습니다. 기입된 이름을 수정하시오.

update 이용자
set 이름 = '송재형'
where 이름 = '송동욱';

select *
from 이용자
where 이름 = '송재형';

--19.객실이 너무 팔리지 않아 할인을 하려 합니다. 객실 테이블에 할인율 애트리뷰트를 추가하시오.

alter table 객실 add 할인율 int;

select *
from 객실;

--20. 개인정보 때문에 이용자의 정보를 없애야 합니다. 예약현황과 이용자 테이블을 제거하십시오.

drop table 예약현황;
drop table 이용자;

select *
from 예약현황;

select *
from 이용자;