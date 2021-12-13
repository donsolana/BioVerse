# BioVerse
Biodiversity explorer proof of concept for Appsilon.

## Usage
You use the app to select a specific specie that interests you. You can either search by Scientific Names or Common Names, but not both.

1. If you search by scientific names however, the common name is deployed as a plot title for convinence.
2. You can see the occurences/sightings of these animals over time. Individual sightings aren't plotted, rather the aggregated counts are.

## Architecture
1. The App uses shiny modules to modularize code.
2. It is made up of Four main Modules in total. The "DataServer", "Input" module, "Map" Module, "Timeline" Module.
3. The time line modules have both UI and Server components. Both of which are composed of the Input and Data Server Modules.
4. The Input and Data Server modules serve has the fundamental building blocks of the app and can be thought of as root modules. 

### Input and Server Modules
* The **Input** module contains the UI element for the sidebar where inputs are provided. The inputs here are required by the DataServer Module and as such /n they share a name space.

* The MapUI and TimelineUI sub modules are composed of the Input module where a distinct namespace ID is hardcoded in the **Input modules** in *each* of this cases, /n this enforces that the inputs for the two modules never crash.

*In the MapServer and Timeline server, the *Data Module* inherents the **namespace ids* described earlier. Again this ensure they both have unique computations and consistent data.

## UI/UX
Bootstraplib is used here.
* A green theme was carefully selected to compliment the purpose of the app.
/n
* A Navbar page is used to show that the logic is decoupled.
/n
* A bootstrap 4 was used as it is more stable than 5.

## Scaling
* I had setup a cloud-based Postgres sql server. However, firewall restrictions with my company laptop made experimenting with this architecture impossible.
