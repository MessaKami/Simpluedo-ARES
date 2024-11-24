# Use the official PostgreSQL image as the base image
FROM postgres:16.4

# Set environment variables for PostgreSQL
ENV POSTGRES_USER=mademoiselle_rose
ENV POSTGRES_PASSWORD=danslasalledebillardavecunpoignard
ENV POSTGRES_DB=simpluedo

# Copy initialization scripts (optional)
# If you have SQL scripts to initialize your database, place them in a folder like 'docker-entrypoint-initdb.d/'
# They will automatically be executed at startup.
COPY ./data/01b-tables-roles-docker.sql /docker-entrypoint-initdb.d/
COPY ./data/02-seed-data.sql /docker-entrypoint-initdb.d/
COPY ./data/03-procedures-functions.sql /docker-entrypoint-initdb.d/

# Expose PostgreSQL default port
EXPOSE 5432

# Set the command to run PostgreSQL
CMD ["postgres"]
