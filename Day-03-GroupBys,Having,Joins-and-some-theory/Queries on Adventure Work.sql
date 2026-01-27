--checking person table
select * from Person.Person
--checking dependencies then found person is dependent on BusinessEntity table so checking business Entity table
select * from Person.BusinessEntity
--adding a default value into BusinessEntity
insert into Person.BusinessEntity default values
--checking the latest change in businessEntity autocreated by system
select SCOPE_IDENTITY()
--inserting new value in person
INSERT INTO Person.Person
(
    BusinessEntityID,
    PersonType,
    NameStyle,
    Title,
    FirstName,
    LastName
)
VALUES
(
    20778,
    'EM',
    0,
    'Mr.',
    'Avishek',
    'Prasad'
);
--checking latest value that i added
select top 15 * BusinessEntityID from Person.Person order by BusinessEntityID desc;
--union and top usage
Select top 15 * from Person.BusinessEntity order by BusinessEntityID desc
union all
Select top 15 * from Person.Person order by BusinessEntityID desc

