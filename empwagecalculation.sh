#!/bin/bash


IS_FULL_TIME=1
IS_PART_TIME=2
EMP_RATE_PER_HOUR=25
TOTAL_WORKING_DAYS=21
MAX_HOURS_IN_MONTH=150


totalEmpHrs=0
totalWorkingDays=0
totalSalary=0
dailyWage=0


declare -A empWageDict


function getWorkingHours() {
   empCheck=$((RANDOM%3))


   case $empCheck in
      $IS_FULL_TIME) workingHrs=8 ;;
      $IS_PART_TIME) workingHrs=4 ;;
      *) workingHrs=0
   esac
}


while [[ $totalEmpHrs -lt $MAX_HOURS_IN_MONTH
      && $totalWorkingDays -le $TOTAL_WORKING_DAYS ]]
do


   ((totalWorkingDays++))
   getWorkingHours
   dailyWage=$((workingHrs*EMP_RATE_PER_HOUR))
   empWageDict[day$totalWorkingDays]=$dailyWage


   totalEmpHrs=$((totalEmpHrs+workingHrs))
done


totalSalary=$((totalEmpHrs*EMP_RATE_PER_HOUR))


empWageDict[totalSalary]=$totalSalary


for key in ${!empWageDict[@]}
do
   echo $key " : " ${empWageDict[$key]}
done


echo "Total Working Days: " $totalWorkingDays
echo "Total Working Hours: " $totalEmpHrs
echo "Monthly Salary is: " ${empWageDict[totalSalary]}
