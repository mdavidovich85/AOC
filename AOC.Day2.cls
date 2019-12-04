Class AOC.Day2
{

// Intcode program

// List of Ints e.g. 1,0,0,3,99

// Starts at postiion 0 - opcode (1,2,or 99)

// Opcode 99 - finished and halt

// Opcode 1 - adds together numbers read from two positions and stores the result in third position

// 	Three ints after the opcode 1 tell you these three positions 

// 	First two add, store result in third

// Opecode 2 - same as 1 but with multiplies two inputs instead of adding

// Once done processing, move forward four 

// Parmeter OpCode = "1,9,10,3,2,3,11,0,99,30,40,50";

ClassMethod BuildArray(OpCode As %String) As %Library.DynamicArray
{
	

	S array = ##class(%Library.DynamicArray).%New()
	F i=1:1:$L(OpCode,",") {
		S int = $P(OpCode,",",i)
		D array.%Push(int)
}
  return array
}

ClassMethod ResetAlarm(Input As %Library.DynamicArray) As %Library.DynamicArray
{
	S old = Input
	D old.%Set(1,12)
	D old.%Set(2,2)
	//W old.%ToJSON()
	S new = old
	return new
}

ClassMethod ProcessInput() As %Status
{
	
	S input="C:\Users\d9728\Documents\inputDay2.txt"
	S file=##class(%File).%New(input)
	D file.Open("R")
			
			While 'file.AtEnd { 
			S string =  file.Read()
			I $L(string) {
				S build=string
				//W "THE STRING:  ",string,!
			}
			}
	
	S array = ..BuildArray(build)
	S array = ..ResetAlarm(array)
	S OpCode = array.%Get(0)
	S OpCodePos=0
	
	WHILE OpCode'=99 {
		If OpCode=1 {
			S Pos0 = OpCodePos
			S Pos1 = OpCodePos+1
			S Pos2 = OpCodePos+2
			S Pos3 = OpCodePos+3
			S InputPos1 = array.%Get(Pos1)
			S InputPos2 = array.%Get(Pos2)
			S OutputPos = array.%Get(Pos3)
			S Add1 = array.%Get(InputPos1)
			S Add2 = array.%Get(InputPos2)
			S Result = Add1+Add2
			D array.%Set(OutputPos,Result)
			S OpCodePos = OpCodePos+4
			S OpCode = array.%Get(OpCodePos)
		}
		If OpCode=2 {
						S Pos0 = OpCodePos
			S Pos1 = OpCodePos+1
			S Pos2 = OpCodePos+2
			S Pos3 = OpCodePos+3
			S InputPos1 = array.%Get(Pos1)
			S InputPos2 = array.%Get(Pos2)
			S OutputPos = array.%Get(Pos3)
			S Mult1 = array.%Get(InputPos1)
			S Mult2 = array.%Get(InputPos2)
			S Result = Mult1*Mult2
			D array.%Set(OutputPos,Result)
			S OpCodePos = OpCodePos+4
			S OpCode = array.%Get(OpCodePos)
		}
	}
	W array.%Get(0)
}

}
