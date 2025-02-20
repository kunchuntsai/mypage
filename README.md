# My Page
![](./particle.png)

Built with [Particle Jekyll Theme](https://github.com/nrandecker/particle)

## How to Run

### Using Docker (Recommended)
```bash
# Build and start the container
docker-compose up

# Or run in background
docker-compose up -d

# Stop the container
docker-compose down
```
Access the site at http://localhost:3000

### Using Local Development
Use the script to run localhost
```bash
./run-localhost
```

## Development Notes

### Docker Commands
```bash
# Rebuild containers after Dockerfile changes
docker-compose up --build

# View logs
docker-compose logs -f

# Shell into container
docker-compose exec web bash
```

### GitHub SSH Setup
Before pushing to remote, use the following to check if the ssh key is set correctly
```bash
ssh-add -K ~/.ssh/id_rsa_github
ssh -T git@github.com
```

## Project Structure
```
.
├── _config.yml          # Jekyll configuration
├── src/                 # Source files (js, scss, images)
├── assets/             # Compiled assets
├── Dockerfile          # Docker configuration
├── docker-compose.yml  # Docker Compose configuration
├── Gemfile            # Ruby dependencies
├── gulpfile.js        # Gulp tasks
└── package.json       # Node dependencies
```