function shuttle-bump-versions -a old -a new
    # This function depends on the fastmod and cargo-edit crates.
    
    cd ~/dev/shuttle
    
    cargo set-version --workspace $new

    fastmod --fixed-strings $old $new examples --accept-all

    # After updating examples, checkout branch and stage changes.
    cd examples
    git checkout -b chore/v$new
    git add .
    cd ~/dev/shuttle

    fastmod --fixed-strings $old $new resources --accept-all

    fastmod --fixed-strings $old $new services --accept-all

    fastmod --fixed-strings $old $new --accept-all

    # After updaing main repo, checkout branch and stage changes.
    git checkout -b chore/v$new
    git add .

    cd ~/dev/shuttle-docs

    fastmod --fixed-strings $old $new --accept-all

    # After updaing docs, checkout branch and stage changes.
    git checkout -b chore/v$new
    git add .
end
