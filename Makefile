
build:
	pub build

deploy: build
	cd build/web
	git init
	git config user.name "Drone.io"
	git config user.email "emil.bergold@outlook.com"
	git add .
	git commit -m "Deploy to GitHub Pages"
	git push --force --verbose "https://${GITHUB_AUTH}@${DRONE_REPO_SLUG}.git" master:gh-pages

