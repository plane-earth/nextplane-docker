FROM nextcloud:latest

# Copy custom theming overrides into the shipped app
COPY app-overrides/ /usr/src/nextcloud/apps/theming/

# Ensure www-data owns the modified files so Nextcloud can read them
RUN chown -R www-data:www-data /usr/src/nextcloud/apps/theming \
 && php occ config:app:set theming name --value "Nextplane" \
 && php occ config:app:set theming slogan --value "Nextplane - Alles auf einer Ebene"
