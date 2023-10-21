function shuttle-insert-admin
    # This function depends on Docker.
    docker compose --file docker-compose.rendered.yml --project-name shuttle-dev exec auth /usr/local/bin/service --state=/var/lib/shuttle-auth init-admin --name admin --key dh9z58jttoes3qvt  
end
