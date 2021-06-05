main() { 
echo -e "\n\e[1;33m\e[1;41m > Among us \e[0m" 
echo -e "\e[1;33m\e[1;42m > Unlucky \e[0m" 
echo -e "\e[1;33m\e[1;43m > Riddle me \e[0m" 
echo -e "\e[1;33m\e[1;44m > +25 bonus points \e[0m" echo -e "\e[1;33m\e[1;45m > Secret number \e[0m" echo -e "\e[1;33m\e[1;46m > +50 bonus points \e[0m" echo -e "\n\e[0m\e[1;33m\e[1;34mEnter: s to spin | v to view score | any key to quit \e[0m" 
read input 
if [ -z $input ]; then 
echo "Invalid input!" 
main 
elif [ $input == "s" ];then 
spin 
elif [ $input == "v" ]; then 
echo -e "\e[1;33m\e[1;34mYour score is $points \e[0m" main 
fi 
} 
color() { 
echo -e "\n\e[1;41m-> Among us\e[0m" 
echo -e "There is 1 impostor among us" 
echo -e 
"\e[1;34mBlue\t\e[1;31mRed\t\e[1;32mGreen\t\e[0;33mYellow\t\e [1;35mPurple" 
echo -e "Who is it?" 
read icolor 
if [[ $icolor =~ ^[+-]?[0-9]+$ ]]; then 
echo -e "\nPlease enter a string next time!" 
main 
elif [ -z $icolor ]; then 
echo -e "Invalid input!"
main 
fi 
icolor=$(echo "$icolor" | tr '[:upper:]' '[:lower:]') colors=("blue" "red" "green" "yellow" "purple") pno=$(( $RANDOM % 5 )) 
pcolor=${colors[$pno]} 
if [ $icolor == $pcolor ]; 
then 
echo -e "\n\e[1;32mYay! You guessed it right! \e[0m" echo -e "+100 points!" 
points=`expr $points + 100` 
echo -e "\nYour total points are $points" 
else 
echo -e "\n\e[1;31mSorry, wrong guess!\e[0m\n$pcolor was the impostor!\nBetter luck next time!" 
fi 
main 
} 
number(){ 
echo -e "\n\e[1;45m-> Secret number!\e[0m" 
sno=$(( $RANDOM % 7 + 1 )) 
echo -e "\nShhh!\nI lie between 1 and 7..." 
if test $sno -eq 1 
then echo -e "Hint: I feel alone sometimes :(" elif test $sno -eq 2 
then echo -e "Hint: I'm the number of wings :P" elif test $sno -eq 3 
then echo -e "Hint: You feel sweaty when ___ of us don't spin" 
elif test $sno -eq 4 
then echo -e "Hint: Without ___ of us, tables fall down" elif test $sno -eq 5 
then echo -e "Hint: Without ___ of us, you can't even write" elif test $sno -eq 6 
then echo -e "Hint: 2 and 3 are my factors ;P" elif test $sno -eq 7 
then echo -e "Hint: I'm in the week and in the rainbow" fi
echo -e "Who am I?" 
read num 
if [[ -n ${num//[0-9]/} ]]; then 
echo -e "\nPlease enter a valid number next time!" elif test $num -eq $sno 
then 
echo -e "\n\e[1;32mExcellent, you got me!\e[0m" echo -e "\e[1;32m+90 points\e[0m" 
points=`expr $points + 90` 
elif [ -z $num ]; 
then 
echo -e "Oops! Invalid input" 
main 
else 
echo -e "\n\e[1;31mYou were wrong :( \nI was $sno\e[0m" fi 
main 
} 
riddle(){ 
ques=("What has a neck but no head?" "What has an eye but can't see?" "What tastes bet 
ter than it smells?" "What has hands but can't clap?") answ=("bottle" "needle" "tongue" "clock") 
echo -e "\n\e[1;43m-> Riddle me!\e[0m\n" 
pques=$(( $RANDOM % 4 )) 
echo -e "${ques[$pques]}" 
read ans 
if [[ $ans =~ ^[+-]?[0-9]+$ ]]; then 
echo -e "\nPlease enter a string next time" main 
fi 
if [ -z $ans ]; then 
echo -e "Oops! Invalid input!" 
main 
fi 
ans=$(echo "$ans" | tr '[:upper:]' '[:lower:]') pansw=${answ[$pques]} 
if [ $ans == $pansw ]; then
echo -e "\n\e[1;32mThat's right!" 
echo -e "\e[1;32m+200 points\e[0m" 
points=`expr $points + 200` 
echo -e "Your total points are now $points!\n" else 
echo -e "\n\e[1;31mThat's wrong!\e[0m\nThe right answer is $pansw \nBetter luck next t 
ime!" 
fi 
main 
} 
spin(){ 
pick=$(( $RANDOM % 6 + 1 )) 
case $pick in 
"1") color ;; 
"2") 
echo -e "\e[1;42m UNLUCKY! \e[0m\nBetter luck next time!" main ;; 
"3") riddle ;; 
"4") 
points=`expr $points + 25` 
echo -e "\e[1;44m->+25 bonus points\e[0m" 
echo -e "\n\e[1;32mYay! You won 25 points.\nYour total points are now $points\e[0m" 
main ;; 
"5") number ;; 
"6") 
points=`expr $points + 50` 
echo -e "\e[1;46m->+50 bonus points\e[0m" 
echo -e "\n\e[1;32mHurray! You won 50 points.\nYour total points are now $points\e[0m" 
main ;; 
esac 
} 
points=0 
echo -e "\n\n\e[1;33m\e[1;41m S \e[1;42m P \e[1;43m I \e[1;44m N \e[0m \e[1;33m\e[1;41
m T \e[1;42m H \e[1;43m E \e[0m \e[1;33m\e[1;41m W \e[1;42m H \e[1;43m E \e[1;44m E \e 
[1;42m L \e[0m\n" 
echo -e "\e[1;33mWelcome!\n\e[1;36mPlayer Name: " read name 
echo -e "\n\e[0m\e[1;33m\e[1;34m Hello ${name}! \e[0m" main 
