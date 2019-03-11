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
		PhonesB : Character;
		Computer : Character;
		Network : Character;
		ScheduleGood : Boolean := True;
	begin
		for time in 1..4 loop
			PhonesA := Shifts(time, 1);
			PhonesB := Shifts(time, 2);
			Computer := Shifts(time,3);
			Network := Shifts(time, 4);
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

	function noRepeats (Employee : Employees; Shifts : TimeSheet) return Boolean is
		NoDuplicates : Boolean := True;
		StartingSpot : Integer;
		type CharArray is array (1..16) of Character;
		Holding : CharArray;
	begin
		Holding(1) := Shifts(1, 1);
		Holding(2) := Shifts(1, 2);
		Holding(3) := Shifts(1, 3);
		Holding(4) := Shifts(1, 4);
		Holding(5) := Shifts(2, 1);
		Holding(6) := Shifts(2, 2);
		Holding(7) := Shifts(2, 3);
		Holding(8) := Shifts(2, 4);
		Holding(9) := Shifts(3, 1);
		Holding(10) := Shifts(3, 2);
		Holding(11) := Shifts(3, 3);
		Holding(12) := Shifts(3, 4);
		Holding(13) := Shifts(4, 1);
		Holding(14) := Shifts(4, 2);
		Holding(15) := Shifts(4, 3);
		Holding(16) := Shifts(4, 4);
		for Location in 1..15 loop
			StartingSpot := location + 1;
			for Index in StartingSpot..16 loop
				if Holding(Location) = Holding(Index) then
					NoDuplicates := False;
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
	if jobsGood(Employee, ShiftsList, NumberOfEmployees) and noRepeats (Employee, ShiftsList) then
		put("Acceptable");
	else
		put("Not Acceptable");
	end if;
end jobs_ok;
