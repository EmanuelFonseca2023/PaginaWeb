# 1. Usa una imagen oficial de Node.js como base (aquí versión 18)
FROM node:18-alpine

# 2. Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# 3. Copia los archivos de dependencias para instalar primero (mejor caché)
COPY package*.json ./

# 4. Instala las dependencias del proyecto
RUN npm install

# 5. Copia el resto de los archivos del proyecto
COPY . .

# 6. Expone el puerto que usará Astro para servir la app (por defecto 4321)
EXPOSE 4321

# 7. Comando para ejecutar cuando se inicie el contenedor
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]