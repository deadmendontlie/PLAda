with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics, Ada.Strings.Unbounded;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics, Ada.String.Unbounded;

procedure jobs_ok is 
	type Employees is array (Positive range <>) of Block_Of_Characters;
	Blocks: Employees (1 ..26);
	type TimeSheet is array (Positive range <>) of Block_Of_Characters;
        Blocks: TimeSheet (1 ..4);
	NumberOfEmployees: Integer;
	N: Integer;
	M: Integer;
	Add in extra methods here



begin
	N := 1;
	for N in 1..20 loop
		Get_Line(Item => TimeSheeet(N));
	end loop;
	Get(NumberOfEmployees);
	M := 1;
	for m in 1..NumberOfEmployees loop
		Get_Line(Item => Employees(M));
	end loop;
