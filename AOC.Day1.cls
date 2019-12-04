Class AOC.Day1 Extends %RegisteredObject
{

// fuelRequired = ($SYSTEM.SQL.FLOOR(mass/3))-2

// totalFuel = sum(fuelRequired)

ClassMethod GetFuel() As %Status
{
		S input="C:\Users\d9728\Documents\input.txt"
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
		
		W totalFuel,!
}

ClassMethod GetFuel2() As %Status
{
	
		S input="C:\Users\d9728\Documents\input.txt"
		S totalFuel=0
		S file=##class(%File).%New(input)
		D file.Open("R")
		
		While 'file.AtEnd { 
			S mass =  file.Read()	
			I $L(mass) {
				S thisModFuel=0
				S fuelRequired = ($SYSTEM.SQL.FLOOR(mass/3))-2
				S thisModFuel=thisModFuel+fuelRequired
				While fuelRequired>0 {
					S newmass=fuelRequired
					S fuelRequired = ($SYSTEM.SQL.FLOOR(newmass/3))-2
					
					I fuelRequired>0 {S thisModFuel=thisModFuel+fuelRequired}
		
				}
				S totalFuel=totalFuel+thisModFuel
				
			}
			
		}
		
		W totalFuel,!
}

}
