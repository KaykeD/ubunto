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
# Instalação do Netdata para monitorar via Web o GNU/Linux Ubuntu Server
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
					 # Versão do Netdata para ser feito download
					 VERSAO="https://github.com/firehol/netdata.git --depth=1"
					 #
					 echo -e "Usuário é `whoami`, continuando a executar o Script\n"
					 #
					 echo -e "Após a instalação acessar a URL http://`hostname`:19999"
					 echo
					 #
					 echo -e "Atualizando as Listas do Apt, aguarde..."
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
					 echo -e "Instalando as Dependências do Netdata, aguarde..."
						apt -y install zlib1g-dev gcc make git autoconf autogen automake pkg-config uuid-dev python python-pip python-dev python3-dev libmysqlclient-dev python-ipaddress
					 echo -e "Instalação das Dependências do Netdata Feito com Sucesso!!!, continuando o script..."
					 sleep 2
					 echo
					 #
					 echo -e "Baixando o Netdata do Site Oficial, aguarde..."
						git clone $VERSAO
					 echo -e "Download feito com sucesso!!!, continuando o script..."
					 sleep 2
					 echo
					 #
					 echo -e "Instalando o Netdata, aguarde..."
						cd netdata/
						./netdata-installer.sh
					 echo -e "Instalação feita com sucesso!!!, continuando o script..."
					 sleep 2
					 echo
					 #
					 echo
					 echo -e "Instalação e configuração básica do Netdata Feito com Sucesso!!!"
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
