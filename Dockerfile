FROM php:8.2-cli

# Definir o diretório de trabalho
WORKDIR /var/www

# Atualizar e instalar dependências necessárias
RUN apt-get update && apt-get install -y \
    git unzip && \
    apt-get clean

# Baixar e instalar o Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

# Instalar o Laravel Installer globalmente com o Composer
RUN composer global require laravel/installer

# Adicionar o Composer Global Bin ao PATH
ENV PATH="/root/.composer/vendor/bin:${PATH}"

# Criar um novo projeto Laravel
RUN laravel new teste

# Definir o diretório do projeto como diretório de trabalho
WORKDIR /var/www/teste

# Expôr a porta padrão do Laravel
EXPOSE 8000

# Comando padrão para iniciar o servidor
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
