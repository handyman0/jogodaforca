#!/bin/bash

# CRIANDO FUNÇÕES DE ERRO
erro_cabeca() {
	echo "------------------|"
	echo "|                 |"
	echo "|                 |"
	echo "|                 |"
	echo "|                 __"
	echo "|                /  \\"
	echo "|                \\  /"
	echo "|                 ¬¬"
	echo "|               "
	echo "|               "
	echo "|               "
	echo "|               "
	echo "|     "
	echo "|     "
}
erro_braco_e() {
	echo "------------------|"
	echo "|                 |"
	echo "|                 |"
	echo "|                 |"
	echo "|                 __"
	echo "|                /  \\"
	echo "|                \\  /"
	echo "|                 ¬¬"
	echo "|                  \\"
	echo "|                   \\"
	echo "|                    "
	echo "|                   "
	echo "|     "
	echo "|     "
}
erro_braco_d() {
	echo "------------------|"
	echo "|                 |"
	echo "|                 |"
	echo "|                 |"
	echo "|                 __"
	echo "|                /  \\"
	echo "|                \\  /"
	echo "|                 ¬¬"
	echo "|                / \\"
	echo "|               /   \\"
	echo "|                "
	echo "|               "
	echo "|     "
	echo "|     "

}
erro_corpo() {
	echo "------------------|"
	echo "|                 |"
	echo "|                 |"
	echo "|                 |"
	echo "|                 __"
	echo "|                /  \\"
	echo "|                \\  /"
	echo "|                 ¬¬"
	echo "|                /|\\"
	echo "|               / | \\"
	echo "|               "
	echo "|               "
	echo "|     "
	echo "|     "
}
erro_perna_d() {
	echo "------------------|"
	echo "|                 |"
	echo "|                 |"
	echo "|                 |"
	echo "|                 __"
	echo "|                /  \\"
	echo "|                \\  /"
	echo "|                 ¬¬"
	echo "|                /|\\"
	echo "|               / | \\"
	echo "|                / "
	echo "|               /   "
	echo "|     "
	echo "|     "

}
erro_perna_e() {
	echo "------------------|"
	echo "|                 |"
	echo "|                 |"
	echo "|                 |"
	echo "|                 __"
	echo "|                /  \\"
	echo "|                \\  /"
	echo "|                 ¬¬"
	echo "|                /|\\"
	echo "|               / | \\"
	echo "|                / \\"
	echo "|               /   \\"
	echo "|     "
	echo "|     "
}
layout() {
echo
echo "------------------|"
echo "|                 |"
echo "|                 |"
echo "|                 |"
echo "|     "
echo "|     "
echo "|     "
echo "|     "
echo "|     "
echo "|     "
echo "|     "
echo "|     "
echo "|     "
echo "|     "
}
# dando boas vindas
clear
echo "jogo da forca"
layout
# palavra para sortear
PALAVRA=$(shuf -n 1 palavras.txt)

# fazer um verificador de numeros de tentativas
NUM_TENTATIVAS=$(echo -n "$PALAVRA" | fold -w1 | sort -u | wc -l)

#LEITOR DE TENTATIVAS
TENTATIVAS_CERTAS=()
TENTATIVAS_ERRADAS=()

while true; do
	# solicitando ao jogandor uma letra
	read -p "to pensando em um animal!, chute uma letra: " LETRA
	
	# fazendo o tratamento de minusculas e maiusculas
	LETRA=$(echo $LETRA | tr '[:upper:]' '[:lower:]')
	PALAVRA=$(echo $PALAVRA | tr '[:upper:]' '[:lower:]')

	# verificando a resposta
	if echo "$PALAVRA" | grep -q "$LETRA";
	then
		clear
		echo "tem a letra '$LETRA'!"
		TENTATIVAS_CERTAS+=("$LETRA")
		if [ ${#TENTATIVAS_ERRADAS[@]} -eq 0 ]; then	
		layout
		else
			# Mostrar as partes correspondentes do boneco
			case ${#TENTATIVAS_ERRADAS[@]} in
				1)
					erro_cabeca
					;;
				2)
					erro_braco_e
					;;
				3)
					erro_braco_d
					;;
				4)
					erro_corpo
					;;
				5)
					erro_perna_e
					;;
				6)
					erro_perna_d
					;;
			esac
		fi
	else
		clear
		echo "você errou, chute mais uma letra"
		QUANLETRAS=$(echo -n $PALAVRA | wc -c) 
		echo "tem $QUANLETRAS letras!"
		TENTATIVAS_ERRADAS+=("$LETRA")
		
		# Mostrar as partes correspondentes do boneco
		case ${#TENTATIVAS_ERRADAS[@]} in
			1)
				erro_cabeca
				;;
			2)
				erro_braco_e
				;;
			3)
				erro_braco_d
				;;
			4)
				erro_corpo
				;;
			5)
				erro_perna_e
				;;
			6)
				erro_perna_d
				;;
		esac
	fi
	if [[ "${LETRA^^}" == "DESISTO" ]]; then
		echo "Você desistiu! A palavra era: $PALAVRA"
		break
	fi
 

	# fazendo uma lista de letras certas e erradas
	echo "tentativas certas: ${TENTATIVAS_CERTAS[*]}"
	echo "tentativas erradas: ${TENTATIVAS_ERRADAS[*]}"
	echo "Tentativas restantes: $((NUM_TENTATIVAS - ${#TENTATIVAS_ERRADAS[@]}))"
	
	
	# verificando se o jogo acabou
	if (( ${#TENTATIVAS_ERRADAS[@]} >= NUM_TENTATIVAS )); then
		echo "Você excedeu o número de tentativas permitidas. Fim de jogo!"
		echo "a palavra misteriosa era: $PALAVRA"
		break
	fi
	if (( ${#TENTATIVAS_CERTAS[@]} >= $(echo -n "$PALAVRA" | fold -w1 | sort -u | wc -l) )); then
		palavra_completa=1
    
		for letra in $(echo -n "$PALAVRA" | fold -w1 | sort -u); do
			if [[ ! " ${TENTATIVAS_CERTAS[*]} " =~ " $letra " ]]; then
				palavra_completa=0
				break
			fi
		done

		if (( palavra_completa == 1 )); then
        		read -p "Você colocou todas as letras! Chute a palavra:" CHUTE
        		if [[ "${CHUTE,,}" == "$PALAVRA" ]]; then
            			clear
            			echo "PARABÉNS, VOCÊ ACERTOU!"
            			echo "A palavra misteriosa é $PALAVRA"
            			sleep 3
            			break
			else
				echo "Você errou ao tentar adivinhar a palavra!"
        		fi
    		fi
	fi
done



#LAYOUT DO BONECO

#echo "------------------|"
#echo "|                 |"
#echo "|                 |"
#echo "|                 |"
#echo "|                 __"
#echo "|                /  \\"
#echo "|                \\  /"
#echo "|                 ¬¬"
#echo "|                /|\\"
#echo "|               / | \\"
#echo "|                / \\"
#echo "|               /   \\"
#echo "|     "
#echo "|     "
