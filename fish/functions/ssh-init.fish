function ssh-init
    eval (ssh-agent -c | head -n2) 
    ssh-add
end
