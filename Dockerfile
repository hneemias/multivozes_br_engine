# Usa uma imagem base Python leve
FROM python:3.9-slim

# Instala dependências do sistema obrigatórias (git e ffmpeg)
# O ffmpeg é crucial para a conversão de áudio deste projeto
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho
WORKDIR /app

# Copia todos os arquivos do repositório para a imagem
COPY . .

# Instala as dependências do Python listadas no projeto
RUN pip install --no-cache-dir -r requirements.txt

# Expõe a porta que o servidor usa (padrão 5050)
EXPOSE 5050

# Comando para iniciar a aplicação
CMD ["python", "main.py"]
