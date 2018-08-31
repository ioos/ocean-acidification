# Ocean Acidification
The front page / home page for IOOS Ocean Acidification


# Installation

1. Download and install nodeJS (should come with npm)
2. Install bower
   
   ```
   npm install -g bower
   ```

   _You may need to run as sudo_

3. Use node to build the project dependencies

   ```
   npm install
   ```

4. Use bower to install the UI depencies

   ```
   bower install
   ```

5. Run the project

    ```
    bin/www
    ```

# Developing

Most of this project are static files. The initial pages are loaded as jade
templates.  

# Sample Docker-compose file:
version: '2'

services:
  ioos-ocean-acidification:
    image: ocean-acidificationtest:0.0.1
    ports:
      - "3007:3000"
