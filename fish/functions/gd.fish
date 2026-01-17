function gd --description "Remove cloned repo with safety checks"
    set -l cwd (pwd)
    set -l clone_name (basename $cwd)

    # Sanity check: make sure we're in a git repo
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo "Error: not in a git repository"
        return 1
    end

    # Check for uncommitted changes
    if test -n "(git status --porcelain 2>/dev/null)"
        echo "⚠️  Warning: You have uncommitted changes:"
        git status --short
        echo ""
        gum confirm "Delete anyway?"
        or begin
            echo "Aborted"
            return 1
        end
    end

    # Check for unpushed commits
    set -l unpushed (git log --oneline @{upstream}..HEAD 2>/dev/null)
    if test -n "$unpushed"
        echo "⚠️  Warning: You have unpushed commits:"
        echo $unpushed
        echo ""
        gum confirm "Delete anyway?"
        or begin
            echo "Aborted"
            return 1
        end
    end

    if gum confirm "Remove clone '$clone_name'?"
        cd ..
        rm -rf $clone_name
        echo "Removed $clone_name"
    else
        echo "Aborted"
    end
end
