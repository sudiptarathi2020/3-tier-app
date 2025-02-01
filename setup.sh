
#!/bin/bash

# Exit on error
set -e



# Copy db-setup.sh to home directory
cp db-setup.sh ../
cd ../
# Make db-setup.sh executable and run it
sudo chmod 700 db-setup.sh
sudo ./db-setup.sh

# Verify Node.js and npm
node -v
nvm current
npm -v

# Setup Backend
cd 3-tier-app/backend/
npm ci
nohup node server.js &
cd ../
# Setup Frontend
cd frontend/
npm ci
nohup run dev -- --host &

# Print completion message
echo "3-tier application successfully deployed!"
