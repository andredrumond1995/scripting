#!/bin/bash

function menu(){
echo -e "1 = Sim;\n2 = Não."
slcts="1 2"
select slct in $slcts
do
	if test $slct = "1"
	then
		echo -e "O script irá voltar para tela principal.\c"
		sleep 1
		echo -e ".\c"
		sleep 1
		echo -e ".\c"
		sleep 1
		clear
		begining
	elif test $slct = "2"
	then
		echo -e "O script será finalizado.\c"
		sleep 1
		echo -e ".\c"
		sleep 1
		echo -e "."
		sleep 1
		exit 0
	else
		clear
		echo -e "Opção inválida!\n1 = Sim;\n2 = Não."
	fi
done

}

function brightness(){
clear
echo "###########################################################"
echo "    ####   ####   #   #               #  #### #    "
echo "    #   #  #   #  #   #              #  #     #"
echo "    #   #  # #    #   #   ####      #    ###  ####"
echo "    #  #   #  #   #   #            #       #  #   #"
echo "    ##     #   #  #####         # #    ###    #   #"
echo "###########################################################"
xrandr --verbose | grep -i brightness | xargs | awk '{print "                     ----------------------------\n                     |Brilho atual da tela: "$2".|\n                     ----------------------------"}'
verify=$(xrandr -q | grep -w "connected" | xargs | awk '{print $1}')
echo -e "Digite o valor desejado! \nExemplo: 1.0 ou 2.0 ou 0.50, etc... \c"
read value
xrandr --output "$verify" --brightness "$value"
echo ""
echo -e "\tDeseja realizar mais alguma alteração?"
menu
}

function resolution(){
searchstring=0
while [[ "$searchstring" = "0" ]]
do
	if test "$searchstring" = "0"
	then
		clear
		echo "###########################################################"
echo "    ####   ####   #   #               #  #### #    "
echo "    #   #  #   #  #   #              #  #     #"
echo "    #   #  # #    #   #   ####      #    ###  ####"
echo "    #  #   #  #   #   #            #       #  #   #"
echo "    ##     #   #  #####         # #    ###    #   #"
echo "###########################################################"
		xrandr | xargs | awk '{print "                     ----------------------------\n                     |Resolução atual: "$8$9$10"|\n                     ----------------------------"}'
		verify=$(xrandr -q | grep -w "connected" | xargs | awk '{print $1}')
		countlines=$(xrandr | grep "[0-9]x[0-9]" | wc --lines)
		lines=$(( $countlines - 1 ))
		echo -e "\t Abaixo serão mostradas as resoluções disponíveis: "
		xrandr | grep "[0-9]x[0-9]" | tail -n $lines
		echo ""
		echo -e "Digite o valor desejado! \nExemplo: 1024x768. \c"
		read value
		searchstring=$(xrandr | grep "[0-9]x[0-9]" | tail -n $lines | grep -w "$value" | wc --lines)
		if [[ $searchstring -eq 1 ]]
		then
			xrandr --output "$verify" --mode "$value"
			break
		else
		clear
	echo "###########################################################"
echo "    ####   ####   #   #               #  #### #    "
echo "    #   #  #   #  #   #              #  #     #"
echo "    #   #  # #    #   #   ####      #    ###  ####"
echo "    #  #   #  #   #   #            #       #  #   #"
echo "    ##     #   #  #####         # #    ###    #   #"
echo "###########################################################"
		echo -e "----------------------------------------------------------------------------------\n                   Dimensão '"$value"' inválida.\n                   Tente novamente ou Ctrl + C para sair.\n----------------------------------------------------------------------------------"
		sleep 7
		clear
		fi
	fi
done
echo ""
echo -e "\tDeseja realizar mais alguma alteração?"
menu
}


function begining(){
clear
echo "###########################################################"
echo "    ####   ####   #   #               #  #### #    "
echo "    #   #  #   #  #   #              #  #     #"
echo "    #   #  # #    #   #   ####      #    ###  ####"
echo "    #  #   #  #   #   #            #       #  #   #"
echo "    ##     #   #  #####         # #    ###    #   #"
echo "###########################################################"
xrandr --verbose | grep -i brightness | xargs | awk '{print "                     ----------------------------\n                     |Brilho atual da tela: "$2".|\n                     ----------------------------"}'
xrandr | xargs | awk '{print "                     |Resolução atual: "$8$9$10"|\n                     ----------------------------"}'
echo -e "Digite uma das opção abaixo:\n1 = Alterar brilho da tela;\n2 = Alterar resolução da tela."
opts="1 2"
select opt in $opts
do
	if test "$opt" = "1"
	then
		brightness
	elif test "$opt" = "2"
	then
		resolution
	else
		clear
		echo "###########################################################"
echo "    ####   ####   #   #               #  #### #    "
echo "    #   #  #   #  #   #              #  #     #"
echo "    #   #  # #    #   #   ####      #    ###  ####"
echo "    #  #   #  #   #   #            #       #  #   #"
echo "    ##     #   #  #####         # #    ###    #   #"
echo "###########################################################"
		echo "Opção inválida!"
		echo "1 = Alterar do brilho da tela;"
		echo "2 = Alterar da resolução da tela."
	fi
done
}

begining

