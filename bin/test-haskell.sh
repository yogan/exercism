#!/bin/sh
cd haskell || exit 1

dirs=$(ls -d -- */)
exit_code=0

if [ -n "$GITHUB_ACTIONS" ]; then
	# When running in GitHub Actions, $HOME is /home/github, which is owned by uid
	# 1001 / gid 127. We are running as root though, and stack does not like to
	# create its ~/.stack directory in a directory owned by a different user.
	# We can be quicker though, by just creating the directory ourselves. After
	# that, stack will be happy to install its stuff there.
	echo "Running in GitHub Actions, creating ~/.stack directory as root"
	mkdir -p "$HOME/.stack"
fi

for dir in $dirs; do
	cd "$dir" || exit 1
	if ! stack test; then
		exit_code=1
	fi
	cd ..
done

return $exit_code
