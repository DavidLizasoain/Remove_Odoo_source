#!/bin/bash
#################################################################################################################

# script para desinstalar odoo 10 y postgresql 9.5 INSTALADO DESDE CODIGO FUENTE (yenthe)
# Deja el sistema linux listo para volver a instalar Odoo (desde source, pero no desde package)

# STOP SERVERS
  sudo service odoo-server stop
  sudo service postgresql stop

# REMOVE ALL ODOO FILES
  sudo rm -R /odoo
# REMOVE CONFIG FILES
  sudo rm -f /etc/odoo-server.conf
  sudo update-rc.d -f odoo-server remove 
  sudo rm -f /etc/init.d/odoo-server
# REMOVE USER AND USER GROUP
# Si hay algún proceso ejecutado por los usuarios, cerrarlo antes con pkill
# para ver los procesos ejecutados por un usuario $ ps -u odoo
  sudo pkill -u odoo
  sudo pkill -u postgres
  sudo userdel -r postgres
  sudo userdel -r odoo
  sudo groupdel postgres
  sudo groupdel odoo

# REMOVE DATABASE
  sudo apt-get remove postgresql -y
  sudo apt-get --purge remove postgresql\* -y
#  sudo rm -rf /etc/postgresql/
#  sudo rm -rf /etc/postgresql-common/
#  sudo rm -rf /var/lib/postgresql/

# ELIMINAR WKHTMLTOPDF Y WKHTMLTOIMAGE
  sudo rm /usr/bin/wkhtmltopdf
  sudo rm /usr/bin/wkhtmltoimage
  
# ELIMINAR DIRECTORIO LOG
  sudo rm -R /var/log/odoo/
