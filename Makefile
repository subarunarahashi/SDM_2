up:
	docker compose up -d

setup:
	docker compose build
	docker compose exec myapp bash -c 'bundle exec rails db:migrate'
	docker compose exec myapp bash -c 'read -p "Enter username: " username && read -p "Enter password: " password && echo "BASIC_AUTH_USER=$$username" > .env && echo "BASIC_AUTH_PASSWORD=$$password" >> .env && echo "Credentials set: USERNAME=$$username, PASSWORD=$$password"'
	docker compose up -d

import:
	docker compose exec myapp bash -c 'bundle exec rails import:all'

start:
	docker compose exec myapp bash -c 'bundle exec rails server -b 0.0.0.0'

down:
	docker compose down --rmi all --volumes

