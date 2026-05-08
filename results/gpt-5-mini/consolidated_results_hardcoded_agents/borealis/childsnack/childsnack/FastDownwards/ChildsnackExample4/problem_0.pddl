(define (problem child-snack-problem)
  (:domain child-snack)

  (:objects
    ;; places
    kitchen - place
    table1 table2 table3 - table

    ;; children
    child1 child2 child3 child4 child5 child6 child7 child8 - child

    ;; bread and contents
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 - bread-portion
    content1 content2 content3 content4 content5 content6 content7 content8 - content-portion

    ;; trays
    tray1 tray2 - tray

    ;; sandwich placeholders
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 - sandwich
  )

  (:init
    ;; trays start in kitchen
    (at-tray tray1 kitchen)
    (at-tray tray2 kitchen)

    ;; breads and contents are in kitchen initially
    (at-bread bread1 kitchen)
    (at-bread bread2 kitchen)
    (at-bread bread3 kitchen)
    (at-bread bread4 kitchen)
    (at-bread bread5 kitchen)
    (at-bread bread6 kitchen)
    (at-bread bread7 kitchen)
    (at-bread bread8 kitchen)

    (at-content content1 kitchen)
    (at-content content2 kitchen)
    (at-content content3 kitchen)
    (at-content content4 kitchen)
    (at-content content5 kitchen)
    (at-content content6 kitchen)
    (at-content content7 kitchen)
    (at-content content8 kitchen)

    ;; gluten-free ingredient markers (static)
    (gf-bread bread2)
    (gf-bread bread5)
    (gf-bread bread6)

    (gf-content content4)
    (gf-content content7)
    (gf-content content8)

    ;; allergic children (static)
    (allergic child2)
    (allergic child7)
    (allergic child8)

    ;; sandwich placeholders are initially unused (available to create sandwiches)
    (unused-sandw sandw1)
    (unused-sandw sandw2)
    (unused-sandw sandw3)
    (unused-sandw sandw4)
    (unused-sandw sandw5)
    (unused-sandw sandw6)
    (unused-sandw sandw7)
    (unused-sandw sandw8)
    (unused-sandw sandw9)
    (unused-sandw sandw10)
    (unused-sandw sandw11)

    ;; children waiting at tables (recommended deterministic mapping)
    (waiting child1 table1)
    (waiting child2 table1)
    (waiting child3 table1)
    (waiting child4 table2)
    (waiting child5 table2)
    (waiting child6 table3)
    (waiting child7 table3)
    (waiting child8 table3)
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
  ))