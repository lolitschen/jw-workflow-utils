# JW-WORKFLOW-UTILS

JW Workflow Utils provides scripts and tools that serve as quality of life improvements to working with vagrant vms.

## Setup

### fs-watch rsync

1. Update rsync on OS X using homebrew:

    ``` brew tap homebrew/dupes```

    ``` brew install rsync ```

2. Ensure we are using the homebrew installed utils

    i. ```vim /private/etc/paths```

    ii. place /usr/local/bin above of /usr/bin

    iii. restart terminal

3. Install fs-watch

    ``` brew install fs-watch```

4. To run:

    ``` cd /path/to/utils ```

    ``` ./fswatch-rsync.sh ```
