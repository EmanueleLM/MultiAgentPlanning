The child-snack domain is designed to plan the preparation and serving of sandwiches to children, some of whom have gluten allergies. The domain includes actions for making sandwiches with and without gluten, placing sandwiches on trays, moving trays between places, and serving the sandwiches to the children.

The actions defined in this domain include:

1. make_sandwich_no_gluten: This action is for making a gluten-free sandwich. The preconditions for this action are that there must be gluten-free bread and gluten-free content available in the kitchen, and the sandwich must not already exist. The effect of this action is that the gluten-free bread and content are no longer available in the kitchen, and a gluten-free sandwich is now available in the kitchen.

2. make_sandwich: This action is for making a regular sandwich that may contain gluten. The preconditions are that there must be bread and content available in the kitchen, and the sandwich must not already exist. The effect of this action is that the bread and content are no longer available in the kitchen, and a sandwich is now available in the kitchen.

3. put_on_tray: This action is for placing a sandwich on a tray. The preconditions are that the sandwich must be in the kitchen and the tray must be at the kitchen. The effect is that the sandwich is no longer in the kitchen and is now on the tray.

4. serve_sandwich_no_gluten: This action is for serving a gluten-free sandwich to a child who is allergic to gluten. The preconditions are that the child is allergic to gluten, waiting at a place, and there is a gluten-free sandwich on a tray at the same place. The effect is that the sandwich is no longer on the tray and the child is served.

5. serve_sandwich: This action is for serving a sandwich to a child who is not allergic to gluten. The preconditions are that the child is not allergic to gluten, waiting at a place, and there is a sandwich on a tray at the same place. The effect is that the sandwich is no longer on the tray and the child is served.

6. move_tray: This action allows a tray to be moved from one place to another. The precondition is that the tray is at the starting place. The effect is that the tray is no longer at the starting place and is now at the destination place.
