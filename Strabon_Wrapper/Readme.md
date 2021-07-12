# DemoFull

## Making our UD-Viz demo application
The present `DemoFull` directory holds all the required elements constituting an independent JavaScript 
application (using among others the UD-Viz package).
It is thus a good example of what you need to provide in order to build a custom application
based on UD-Viz. 

### Replicating DemoFull to your sandbox: the straigthforward strategy
A simple way of building such a custom application would be to copy the `DemoFull` directory
into your own sandbox repository and start customizing it.
The starting instructions thus boil down to

```bash
git clone https://github.com/VCityTeam/UD-Viz-demo.git
git clone MyDemoApp.git
cd MyDemoApp
cp -r ../UD-Viz-demo/DemoFull MyDemoApp
git commit
git push
```
and then proceed with customizing `MyDemoApp`.

The main entry point for this customization of this new `MyDemoApp` is the 
[BaseDemo.js file](https://github.com/VCityTeam/UD-Viz-demo/blob/master/DemoFull/src/Helpers/BaseDemo.js)
that you can
 * adapt in order to change e.g. the left sidedbar widgets (refer to the 
   [`_this.addModuleView(...)`](https://github.com/VCityTeam/UD-Viz-demo/blob/master/DemoFull/src/Helpers/BaseDemo.js#L76)
   calls),
 * extend with your own components/features

Then you can also adapt the 
[`assets/config/config.json`](https://github.com/VCityTeam/UD-Viz-demo/blob/master/DemoFull/assets/config/config.json)
configuration file that defines e.g.
 * links to the used `assets` for the icons, logos of your application,
 * the `extents` i.e. the geographical portion of the territory that will be displayed,
 * some default data streams used e.g.
    - the `background_image_layer` that define the terrain (through a [`WMS` (Web Mapping Service)](https://www.lib.ncsu.edu/gis/ogcwms) stream),
    - some 3d buildings (based on [3DTiles](https://github.com/CesiumGS/3d-tiles)) refer e.g. to the `3DTilesLayer` entry,
    - the default `camera` position within the scene,
    - ...

You can then proceed with build your `MyDemoApp` with exactly the same instructions 
as for the `DemoFull` demo that is
 * [install the dependencies](https://github.com/VCityTeam/UD-Viz-demo#installing-the-demo-applications)
 * [building and running the application](https://github.com/VCityTeam/UD-Viz-demo/blob/master/README.md#installing-demofull)

### When working with a docker container: the [`diff`](https://en.wikipedia.org/wiki/Diff) alternative strategy
If you demo is defined within a [docker container](https://en.wikipedia.org/wiki/Docker_(software)) then an alternative strategy
(to the complete replication of the DemoFull directory) consists in (within your `Dockerfile`)
 - cloning the UD-Viz-demo repository,
 - placing yourself (with [`WORKDIR`](https://docs.docker.com/engine/reference/builder/#workdir)) inside the `DemoFull` directory,
 - overwriting the `DemoFull` code with your partial customizations (e.g. just overwriting `BaseDemo.js` and the `config.json` files).

A example of this docker container based strategy can be found in the 
[DatAgora_PartDieu](https://github.com/VCityTeam/UD-Reproducibility/blob/master/Demos/DatAgora_PartDieu/)
demo as illustrated by the
[Dockerfile](https://github.com/VCityTeam/UD-Reproducibility/blob/master/Demos/DatAgora_PartDieu/ud-viz-context/Dockerfile#L28)
commands.

---
**Warning** the following documentation has not been updated for quite some time...


### Camera Controller

* **Left-click + drag** : User "grabs" the ground (cursor stays at the same spot on the ground) to translate camera on XY axis.
* **Right-click + drag** : camera rotation around the focus point (ground point at the center of the screen), clamped to avoid going under ground level.
* **Mousewheel** : smooth zoom toward the ground point under the mouse cursor, adjusted according to the ground distance (zoom is faster the further from the ground and cannot go through the ground).
* **Mousewheel click** (middle mouse button) : "Smart Zoom". Camera smoothly moves and rotates toward target ground point, at fixed orientation and adjusted distance.
* **S** : moves and orients camera to the start view
* **T** : moves and orients camera to top view (high altitude and pointing toward the center of the city)

The camera controller has been merged into itowns ([PR](https://github.com/iTowns/itowns/pull/454)) and is now PlanarControls. It features an animation of camera movement and orientation (called "travel" in the code) which we use to orient the camera with a document (document **oriented view**).

## Current features

Each module adds new functionnalities to the application. You can find the code and the documentation (sometimes the documentation is directly in the code) by following the link under each module described below.

### Document

[Go to the module](https://github.com/VCityTeam/UD-Viz/tree/master/src/Widgets/Documents)

* Display of documents in a 3D representation of the city, in superposition
* Filtered research (research by keyword, attribute and/or temporal research)
* All documents are loaded from an external data server and can be accessed using the **Document Inspector** window.

![](https://github.com/VCityTeam/UD-Viz/blob/master/src/Widgets/Documents/Doc/Pictures/view.png)

This module has several extensions that add functionalities :

#### Contribute

[Go to the module](https://github.com/VCityTeam/UD-Viz/tree/master/src/Widgets/Extensions/Contribute)

* Possibility to create a new document
* Possibility to edit and delete existing documents

#### Validation

[Go to the module](https://github.com/VCityTeam/UD-Viz/tree/master/src/Widgets/Extensions/DocumentValidation)

This extensions works with the *Authentication* module :

* A document has information about the user who posted it.
* Users have different roles :
  * A *contributor* is a regular user
  * A *moderator* has validation rights
  * An *administrator* has all rights
* You must be logged in to contribute. A contributor must have its submissions validated by a moderator or an administrator to be published.

#### Comments

[Go to the module](https://github.com/VCityTeam/UD-Viz/tree/master/src/Widgets/Extensions/DocumentComments)

Requires the *Authentication* module :

* Adds the possibility to comment a document (must be logged in)

### Authentication

[Go to the module](https://github.com/VCityTeam/UD-Viz/tree/master/src/Widgets/Extensions/Authentication)

Adds user management :

* Possibility to create an account
* Possibility to log in

### Temporal

[Go to the module](https://github.com/VCityTeam/UD-Viz/tree/master/src/Widgets/Temporal)

* Basic slider + input field to select a date
* Ability to navigate between key dates (arrow buttons)
* When we enter a document "oriented view", the date is updated to match the document's date
* Key dates correspond to a temporal version of the 3d models for the "Îlot du Lac"

### City Objects

[Go to the module](https://github.com/VCityTeam/UD-Viz/tree/master/src/Widgets/CityObjects)

* Selection of a city object, view its details
* Filter city objects from their attributes

### Links

[Go to the module](https://github.com/VCityTeam/UD-Viz/tree/master/src/Widgets/Links)

The link module serves as an extension for both *Document* and *City object* modules.

* Adds the possibility to create link between a document and a city object (many to many)
* Possibility to visualize the city objects linked to a document
* Possibility to visualize the documents linked to a city object

### Guided Tour

[Go to the module](https://github.com/VCityTeam/UD-Viz/tree/master/src/Widgets/GuidedTour)

* A Guided Tour is a succession of Steps (document + text) that the user can follow
* Each step triggers the oriented view of its document, and opens this doc in the doc browser
* Ability to navigate between steps of a tour (previous, next) and to start/exit a tour
* Support for multiple guided tours, all loaded from a csv file (visite.csv)

### Others

* Help, About : windows with text and links

