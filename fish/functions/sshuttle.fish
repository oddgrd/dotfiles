function sshuttle -a node -a profile
    switch $profile
        case '' dev
            set -f host shuttle.internal
        case prod
            set -f host shuttle.prod.internal
        case '*'
            echo "No such profile"
    end
    
    TERM=xterm ssh ec2-user@$node.$host
end
