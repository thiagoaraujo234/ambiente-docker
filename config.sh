#!/bin/bash

# Verifica se o script está sendo executado como root ou com sudo
if [ "$(id -u)" -ne 0 ]; then
  echo "Este script precisa ser executado como root ou com sudo."
  exit 1
fi

# Define a nova senha para o usuário root
nova_senha="dockeraws"

# Altera a senha do usuário root
echo "root:$nova_senha" | chpasswd

# Habilita o acesso SSH como root e PasswordAuthentication
sed -i -e 's/^#PermitRootLogin.*/PermitRootLogin yes/' -e 's/^PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Reinicia o serviço SSH para aplicar as alterações
service sshd restart

echo "Senha do root alterada, SSH habilitado para acesso como root, e PasswordAuthentication habilitado."