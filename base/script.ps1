# Powershell Script

# Print message to the console:
Write-Host "Hello World!"

# Variables
$name = "John"
$age = 25

Write-Host "Hello, my name is $name and I am $age years old"

# Math operations
$a = 1
$b = 2
$sum = $a + $b

Write-Host "Sum is $sum"

# # #
# Conditional Statements

# If-Else
$num = 5
if ($num -gt 0) {
	Write-Host "$num is positive"
} elseif ( $num -lt 0 ) {
	Write-Host "$num is negative"
} else {
	Write-Host "$num is 0"
}

# # #
# Loops

# for loop
for ($i=1; $i -le 5; $i++) {
	Write-Host "i: $i"
}

# while loop
$count = 1
while ($count -le 5) {
	Write-Host "Count: $count"
	$count++
}




