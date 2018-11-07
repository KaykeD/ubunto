#!/bin/bash
# Autor: Robson Vaamonde
# Site: www.procedimentosemti.com.br
# Facebook: facebook.com/ProcedimentosEmTI
# Facebook: facebook.com/BoraParaPratica
# YouTube: youtube.com/BoraParaPratica
# Data de criação: 07/11/2018
# Data de atualização: 07/11/2018
# Versão: 0.1
# Testado e homologado para a versão do Ubuntu Server 16.04.x LTS x64
# Kernel >= 4.4.x
#
# Instalação do Webmin para administração via Web do GNU/Linux Ubuntu Server
#
# Utilizar o comando: sudo -i para executar o script
#
# Variável da Data Inicial para calcular tempo de execução do Script
DATAINICIAL=`date +%s`
#
# Validando o ambiente, verificando se o usuário e "root"
USUARIO=`id -u`
UBUNTU=`lsb_release -rs`
KERNEL=`uname -r | cut -d'.' -f1,2`

if [ "$USUARIO" == "0" ]
then
	if [ "$UBUNTU" == "16.04" ]
		then
			if [ "$KERNEL" == "4.4" ]
				then		
					 clear
					 # Versão do Webmin para ser feito download
					 VERSAO="webmin_1.890_all.deb"
					 TAMANHO="14.8 MB"
					 #
					 echo -e "Usuário é `whoami`, continuando a executar o script"
					 echo
					 echo -e "Atualizando as Listas do Apt-Get, aguarde..."
						apt update
					 echo -e "Listas Atualizadas com Sucesso!!!, continuando o script..."
					 sleep 2
					 echo
					 #
					 echo -e "Atualizando o Sistema, aguarde..."
						apt -y upgrade
					 echo -e "Sistema Atualizado com Sucesso!!!, continuando o script..."
					 sleep 2
					 echo
					 #
					 echo -e "Instalando as Dependências do Webmin, aguarde..."
						apt -y install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python
					 echo -e "Instalação das Dependências do Webmin Feito com Sucesso!!!, continuando o script..."
					 echo
					 #
					 echo -e "Baixando o Webmin do Site Oficial, download de: $TAMANHO, aguarde..."
						wget http://prdownloads.sourceforge.net/webadmin/$VERSAO
					 echo -e "Download feito com sucesso!!!, continuando o script..."
					 sleep 2
					 echo
					 #
					 echo -e "Instalando o Webmin, aguarde..."
						dpkg -i $VERSAO
					 echo -e "Instalação feita com sucesso!!!, continuando o script..."
					 sleep 2
					 echo
					 #
					 echo
					 echo -e "Instalação e configuração básica do Webmin Feito com Sucesso!!!"
					 echo
						DATAFINAL=`date +%s`
						SOMA=`expr $DATAFINAL - $DATAINICIAL`
						RESULTADO=`expr 10800 + $SOMA`
						TEMPO=`date -d @$RESULTADO +%H:%M:%S`
					echo -e "Tempo gasto para execução do script: $TEMPO"
					echo -e "Pressione <Enter> para concluir o processo."
					read
					else
						 echo -e "Versão do Kernel: $KERNEL não homologada para esse script, versão: >= 4.4 "
						 echo -e "Pressione <Enter> para finalizar o script"
					read
			fi
		else
			 echo -e "Distribuição GNU/Linux: `lsb_release -is` não homologada para esse script, versão: $UBUNTU"
			 echo -e "Pressione <Enter> para finalizar o script"
			read
		fi
else
	 echo -e "Usuário não é ROOT, execute o comando com a opção: sudo -i <Enter> depois digite a senha do usuário `whoami`"
	 echo -e "Pressione <Enter> para finalizar o script"
	read
fi
