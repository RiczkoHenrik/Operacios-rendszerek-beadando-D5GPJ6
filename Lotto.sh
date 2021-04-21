

#! /bin/bash

echo "Lotto Játék"
echo "Készítette: Riczkó Henrik D5GPJ6"
echo "Adjon meg 5 tippet 1 és 90 közt: "

declare -a user_tipps

#Felhasználo megadja az 5 tippet
for (( i=1; i <= 5; ++i ))
do
echo -n "$i.Tipp: "
read tipp
user_tipps+=($tipp)
done

declare -a win_numbers

#A program generál 5 véletlen számot 1 és 90 közt
for (( j=1; j <= 5; ++j ))
do
win_numbers[$j]+=$(( $RANDOM % 91 ))
done

#Megjeleníti a nyerőszámokat
echo "A nyerő számok: "
echo ${win_numbers[*]}

declare -i corr=0
#Összehasonlítja a felhasználó tippjeit és a gép által generált 5 számot
for i in $( seq 1 ${#user_tipps[@]}); do
  for j in $( seq 1 ${#win_numbers[@]}); do
    if [ "${user_tipps[$i]}" = "${win_numbers[$j]}" ]; then
      corr+=1
    fi
  done
done

#Megjeleníti a helyes találatok számát
echo "$corr helyes találat!"





