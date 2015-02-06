
all: build deploy

build:
	pub get
	pub build

deploy:
	./tool/deploy.sh

