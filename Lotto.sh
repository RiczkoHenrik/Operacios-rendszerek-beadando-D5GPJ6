
#! /bin/bash

echo "Lotto Játék"
echo "Készítette: Riczkó Henrik D5GPJ6"
echo

while [ -n "$1" ]
do
case "$1" in

#Ötös lotto
-f)
echo "Adjon meg 5 tippet 1 és 90 között: "

declare -a user_tipps
declare -i tipp=0

#Felhasználo megadja az 5 tippet
for (( i=1; i <= 5; ++i ))
do
echo -n "$i.Tipp: "
read tipp
user_tipps+=($tipp)
done


declare -a win_numbers

#A program generál 5 véletlen számot 1 és 90 között és kiírja a Lottoout.txt fileba
for (( j=1; j <= 5; ++j ))
do
win_numbers[$j]+=$(( $RANDOM % 91 ))
done

echo "Ötös nyerőszámok: " ${win_numbers[@]} >> Lottoout.txt

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
echo "$corr helyes találat!";;

#Hatos Lotto
-s)
echo
echo "Adjon meg 6 tippet 1 és 45 között: "

declare -a suser_tipps

#Felhasználo megadja a 6 tippet
for (( i=1; i <= 6; ++i ))
do
echo -n "$i.Tipp: "
read stipp
suser_tipps+=($stipp)
done

declare -a swin_numbers

#A program generál 6 véletlen számot 1 és 45 között és kiírja a Lottoout.txt fileba
for (( j=1; j <= 6; ++j ))
do
swin_numbers[$j]+=$(( $RANDOM % 46 ))
done

echo "Hatos nyerőszámok: " ${swin_numbers[@]} >> Lottoout.txt

#Megjeleníti a nyerőszámokat
echo "A nyerő számok: "
echo ${swin_numbers[*]}

declare -i scorr=0
#Összehasonlítja a felhasználó tippjeit és a gép által generált 6 számot
for i in $( seq 1 ${#suser_tipps[@]}); do
  for j in $( seq 1 ${#swin_numbers[@]}); do
    if [ "${suser_tipps[$i]}" = "${swin_numbers[$j]}" ]; then
      scorr+=1
    fi
  done
done

#Megjeleníti a helyes találatok számát
echo "$scorr helyes találat!";;

#Segítség/Help
-h) echo "Ez egy egyszerű ötös és hatos lottó program. Mindkét esetben véletlenszerű számokat generál a program és el kell találni a generált számokat. Jó játékot!"
    echo "-f: Ötös lottó játék"
    echo "-s: Hatos lottó játék"
    echo "-h: Segítség a program használatához" ;;

#Helytelen switch
*) echo "$1 nem egy opció!" ;;
esac
shift
done
