#!/bin/bash
#################################################################################################################

# script para desinstalar odoo 10 y postgresql 9.5 INSTALADO DESDE PACKAGE (web Odoo)
# Deja el sistema linux listo para volver a instalar Odoo (desde source, pero no desde package)

# STOP SERVERS
  sudo service odoo stop
  sudo service postgresql stop

# REMOVE ODOO PACKAGE
  sudo apt-get remove odoo
  
# REMOVE PACKAGES INSTALLED WITH ODOO (POSTGRESQL ALONG OTHERS)  
  sudo apt autoremove
  
# PURGE IN ORDER TO REMOVE CONFIG FILES (NECESSARY?)
  sudo apt-get --purge remove odoo/* -y
  sudo apt-get --purge remove postgresql\* -y

# REMOVE USER AND USER GROUP
# Si hay algún proceso ejecutado por los usuarios, cerrarlo antes con pkill
# para ver los procesos ejecutados por un usuario $ ps -u odoo
  sudo pkill -u odoo
  sudo pkill -u postgres
  sudo userdel -r postgres
  sudo userdel -r odoo
  sudo groupdel postgres
  sudo groupdel odoo
 
# ELIMINAR DIRECTORIO LOG
#  sudo rm -R /var/log/odoo/
