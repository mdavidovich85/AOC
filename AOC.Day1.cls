Class AOC.Day1 Extends %RegisteredObject
{

// fuelRequired = ($SYSTEM.SQL.FLOOR(mass/3))-2

// totalFuel = sum(fuelRequired)

ClassMethod GetFuel() As %Status
{
		S input="C:\Users\mdavidovich\Documents\AOC\input.txt"
		S totalFuel=0
		S file=##class(%File).%New(input)
		D file.Open("R")
		
		While 'file.AtEnd { 
			S mass =  file.Read()
			I $L(mass) {
			S fuelRequired = ($SYSTEM.SQL.FLOOR(mass/3))-2
			S totalFuel=totalFuel+fuelRequired
			}
		}
		
		W totalFuel
}

}
