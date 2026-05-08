(define (problem ChildsnackExample5)
  (:domain child-snack)

  (:objects
    child1 child2 child3 child4 child5 child6 child7 child8 child9 - child
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 - bread-portion
    content1 content2 content3 content4 content5 content6 content7 content8 content9 - content-portion
    tray1 tray2 tray3 - tray
    table1 table2 table3 - place
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 sandw12 - sandwich
  )

  (:init
    ;; trays in kitchen
    (tray_at tray1 kitchen)
    (tray_at tray2 kitchen)
    (tray_at tray3 kitchen)

    ;; all bread and content portions are initially in the kitchen
    (at_kitchen_bread bread1) (at_kitchen_bread bread2) (at_kitchen_bread bread3)
    (at_kitchen_bread bread4) (at_kitchen_bread bread5) (at_kitchen_bread bread6)
    (at_kitchen_bread bread7) (at_kitchen_bread bread8) (at_kitchen_bread bread9)

    (at_kitchen_content content1) (at_kitchen_content content2) (at_kitchen_content content3)
    (at_kitchen_content content4) (at_kitchen_content content5) (at_kitchen_content content6)
    (at_kitchen_content content7) (at_kitchen_content content8) (at_kitchen_content content9)

    ;; gluten-free annotations for some portions (as provided)
    (no_gluten_bread bread2)
    (no_gluten_bread bread3)
    (no_gluten_bread bread8)

    (no_gluten_content content1)
    (no_gluten_content content5)
    (no_gluten_content content6)

    ;; allergy information for children
    (allergic_gluten child2)
    (allergic_gluten child5)
    (allergic_gluten child7)

    (not_allergic_gluten child1)
    (not_allergic_gluten child3)
    (not_allergic_gluten child4)
    (not_allergic_gluten child6)
    (not_allergic_gluten child8)
    (not_allergic_gluten child9)

    ;; where children are waiting
    (waiting child1 table2)
    (waiting child2 table1)
    (waiting child3 table1)
    (waiting child4 table2)
    (waiting child5 table1)
    (waiting child6 table1)
    (waiting child7 table2)
    (waiting child8 table3)
    (waiting child9 table3)

    ;; sandwich id pool: all ids unused initially
    (notexist sandw1) (notexist sandw2) (notexist sandw3) (notexist sandw4)
    (notexist sandw5) (notexist sandw6) (notexist sandw7) (notexist sandw8)
    (notexist sandw9) (notexist sandw10) (notexist sandw11) (notexist sandw12)

    ;; fixed assignments of bread and content to sandwich ids (deterministic mapping reduces branching)
    ;; We assign only nine sandwich ids (one per available bread/content); remaining sandwich ids are left without assignments.
    (assigned_bread sandw1 bread1)   (assigned_content sandw1 content2)
    (assigned_bread sandw2 bread2)   (assigned_content sandw2 content1)
    (assigned_bread sandw3 bread3)   (assigned_content sandw3 content5)
    (assigned_bread sandw4 bread4)   (assigned_content sandw4 content4)
    (assigned_bread sandw5 bread5)   (assigned_content sandw5 content3)
    (assigned_bread sandw6 bread6)   (assigned_content sandw6 content7)
    (assigned_bread sandw7 bread7)   (assigned_content sandw7 content8)
    (assigned_bread sandw8 bread8)   (assigned_content sandw8 content6)
    (assigned_bread sandw9 bread9)   (assigned_content sandw9 content9)

    ;; connectivity: kitchen connected to each table (bidirectional)
    (location_connected kitchen table1) (location_connected table1 kitchen)
    (location_connected kitchen table2) (location_connected table2 kitchen)
    (location_connected kitchen table3) (location_connected table3 kitchen)
  )

  (:goal (and
    (served child1)
    (served child2)
    (served child3)
    (served child4)
    (served child5)
    (served child6)
    (served child7)
    (served child8)
    (served child9)
  ))
)