# Warehouse


## Dealing with the Warehouse
Clicking the `Create New Warehouse` button and filling and submitting the resulting form creates a new warehouse.
The `Warehouse Index` link gives a list of all the warehouses. Clicking a link in the list gives more information about the warehouse including a button to view sections in the warehouse.
The `Edit warehouse information` button lets the user edit the warehouse information

## Dealing with sections in the warehouse
Navigating to a given warehouse, clicking the `Create New Section` button and filling and submitting the resulting form creates a new section in the warehouse.
The `Section Index` link gives a list of all the sections in a given warehouse. Clicking a link in the list gives more information about the section of the warehouse including a button to create zones in the warehouse.
The `Edit section information` button lets the user edit the warehouse information
*Note that section names and section codes are unique for each sections of a given warehouse.*

## Dealing with zones within a section of a warehouse
Navigate to the warehouse, and then to the section in which the zone is to be created and click the `Create New Zone` button. Fill the resulting form and submit to create a zone. Clicking the `Edit zone information` button lets the user edit the information describing the zone of a given section of the warehouse.
The `Zone Index` link gives a list of all the zones in a section in a given warehouse

## Dealing with inventory Item
Navigate to the warehouse, and then to the section, and then to zone in which the itme is to be created and click the `Create New Item` button. Fill the resulting form and submit to create an item.  Clicking the `Edit item information` button lets the user edit the information describing an item.
The `Item Index` link gives a list of all the items in a given zone of a section of a warehouse.

## Using the warehouse search area
The search area can be used to search for a warehouse, section in a warehouse, zone within a given section, or an item. The search may be performed by `name` or `code` associated with the warehouse, section, zone or item.

## Dependencies
This web application requires
* Ruby ~> 3.1.0
* Rails ~> 7.0.2

Please see the Gemfile for more
