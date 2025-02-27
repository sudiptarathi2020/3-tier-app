
#!/bin/bash

# Exit on error
set -e



# Copy db-setup.sh to home directory
cp db-setup.sh ../
cd ../
# Make db-setup.sh executable and run it
sudo chmod 700 db-setup.sh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

sudo ./db-setup.sh

# Setup Backend

cd 3-tier-app/backend/
npm ci
nohup node server.js &
cd ../
# Setup Frontend
cd frontend/
npm ci
nohup npm run dev -- --host &

# Print completion message
echo "3-tier application successfully deployed!"
