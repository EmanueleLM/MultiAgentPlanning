(define (problem prob-snack)
  (:domain child-snack)
  (:objects
    ;; children
    child1 child2 child3 child4 child5 child6 child7 child8 - child

    ;; bread portions
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 - bread-portion

    ;; content portions
    content1 content2 content3 content4 content5 content6 content7 content8 - content-portion

    ;; trays
    tray1 tray2 - tray

    ;; places (tables)
    table1 table2 table3 - place

    ;; sandwich placeholders
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 - sandwich
  )

  (:init
    ;; trays initially in kitchen
    (tray-at tray1 kitchen)
    (tray-at tray2 kitchen)

    ;; breads: located in kitchen and available
    (at-bread bread1 kitchen) (bread-available bread1)
    (at-bread bread2 kitchen) (bread-available bread2)
    (at-bread bread3 kitchen) (bread-available bread3)
    (at-bread bread4 kitchen) (bread-available bread4)
    (at-bread bread5 kitchen) (bread-available bread5)
    (at-bread bread6 kitchen) (bread-available bread6)
    (at-bread bread7 kitchen) (bread-available bread7)
    (at-bread bread8 kitchen) (bread-available bread8)

    ;; contents: located in kitchen and available
    (at-content content1 kitchen) (content-available content1)
    (at-content content2 kitchen) (content-available content2)
    (at-content content3 kitchen) (content-available content3)
    (at-content content4 kitchen) (content-available content4)
    (at-content content5 kitchen) (content-available content5)
    (at-content content6 kitchen) (content-available content6)
    (at-content content7 kitchen) (content-available content7)
    (at-content content8 kitchen) (content-available content8)

    ;; gluten-free markers (given)
    (gluten-free-bread bread2)
    (gluten-free-bread bread5)
    (gluten-free-bread bread6)

    (gluten-free-content content4)
    (gluten-free-content content7)
    (gluten-free-content content8)

    ;; allergic children (given)
    (allergic-gluten child2)
    (allergic-gluten child7)
    (allergic-gluten child8)

    ;; children waiting at tables (as specified in the problem description)
    (waiting child1 table3)
    (waiting child3 table3)
    (waiting child7 table3)

    (waiting child2 table1)
    (waiting child4 table1)
    (waiting child5 table1)
    (waiting child6 table1)

    (waiting child8 table2)

    ;; sandwiches: none exist initially (no (sandwich-exists ...) facts)
  )

  (:goal
    (and
      (served child1)
      (served child2)
      (served child3)
      (served child4)
      (served child5)
      (served child6)
      (served child7)
      (served child8)
    )
  )
)