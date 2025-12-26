(define (problem prob-snack)
  (:domain child-snack)
  (:objects
    child1 child2 child3 child4 child5 child6 - child
    bread1 bread2 bread3 bread4 bread5 bread6 - bread-portion
    content1 content2 content3 content4 content5 content6 - content-portion
    tray1 tray2 - tray
    table1 table2 table3 - place
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 - sandwich
  )
  (:init
    ; Tray Locations
    (at_tray tray1 kitchen)
    (at_tray tray2 kitchen)

    ; Ingredient Availability
    (available_bread bread1)
    (available_bread bread2)
    (available_bread bread3)
    (available_bread bread4)
    (available_bread bread5)
    (available_bread bread6)
    (available_content content1)
    (available_content content2)
    (available_content content3)
    (available_content content4)
    (available_content content5)
    (available_content content6)

    ; Gluten Free Ingredients
    (gluten_free_bread bread4)
    (gluten_free_bread bread1)
    (gluten_free_content content6)
    (gluten_free_content content5)

    ; Child Status: Location, Hunger, and Allergy
    ; Child 1 (Table 1, Not Allergic)
    (at_child child1 table1)
    (hungry child1)

    ; Child 2 (Table 1, Not Allergic)
    (at_child child2 table1)
    (hungry child2)

    ; Child 3 (Table 3, Allergic)
    (at_child child3 table3)
    (hungry child3)
    (allergic child3)

    ; Child 4 (Table 3, Allergic)
    (at_child child4 table3)
    (hungry child4)
    (allergic child4)

    ; Child 5 (Table 1, Not Allergic)
    (at_child child5 table1)
    (hungry child5)

    ; Child 6 (Table 3, Not Allergic)
    (at_child child6 table3)
    (hungry child6)
  )
  (:goal
    (and
     (eaten child1)
     (eaten child2)
     (eaten child3)
     (eaten child4)
     (eaten child5)
     (eaten child6)
    )
  )
)