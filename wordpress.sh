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
# Instalação do Wordpress para simulação de Sistema de Intranet
# Criação de Base de Dados no MySQL
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
					 #
					 #Declarando as variaveis para o ambiente
					 WORDPRESS="https://wordpress.org/latest.zip"
					 TAMANHO="9.1 MB"
					 #
					 #Criando a variáveis para criação da Base de Dados do Wordpress
					 USER="root"
					 PASSWORD="123@senac"
					 DATABASE="CREATE DATABASE wordpress;"
					 USERDATABASE="CREATE USER 'wordpress' IDENTIFIED BY 'wordpress';"
					 GRANTDATABASE="GRANT USAGE ON *.* TO 'wordpress' IDENTIFIED BY 'wordpress';"
					 GRANTALL="GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress';"
					 FLUSH="FLUSH PRIVILEGES;"
					 #
					 echo -e "Usuário é `whoami`, continuando a executar o script"
					 sleep 2
					 echo
					 #
					 echo -e "Instalando os software para o Sistema de Intranet"
					 echo
					 #
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
					 echo -e "Instalando o software Unzip, aguarde..."
						apt -y install unzip
					 echo -e "Software instalado com sucesso!!!, continuando com o script..."
					 sleep 2
					 echo
					 #
					 echo -e "Fazendo o download do: $WORDPRESS, aguarde..."
						wget $WORDPRESS
					 echo -e "Download feito com sucesso!!!, continuando o script..."
					 sleep 2
					 echo
					 
					 echo -e "Descompactando o arquivo latest.zip, aguarde..."
				     	 	unzip latest.zip
					 echo -e "Descompactação feita com sucesso!!!, continuando o script..."
					 sleep 2
					 echo
					 
					 echo -e "Copiando os arquivo do Wordpress para a pasta de /var/www/html, aguarde..."
						mv -v wordpress/ /var/www/html/wp
						cp -v conf/htaccess /var/www/html/wp/.htaccess
						cp -v conf/wp-config.php /var/www/html/wp/
					 echo -e "Arquivos copiados com sucesso!!!, continuando o script..."
					 sleep 2
					 echo
					 
					 echo -e "Alterando as permissões dos arquivos da pasta /var/www/html/wp/, aguarde..."
						chmod -Rfv 755 /var/www/html/wp/
						chown -Rfv www-data.www-data /var/www/html/wp/
					 echo -e "Permissões alteradas com sucesso!!!, continuando o script..."
					 sleep 2
					 echo

					 echo -e "Criando a base de dados do Wordpress e setando as permissões, aguarde..."
						 mysql -u $USER -p$PASSWORD -e "$DATABASE" mysql
						 mysql -u $USER -p$PASSWORD -e "$USERDATABASE" mysql
						 mysql -u $USER -p$PASSWORD -e "$GRANTDATABASE" mysql
						 mysql -u $USER -p$PASSWORD -e "$GRANTALL" mysql
						 mysql -u $USER -p$PASSWORD -e "$FLUSH" mysql
					 echo -e "Base de dados do Wordpress criada com sucesso!!!, continuando o script..."
					 sleep 2
					 echo
					 
					 echo -e "Editando o arquivo de conexão com o Banco de Dados do Wordpress\n"
					 echo -e "Pressione <Enter> para editar o arquivo: wp-config.php"
					 read
						vim /var/www/html/wp/wp-config.php +16
					 echo -e "Arquivo editado com sucesso!!!, pressione <Enter> para continuar"
					 read
					 sleep 2
					 clear

					 echo -e "Finalização da instalação e Configuração do Sistema de Intranet"
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
