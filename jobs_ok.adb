with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics;

procedure jobs_ok is 
	type NameAndSkills is record
		Person: Character;
		Phone: Integer;
		Computer: Integer;
		Netowrk: Integer;
	end record;
	type Employees is array (1..26) of NamesAndSkills;
	Employee: Employees;
	type TimeSheet is array (1..4,1..4) of Character;
        ShiftsList: TimeSheet;
	NumberOfEmployees: Integer;
	WhiteSpace: Character;
	--Add in extra methods here
	


begin
	for Shift in 1..4 loop
		for Job in 1..3 loop
			Get(ShiftsList(Shift, Job));
			Get(WhiteSpace);
		end loop;
			Get(ShiftsList(Shift, 4));
		Skip_Line;
	end loop;
	Get(NumberOfEmployees);
	Skip_Line;
	for Line in 1..NumberOfEmployees loop
		Get(TimeSheet(Line).Person);
		Get(TimeSheet(Line).Phone);
		Get(TimeSheet(Line).Computer);
		Get(TimeSheet(Line).Network);
		Skip_Line;
	end loop;
