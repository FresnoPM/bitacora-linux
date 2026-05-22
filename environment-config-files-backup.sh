#!/bin/bash

# ENVIRONMENT AND PERSONAL CONFIGURATIONS BACKUP
# Atajos desde la línea de comandos
# Se guardan en ~/

cp ~/.bash_aliases backup/.bash_aliases
# Para restaurar
# cp ./backup/.bash_aliases ~/.bash_aliases

# Entorno global de R
cp ~/.Renviron backup/.Renviron
# Para restaurar
# cp ./backup/.Renviron ~/.Renviron

# Configuración de mis credenciales de github
cp ~/.gitconfig backup/.gitconfig
# Para restaurar
# cp ./backup/.gitconfig ~/.gitconfig



# Other
# ~/.config/autostart
# específicamente: /etc/apt/sources.list.d/ubuntu.sources
# en general: /etc/apt

