#!/bin/bash

# Esperar hasta que MySQL esté completamente listo
until mysqladmin ping -h "localhost" --silent; do
    echo "Esperando a que MySQL esté listo..."
    sleep 2
done

# Cambiar la contraseña del root
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'admin';"
if [ $? -ne 0 ]; then
    echo "Error cambiando la contraseña del root"
    exit 1
fi

# Ejecutar el primer script SQL
echo "Ejecutando el primer script SQL..."
mysql -u admin -padmin product_catalog < /docker-entrypoint-initdb.d/product_catalog.sql

# Ejecutar el segundo script SQL
echo "Ejecutando el segundo script SQL..."
mysql -u admin -padmin purchase_orders < /docker-entrypoint-initdb.d/purchase_orders.sql

echo "¡Contraseña asignada y scripts SQL ejecutados correctamente!"
