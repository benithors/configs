function ga --description "Create clone for parallel development"
    if test -z "$argv[1]"
        echo "Usage: ga <branch-name> [base-branch]"
        return 1
    end

    set -l branch $argv[1]
    set -l repo_name (basename $PWD)
    set -l repo_url (git remote get-url origin 2>/dev/null)

    if test -z "$repo_url"
        echo "Error: not in a git repository"
        return 1
    end

    set -l clone_path "../$repo_name-$branch"

    if test -d "$clone_path"
        echo "Error: $clone_path already exists"
        return 1
    end

    # Use fzf to select base branch, defaulting to main
    set -l base_branch (git branch -r --format='%(refname:short)' | sed 's|origin/||' | fzf --height=20 --prompt='Select base branch: ' --query="main")

    # If fzf was cancelled, fall back to main
    if test -z "$base_branch"
        set base_branch "main"
    end

    echo "Creating clone at $clone_path from $base_branch..."

    # Clone with reference to current repo for speed/space savings
    git clone --reference $PWD $repo_url $clone_path
    or return 1

    # Enter clone and set up branch
    cd $clone_path
    git checkout $base_branch
    git checkout -b "agent/$branch"

    echo "Created clone at $clone_path on branch agent/$branch (based on $base_branch)"
end
