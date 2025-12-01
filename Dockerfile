FROM nextcloud:latest

# Copy custom theming overrides into the shipped app
COPY app-overrides/ /usr/src/nextcloud/apps/theming/

# Ensure www-data owns the modified files so Nextcloud can read them
RUN chown -R www-data:www-data /usr/src/nextcloud/apps/theming

# Pre-seed theming defaults for fresh installations using environment defaults
ENV NEXTCLOUD_INIT_HTACCESS=1 \
    NEXTCLOUD_INIT_INSTALL=0 \
    NEXTCLOUD_ADMIN_USER=init-user \
    NEXTCLOUD_ADMIN_PASSWORD=init-pass \
    NEXTCLOUD_INIT_THEMING_NAME="Nextplane" \
    NEXTCLOUD_INIT_THEMING_SLOGAN="Nextplane - Alles auf einer Ebene"
