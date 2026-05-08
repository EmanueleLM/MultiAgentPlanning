(define (problem serve-all-children)
  (:domain child-snack)
  (:objects
    ;; places
    kitchen - place
    table1 table2 table3 - table

    ;; children
    child1 child2 child3 child4 child5 child6 child7 child8 - child

    ;; bread portions
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 - bread-portion

    ;; content portions
    content1 content2 content3 content4 content5 content6 content7 content8 - content-portion

    ;; trays
    tray1 tray2 - tray

    ;; sandwich placeholders
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 - sandwich
  )

  (:init
    ;; trays initially in kitchen
    (tray-at tray1 kitchen)
    (tray-at tray2 kitchen)

    ;; breads: located in kitchen and available
    (at-bread bread1 kitchen)
    (bread-available bread1)
    (at-bread bread2 kitchen)
    (bread-available bread2)
    (at-bread bread3 kitchen)
    (bread-available bread3)
    (at-bread bread4 kitchen)
    (bread-available bread4)
    (at-bread bread5 kitchen)
    (bread-available bread5)
    (at-bread bread6 kitchen)
    (bread-available bread6)
    (at-bread bread7 kitchen)
    (bread-available bread7)
    (at-bread bread8 kitchen)
    (bread-available bread8)

    ;; contents: located in kitchen and available
    (at-content content1 kitchen)
    (content-available content1)
    (at-content content2 kitchen)
    (content-available content2)
    (at-content content3 kitchen)
    (content-available content3)
    (at-content content4 kitchen)
    (content-available content4)
    (at-content content5 kitchen)
    (content-available content5)
    (at-content content6 kitchen)
    (content-available content6)
    (at-content content7 kitchen)
    (content-available content7)
    (at-content content8 kitchen)
    (content-available content8)

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

    ;; children waiting at tables (deterministic mapping chosen)
    (child-at child1 table1)
    (child-at child2 table1)
    (child-at child3 table1)
    (child-at child4 table2)
    (child-at child5 table2)
    (child-at child6 table2)
    (child-at child7 table3)
    (child-at child8 table3)

    ;; sandwich placeholders: no exists-sandwich facts -> all are initially non-existent
    ;; (i.e., do not assert (exists-sandwich sandwX) for any sandw)
    ;; used-* and created-from are all absent initially
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