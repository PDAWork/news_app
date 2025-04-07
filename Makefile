
FVM = fvm

ifeq (, $(shell which ${FVM}))
	FLUTTER = flutter
	DART = dart
else
	FLUTTER = $(FVM) flutter
	DART = $(FVM) dart
endif

init: init-fvm

format:
	$(DART) run import_sorter:main
	$(DART) format . --line-length 120

git-format-push:
	make i-s
	git add .
	git commit --amend --no-edit
	git push -f

codegen:
	$(DART) run build_runner clean
	$(DART) run build_runner build --delete-conflicting-outputs
	make format