FROM nextcloud:latest

# Copy custom theming overrides into the shipped app
COPY app-overrides/ /usr/src/nextcloud/apps/theming/

# Ensure www-data owns the modified files so Nextcloud can read them
RUN chown -R www-data:www-data /usr/src/nextcloud/apps/theming

# Pre-seed theming defaults for fresh installations
RUN php /usr/src/nextcloud/occ config:app:set theming name --value "Nextplane" \
 && php /usr/src/nextcloud/occ config:app:set theming slogan --value "Nextplane - Alles auf einer Ebene"
