(define (problem prob-snack)
  (:domain child-snack)

  (:objects
    ;; places (tables are places)
    table1 table2 table3 - place

    ;; children
    child1 child2 child3 child4 child5 child6 child7 child8 - child

    ;; breads and contents
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 - bread-portion
    content1 content2 content3 content4 content5 content6 content7 content8 - content-portion

    ;; trays
    tray1 tray2 - tray

    ;; sandwich placeholders (do not exist initially)
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

    ;; sandwiches do not exist yet
    (notexist sandw1)
    (notexist sandw2)
    (notexist sandw3)
    (notexist sandw4)
    (notexist sandw5)
    (notexist sandw6)
    (notexist sandw7)
    (notexist sandw8)
    (notexist sandw9)
    (notexist sandw10)
    (notexist sandw11)

    ;; children waiting at specified tables (exact mapping from problem description)
    (waiting child1 table3)
    (waiting child2 table1)
    (waiting child3 table3)
    (waiting child4 table1)
    (waiting child5 table1)
    (waiting child6 table1)
    (waiting child7 table3)
    (waiting child8 table2)
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