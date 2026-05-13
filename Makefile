build:
	docker build -t statuspulse:1.0 .

up:
	docker compose up -d --build

down:
	docker compose down

logs:
	docker compose logs -f

test:
	curl -f http://localhost:8000/health

clean:
	docker compose down -v --rmi all

shell:
	docker exec -it statuspulse-app /bin/bash