function shuttle-profile -a profile
    if not test -z "$argv[2]"
        echo "Usage: takes max one argument"
        return 1
    end

    switch $profile
    case ''
        set -e SHUTTLE_API
        set -e SHUTTLE_SSH_HOST
        echo "Shuttle env variables unset"
    case stg
        set -gx SHUTTLE_API https://api.unstable.shuttle.rs
        set -gx SHUTTLE_SSH_HOST shuttle.internal
        echo "Staging Shuttle profile set."
        echo "Targeting https://api.unstable.shuttle.rs"
    case prod
        set -gx SHUTTLE_API https://api.shuttle.rs
        set -gx SHUTTLE_SSH_HOST shuttle.prod.internal
        echo "Production Shuttle profile set."
        echo "Targeting https://api.shuttle.rs"
    case '*'
        echo "No such profile"
    end
end
