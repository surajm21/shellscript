#!/bin/bash -x


IS_FULL_TIME=1
IS_PART_TIME=2
EMP_RATE_PER_HOUR=25
TOTAL_WORKING_DAYS=5
MAX_HOURS_IN_MONTH=20


totalEmpHrs=0
totalWorkingDays=1
totalSalary=0


while [[ $totalEmpHrs -lt $MAX_HOURS_IN_MONTH
      && $totalWorkingDays -le $TOTAL_WORKING_DAYS ]]
do
   empCheck=$((RANDOM%3))


   case $empCheck in
      $IS_FULL_TIME) workingHrs=8 ;;
      $IS_PART_TIME) workingHrs=4 ;;
      *) workingHrs=0
   esac


   ((totalWorkingDays++))
   totalEmpHrs=$((totalEmpHrs+workingHrs))
done


totalSalary=$((totalEmpHrs*EMP_RATE_PER_HOUR))


echo "Total Working Days: " $totalWorkingDays
echo "Total Working Hours: " $totalEmpHrs
echo "Monthly Salary is: " $totalSalary
