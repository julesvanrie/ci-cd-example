default: pylint pytest

pylint:
	find . -iname "*.py" -not -path "./tests/*" | xargs -n1 -I {}  pylint --output-format=colorized {}; true

pytest:
	PYTHONDONTWRITEBYTECODE=1 pytest -v --color=yes


docker_build:
	docker build -t $(IMAGE_URI) .

docker_run:
	docker run -it -e PORT=8000 -p 8080:8000 $(IMAGE_URI)
