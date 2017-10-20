#! /bin/bash
echo "Welcome to Hangman Bash"
words=("moon" "computer" "apple" "love" "New York")
wordSelectedNumber=$(($RANDOM%5))
stringASCII=""
for (( i=0 ; i<${#words[@]} ; i++ ))
do
	if [[ $i -eq "$wordSelectedNumber" ]]
	 then
		wordSelected="${words[$i]}"
		echo "$wordSelected"
		for (( j=0 ; j<${#wordSelected} ; j++ ))
		do
			stringASCII+=" _"
			
		done
	fi	
done

echo "Try to guess this word: $stringASCII"
wrong=0
good=0 

while [ $wrong -lt 3 ] && [ $good -lt ${#wordSelected} ]
do
echo ""
echo "Enter the position:"
read position 
((position--))
echo ""
echo "Enter the letter:"
read letter
for (( k=0 ; k<${#wordSelected} ; k++ ))
do
	if [ $k -eq $position ]	
	then 
	if  [ ${wordSelected:k:1} == $letter ]
	then
			echo "Good!"
			for (( u=0 ; u<${#stringASCII}-1 ; u++ ))
			do
				if [ $u -eq $position ]
				then 
				   aux+=$letter
				else 
				  aux+=${stringASCII:u:1}
				fi
			done
			((good++))
			stringASCII=$aux
			echo "Word update: $stringASCII"
			unset aux	 
	else
			echo "Wrong!" 	
			((wrong++))
			
			if [ $wrong -eq 1 ] 
			then
	echo "          __________"
	echo "         |         |"
	echo "         |         |"
	echo "       _/_\_       |"
	echo "        |_|        |"
	echo "         |         |"
	echo "         |         |"
	echo "         |         |"
	echo "         |         |"
	echo "                   |"
	echo "                   |"
	echo "                   |"
	echo "      _____________|_____"
	
			else 

	echo "          __________"
	echo "         |         |"
	echo "         |         |"
	echo "       _/_\_       |"
	echo "        |_|        |"
	echo "         |         |"
	echo "      ---|---      |"
	echo "         |         |"
	echo "         |         |"
	echo "                   |"
	echo "                   |"
	echo "                   |"
	echo "      _____________|_____"

			fi
			echo "Error number: $wrong"
		fi
	fi 
done
done

if [[ $wrong -eq 3 ]]
	then
	 
	echo "          __________"
	echo "         |         |"
	echo "         |         |"
	echo "       _/_\_       |"
	echo "        |_|        |"
	echo "         |         |"
	echo "      ---|---      |"
	echo "         |         |"
	echo "         |         |"
	echo "        / \        |"
	echo "       /   \       |"
	echo "                   |"
	echo "      _____________|_____"  
	echo ""
	echo "Sorry. You lost :( "
else 
echo ""
echo "Congratulations. You win :) "
fi 
