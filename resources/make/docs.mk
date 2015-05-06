.PHONY: docs
REPO = git@github.com:oubiwann/xb.git
DOCS_BUILD_DIR = docs/build

devdocs:
	cd docs && bundle exec middleman server

docs:
	cd docs && rake build

publish: docs
	rm -rf $(DOCS_BUILD_DIR)/.git
	cd $(DOCS_BUILD_DIR) && \
	git init && \
	git add * &> /dev/null && \
	git commit -a -m "Generated content." &> /dev/null && \
	git push -f $(REPO) master:gh-pages
