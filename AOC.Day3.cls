Class AOC.Day3
{

ClassMethod GetInput(Input As %String) As %Library.DynamicArray
{

	//S input="C:\Users\d9728\Documents\inputDay3.txt"
	S file=##class(%File).%New(Input)
	D file.Open("R")
		
		Set COUNT=0
		Set Wires=##class(%Library.DynamicArray).%New(),Wire=##class(%Library.DynamicArray).%New()	
		While 'file.AtEnd { 
			S string =  file.Read()
			I $L(string) {
				D Wire.%Push(string)
				D Wires.%Push(Wire)
				//ZW
			}
		}
	Return Wires
}

}
