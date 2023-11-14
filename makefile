create:
		docker-compose up -d --build
destroy:
		docker-compose down
recreate:
		docker-compose down
		docker-compose up -d --build
prepare:
		python3 -m venv .venv
		.venv/bin/pip -r requirements.txt
