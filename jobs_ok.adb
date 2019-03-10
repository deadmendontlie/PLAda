--By Kody Leptien and Jarret Strickton
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics;

procedure jobs_ok is 
	type NameAndSkills is record
		Person: Character;
		Phone: Integer;
		Computer: Integer;
		Network: Integer;
	end record;
	type Employees is array (1..26) of NameAndSkills;
	Employee: Employees;
	type TimeSheet is array (1..4,1..4) of Character;
        ShiftsList: TimeSheet;
	NumberOfEmployees: Integer;
	WhiteSpace: Character;
	--Add in extra methods here
	
	function jobsGood (Employee : Employees; Shifts : TimeSheet; NumberOfEmployees : Integer) return Boolean is
		PhonesA : Character;
		PhonesB : character;
		Computer : character;
		Network : character;
		ScheduleGood : Boolean := True;
	begin
		for time in 1..4 loop
			PhonesA := TimeSheet(1)(time);
			PhonesB := TimeSheet(2)(time);
			Computer := TimeSheet(3)(time);
			Network := TimeSheet(4)(time);
			for person in 1..NumberOfEmployees loop
				if PhonesA = Employee(person).Person then
					if 0 = Employee(person).Phone then
						ScheduleGood := false;
					end if;
				end if;
				if PhonesB = Employee(person).Person then
                                        if 0 = Employee(person).Phone then
                                                ScheduleGood := false;
                                        end if;
                                end if;
				if Computer = Employee(person).Person then
                                        if 0 = Employee(person).Computer then
                                                ScheduleGood := false;
                                        end if;
                                end if;
				if Network = Employee(person).Person then
                                        if 0 = Employee(person).Network then
                                                ScheduleGood := false;
                                        end if;
                                end if;
			end loop;
		end loop;
			return ScheduleGood;
	end jobsGood;

	function noRepeats (Employee : Employees; Shifts : TimeSheet; NumberOfEmployees : Integer) return Boolean is
		PersonChecking : character;
		duplicate : character;
		NoDuplicates : Boolean := True;

	begin
		for person in 1..NumberOfEmployees loop
			PersonChecking := Employee(person).Person;
				for person2 in person + 1..NumberOfEmployees loop
					if personChecking = Employee(person2).Person then
						if PersonChecking = duplicate then
							NoDuplicates := false;
						end if;
					end if;
				end loop;
		end loop;
			return NoDuplicates;
	end noRepeats;

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
	if jobsGood(Employee, ShiftsList, NumberOfEmployees) and noRepeats (Employee, ShiftsList, NumberOfEmployees) then --Whatever Jarret Calls his function then
		put("Acceptable");
	else
		put("Not Acceptable");
	end if;
end jobs_ok;
