#!/bin/sh

# unifiedlocal="/Users/chen/development/unified-dashboard/"
# unifiedvm="/home/chen/testdir/unified_dashboard/app"

# adminlocal="/Users/chen/development/admin-dashboard/"
# adminvm="/home/chen/testdir/admin_dashboard/app"

portallocal="/Users/chen/development/portal-api/"
portalvm="/opt/jw/portal_api/app"


yorkielocal="/Users/chen/development/yorkie/"
yorkievm="/home/chen/yorkie"


colors=$(tput colors)
if (($colors >= 8)); then
    red='\033[0;31m'
    green='\033[0;32m'
    nocolor='\033[00m'
else
  red=
  green=
  nocolor=
fi

echo "[    INFO][    FSWATCH]" "${green}" "[    `date`]" "${nocolor} Watching for changes ..."
fswatch -0 -r ~/development \
| while read -d "" event
  do
    syncdir=""
    case "$event" in
      # $unifiedlocal*)
      #   echo "unified"
      #   syncdir=$unifiedvm
      #   src=$unifiedlocal
      # ;;

      # $adminlocal*)
      #   echo "admin"
      #   syncdir=$adminvm
      #   src=$adminlocal
      # ;;
      $portallocal*)
        echo "portal"
        syncdir=$portalvm
        src=$portallocal
      ;;

      $yorkielocal*)
        echo "yorkie"
        syncdir=$yorkievm
        src=$yorkielocal
      ;;

      *)
        continue
      ;;
    esac
    echo "[    INFO][    FSWATCH]" "${green}" "[    `date`]" "${nocolor}Change Detected: Syncing \"$event\""
    rsync -avz --delete --force --exclude='*.svn*' --exclude='*.css' --exclude='*.git*' \
    --exclude='*.pyc' --exclude='*.ini' --exclude='*config.py' \
    $src -e "ssh -p 2222" chen@localhost:$syncdir
  done
