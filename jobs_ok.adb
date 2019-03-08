--By Kody Leptien and Jarret Strickton
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
	
	function jobsGood (EmployeeList : Employees, Shifts : TimeSheet) return Boolean is
		PhonesA : Character;
		PhonesB : character;
		Computer : character;
		Netowrk : character;
		ScheduleGood : Boolean := True;
	begin
		for time in 1..4 loop
			PhonesA := TimeSheet[1][time];
			PhonesB := TimeSheet[2][time];
			Computer := TimeSheet[3][time];
			Network := TimeSheet[4][time];
			for person in 1..26 loop
				if PhonesA = EmployeesList[person].Person then
					if 0 = EmployeesList[person].Phone then
						ScheduleGood := false;
					end if;
				end if;
				if PhonesB = EmployeesList[person].Person then
                                        if 0 = EmployeesList[person].Phone then
                                                ScheduleGood := false;
                                        end if;
                                end if;
				if Computer = EmployeesList[person].Person then
                                        if 0 = EmployeesList[person].Computer then
                                                ScheduleGood := false;
                                        end if;
                                end if;
				if Network = EmployeesList[person].Person then
                                        if 0 = EmployeesList[person].Network then
                                                ScheduleGood := false;
                                        end if;
                                end if;
			end loop;
		end loop;
		if ScheduleGood = false then
			return false;
		end if
	end jobsGood
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
		Get(Employee(Line).Person);
		Get(Employee(Line).Phone);
		Get(Employee(Line).Computer);
		Get(Employee(Line).Network);
		Skip_Line;
	end loop;
	if jobsGood(Employee, ShiftsList) and --Whatever Jarret Calls his function then
		put("Acceptable");
	else
		put("Not Acceptable");
	end if
end jobs_ok
