(define (problem prob-snack)
  (:domain child-snack)

  (:objects
    table1 table2 table3 - place

    child1 child2 child3 child4 child5 child6 child7 child8 - child

    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 - bread_portion
    content1 content2 content3 content4 content5 content6 content7 content8 - content_portion

    tray1 tray2 - tray

    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 - sandwich
  )

  (:init
    ;; Trays start in the kitchen (only necessary location facts)
    (at_tray tray1 kitchen)
    (at_tray tray2 kitchen)

    ;; Gluten-free markers for specific ingredients (only these facts are needed)
    (gf_bread bread2)
    (gf_bread bread5)
    (gf_bread bread6)

    (gf_content content4)
    (gf_content content7)
    (gf_content content8)

    ;; Allergic children (only allergic ones need to be asserted)
    (allergic child2)
    (allergic child7)
    (allergic child8)

    ;; Children waiting locations
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
)