(define (problem prob-snack)
  (:domain child-snack)

  (:objects
    ;; places
    table1 table2 table3 - place

    ;; trays
    tray1 tray2 tray3 - tray

    ;; breads
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 bread10 bread11 bread12 - bread

    ;; contents
    content1 content2 content3 content4 content5 content6 content7 content8 content9 content10 content11 content12 - content

    ;; sandwich placeholders
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 sandw12 sandw13 sandw14 sandw15 sandw16 - sandwich

    ;; children
    child1 child2 child3 child4 child5 child6 child7 child8 child9 child10 child11 child12 - child
  )

  (:init
    ;; trays initially in kitchen
    (at-tray tray1 kitchen)
    (at-tray tray2 kitchen)
    (at-tray tray3 kitchen)

    ;; breads initially in kitchen
    (at-bread bread1 kitchen)
    (at-bread bread2 kitchen)
    (at-bread bread3 kitchen)
    (at-bread bread4 kitchen)
    (at-bread bread5 kitchen)
    (at-bread bread6 kitchen)
    (at-bread bread7 kitchen)
    (at-bread bread8 kitchen)
    (at-bread bread9 kitchen)
    (at-bread bread10 kitchen)
    (at-bread bread11 kitchen)
    (at-bread bread12 kitchen)

    ;; contents initially in kitchen
    (at-content content1 kitchen)
    (at-content content2 kitchen)
    (at-content content3 kitchen)
    (at-content content4 kitchen)
    (at-content content5 kitchen)
    (at-content content6 kitchen)
    (at-content content7 kitchen)
    (at-content content8 kitchen)
    (at-content content9 kitchen)
    (at-content content10 kitchen)
    (at-content content11 kitchen)
    (at-content content12 kitchen)

    ;; gluten-free breads
    (bread-gluten-free bread3)
    (bread-gluten-free bread4)
    (bread-gluten-free bread5)
    (bread-gluten-free bread11)

    ;; gluten-free contents
    (content-gluten-free content2)
    (content-gluten-free content5)
    (content-gluten-free content9)
    (content-gluten-free content12)

    ;; children locations
    (at-child child1 table2)
    (at-child child2 table1)
    (at-child child3 table1)
    (at-child child4 table2)
    (at-child child5 table3)
    (at-child child6 table3)
    (at-child child7 table3)
    (at-child child8 table2)
    (at-child child9 table1)
    (at-child child10 table3)
    (at-child child11 table1)
    (at-child child12 table1)

    ;; allergic children (must receive GF sandwiches)
    (child-allergic-gluten child1)
    (child-allergic-gluten child3)
    (child-allergic-gluten child5)
    (child-allergic-gluten child12)

    ;; sandwiches initially unmade
    (unmade sandw1) (unmade sandw2) (unmade sandw3) (unmade sandw4)
    (unmade sandw5) (unmade sandw6) (unmade sandw7) (unmade sandw8)
    (unmade sandw9) (unmade sandw10) (unmade sandw11) (unmade sandw12)
    (unmade sandw13) (unmade sandw14) (unmade sandw15) (unmade sandw16)
  )

  (:goal (and
    (served child1) (served child2) (served child3) (served child4)
    (served child5) (served child6) (served child7) (served child8)
    (served child9) (served child10) (served child11) (served child12)
  ))
)