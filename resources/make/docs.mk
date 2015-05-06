.PHONY: docs

devdocs:
	cd docs && bundle exec middleman server

docs:
	cd docs && rake build

publish:
	cd docs && rake publish
