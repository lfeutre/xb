.PHONY: docs
DOCS_BUILD_DIR = docs/build

devdocs:
	cd docs && bundle exec middleman server

docs:
	cd docs && rake build

publish: docs
	git push origin \
	`git subtree split --prefix $(DOCS_BUILD_DIR) master`:gh-pages --force
