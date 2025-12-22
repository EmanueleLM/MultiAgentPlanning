(define (problem prob-snack)
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
    ;; trays start in kitchen
    (tray-at tray1 kitchen)
    (tray-at tray2 kitchen)
    (tray-at tray3 kitchen)

    ;; bread and content are in kitchen initially (available)
    (at_kitchen_bread bread1)
    (at_kitchen_bread bread2)
    (at_kitchen_bread bread3)
    (at_kitchen_bread bread4)
    (at_kitchen_bread bread5)
    (at_kitchen_bread bread6)
    (at_kitchen_bread bread7)
    (at_kitchen_bread bread8)
    (at_kitchen_bread bread9)

    (at_kitchen_content content1)
    (at_kitchen_content content2)
    (at_kitchen_content content3)
    (at_kitchen_content content4)
    (at_kitchen_content content5)
    (at_kitchen_content content6)
    (at_kitchen_content content7)
    (at_kitchen_content content8)
    (at_kitchen_content content9)

    ;; gluten-free markers
    (bread-gf bread6)
    (bread-gf bread2)
    (bread-gf bread7)

    (content-gf content9)
    (content-gf content4)
    (content-gf content5)

    ;; children waiting locations
    (waiting child1 table3)
    (waiting child2 table1)
    (waiting child3 table3)
    (waiting child4 table1)
    (waiting child5 table1)
    (waiting child6 table1)
    (waiting child7 table3)
    (waiting child8 table2)
    (waiting child9 table2)

    ;; allergic children
    (allergic-gluten child2)
    (allergic-gluten child3)
    (allergic-gluten child9)
  )

  (:goal (and
    (served child1) (served child2) (served child3) (served child4) (served child5)
    (served child6) (served child7) (served child8) (served child9)
  ))
)