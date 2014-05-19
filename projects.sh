projects=(
    "gh:Matt-Esch/virtual-dom"
    "gh:Raynos/mercury"
    "gh:Raynos/indexhtmlify"
    "gh:Raynos/virtual-hyperscript"
    "gh:Raynos/frp-keyboard"
    "gh:Raynos/xhr"
    "gh:Raynos/jsig"
    "gh:Raynos/error"
    "gh:Raynos/dom-delegator"
    "gh:Raynos/html5-router"
)

for project in ${projects[@]}; do
    folder=$(echo "$project" | cut -d / -f 2)
    
    echo ""
    echo "Checking $project"

    if [ ! -e ~/projects/$folder ]; then
        echo "Fetching $project"
        cd ~/projects
        git clone "$project"
    else
        echo " - Already fetched $project"
    fi
done

echo ""
echo "Fetched all projects"
