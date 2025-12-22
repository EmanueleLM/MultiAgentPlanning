(define (problem prob-snack)
  (:domain child-snack)
  (:objects
    child1 child2 child3 child4 child5 child6 child7 - child

    bread1 bread2 bread3 bread4 bread5 bread6 bread7 - bread-portion
    content1 content2 content3 content4 content5 content6 content7 - content-portion

    tray1 tray2 - tray

    table1 table2 table3 - place

    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 - sandwich
  )

  (:init
    ;; Tray initial locations
    (at_tray tray1 kitchen)
    (at_tray tray2 kitchen)

    ;; Bread and content portions are all in the kitchen initially
    (at_bread bread1 kitchen)
    (at_bread bread2 kitchen)
    (at_bread bread3 kitchen)
    (at_bread bread4 kitchen)
    (at_bread bread5 kitchen)
    (at_bread bread6 kitchen)
    (at_bread bread7 kitchen)

    (at_content content1 kitchen)
    (at_content content2 kitchen)
    (at_content content3 kitchen)
    (at_content content4 kitchen)
    (at_content content5 kitchen)
    (at_content content6 kitchen)
    (at_content content7 kitchen)

    ;; Gluten-free annotations (as specified)
    (gluten_free_bread bread2)
    (gluten_free_bread bread6)

    (gluten_free_content content3)
    (gluten_free_content content7)

    ;; Children waiting locations
    (waiting child1 table2)
    (waiting child2 table1)
    (waiting child3 table3)
    (waiting child4 table2)
    (waiting child5 table1)
    (waiting child6 table1)
    (waiting child7 table2)

    ;; Allergies (only mark allergic children; non-allergic children are represented via negation)
    (child_allergic child1)
    (child_allergic child5)
  )

  (:goal (and
    (served child1)
    (served child2)
    (served child3)
    (served child4)
    (served child5)
    (served child6)
    (served child7)
  ))
)