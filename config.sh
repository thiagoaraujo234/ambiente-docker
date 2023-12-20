#!/bin/bash

# Define a nova senha para o usuário root
nova_senha="dockeraws"

# Altera a senha do usuário root
echo "root:$nova_senha" | chpasswd

# Habilita o acesso SSH como root
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Reinicia o serviço SSH para aplicar as alterações
service sshd restart

echo "Senha do root alterada e SSH habilitado para acesso como root."