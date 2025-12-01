FROM nextcloud:latest

# Copy custom theming overrides into the shipped app
COPY app-overrides/ /usr/src/nextcloud/apps/theming/

# Ensure www-data owns the modified files so Nextcloud can read them
RUN chown -R www-data:www-data /usr/src/nextcloud/apps/theming
