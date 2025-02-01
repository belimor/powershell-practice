# Functions
#

function Add-Numbers {
	param (
	  [int]$num1,
	  [int]$num2
	)
	return $num1 + $num2
}

$result = Add-Numbers -num1 5 -num2 5
Write-Host "Result: $result"


