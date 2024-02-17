-- # SELECT from Nobel


--1. Winners from 1950
--Change the query shown so that it displays Nobel prizes for 1950.





SELECT yr, subject, winner FROM nobel
WHERE yr = 1950





--2. 1962 Literature
--Show who won the 1962 prize for literature.






SELECT winner FROM nobel
WHERE yr = 1962 AND subject = 'literature'




--3. Albert Einstein




--Show the year and subject that won 'Albert Einstein' his prize.





select yr,subject from nobel
where winner= 'Albert Einstein'



--4. Recent Peace Prizes




--Give the name of the 'peace' winners since the year 2000, including 2000.





select winner from nobel 
where yr >=2000 and subject ='peace'



--5.Literature in the 1980's



--Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.







select * from nobel 
where yr >= 1980 and yr <= 1989 and subject  = 'Literature'



--6. Only Presidents




--Show all details of the presidential winners:

--Theodore Roosevelt
--Thomas Woodrow Wilson
--Jimmy Carter
--Barack Obama



select * from nobel where winner in 
('Theodore Roosevelt','Thomas Woodrow Wilson','Jimmy Carter','Barack Obama')



--7. John



--Show the winners with first name John




select winner from nobel where winner like 'John %'



--8. Chemistry and Physics from different years




--Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984.





select * from nobel
where (yr = 1980 and subject = 'physics' ) or (yr = 1984 and subject  = 'chemistry')



--9. Exclude Chemists and Medics



--Show the year, subject, and name of winners for 1980 excluding chemistry and medicine



select yr, subject, winner from nobel
where yr = 1980 and subject not in('chemistry','medicine')



--10. Early Medicine, Late Literature



--Show year, subject, and name of people who won a 'Medicine' prize in an early year
--(before 1910, not including 1910) together with winners of a 'Literature' prize 
--in a later year (after 2004, including 2004)



select * from nobel where
(subject = 'Medicine' and yr < 1910 ) or (subject = 'Literature' and yr >=2004) 




--11. Umlaut




--Find all details of the prize won by PETER GRÜNBERG Non-ASCII characters




select * from nobel 
where winner = 'PETER GRÜNBERG'



--12. Apostrophe



--Find all details of the prize won by EUGENE O'NEILL

--Escaping single quotes
--You can't put a single quote in a quote string directly. 
--You can use two single quotes within a quoted string.




select * from nobel 
where winner = 'EUGENE O'NEILL''



--13. Knights of the realm



--Knights in order


--List the winners, year and subject where the winner starts with Sir.
--Show the the most recent first, then by name order.



select winner, yr, subject from nobel 
where winner like 'Sir%' order by yr desc, winner




--14. Chemistry and Physics last




--The expression subject IN ('chemistry','physics') can be used as a value - it will be 0 or 1.

--Show the 1984 winners and subject ordered by subject and winner name; but list chemistry and physics last.



select winner, subject from nobel where yr = 1984  order by subject IN ('chemistry','physics'),subject , winner


--30
