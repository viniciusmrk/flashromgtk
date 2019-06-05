#!/bin/bash
opt=$(zenity  --title "Flashrom - 0.1 CH341a"  --list  --text "Selecione a opção" \
    --radiolist \
    --column "Marcar" \
    --column "Opção" \
    FALSE Copiar-Chip TRUE Programar-Chip);
# leitura
if [ "$opt" == "Copiar-Chip" ]; then
    nome=$(zenity --title "Salvar arquivo.bin" --file-selection --save --confirm-overwrite --width="250" height="50"); echo $nome && flashrom -p ch341a_spi -r "$nome" | zenity --text="Lendo Chip" --pulsate --progress --auto-close
zenity --info --text="Concluido!." --width="120" height="50"
fi
# escrita
if [ "$opt" == "Programar-Chip" ]; then
    load=$(zenity --file-selection --title="Selecione um arquivo");echo $load && flashrom -p ch341a_spi -w "$load" | zenity --text="Programando Chip" --pulsate --progress --auto-close
zenity --info --text="Concluido!." --width="120" height="50"
fi

exit 0
