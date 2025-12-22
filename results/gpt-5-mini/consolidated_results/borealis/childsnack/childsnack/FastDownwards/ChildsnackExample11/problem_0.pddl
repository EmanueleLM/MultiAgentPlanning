(define (problem sandwich-serving-problem)
  (:domain sandwich-serving)

  (:objects
    ;; locations
    kitchen - kitchen
    table1 table2 table3 - table

    ;; trays
    tray1 tray2 tray3 - tray

    ;; breads
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 bread10 bread11 bread12 - bread

    ;; contents
    content1 content2 content3 content4 content5 content6 content7 content8 content9 content10 content11 content12 - content

    ;; sandwiches placeholders
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 sandw12 sandw13 sandw14 sandw15 sandw16 - sandwich

    ;; children (12)
    child1 child2 child3 child4 child5 child6 child7 child8 child9 child10 child11 child12 - child
  )

  (:init
    ;; trays and their initial locations
    (tray tray1) (at-tray tray1 kitchen)
    (tray tray2) (at-tray tray2 kitchen)
    (tray tray3) (at-tray tray3 kitchen)

    ;; breads exist and initially in kitchen and available
    (bread bread1) (at-bread bread1 kitchen) (bread-available bread1)
    (bread bread2) (at-bread bread2 kitchen) (bread-available bread2)
    (bread bread3) (at-bread bread3 kitchen) (bread-available bread3)
    (bread bread4) (at-bread bread4 kitchen) (bread-available bread4)
    (bread bread5) (at-bread bread5 kitchen) (bread-available bread5)
    (bread bread6) (at-bread bread6 kitchen) (bread-available bread6)
    (bread bread7) (at-bread bread7 kitchen) (bread-available bread7)
    (bread bread8) (at-bread bread8 kitchen) (bread-available bread8)
    (bread bread9) (at-bread bread9 kitchen) (bread-available bread9)
    (bread bread10) (at-bread bread10 kitchen) (bread-available bread10)
    (bread bread11) (at-bread bread11 kitchen) (bread-available bread11)
    (bread bread12) (at-bread bread12 kitchen) (bread-available bread12)

    ;; contents exist and initially in kitchen and available
    (content content1) (at-content content1 kitchen) (content-available content1)
    (content content2) (at-content content2 kitchen) (content-available content2)
    (content content3) (at-content content3 kitchen) (content-available content3)
    (content content4) (at-content content4 kitchen) (content-available content4)
    (content content5) (at-content content5 kitchen) (content-available content5)
    (content content6) (at-content content6 kitchen) (content-available content6)
    (content content7) (at-content content7 kitchen) (content-available content7)
    (content content8) (at-content content8 kitchen) (content-available content8)
    (content content9) (at-content content9 kitchen) (content-available content9)
    (content content10) (at-content content10 kitchen) (content-available content10)
    (content content11) (at-content content11 kitchen) (content-available content11)
    (content content12) (at-content content12 kitchen) (content-available content12)

    ;; gluten-free breads (as specified)
    (bread-gluten-free bread3)
    (bread-gluten-free bread4)
    (bread-gluten-free bread5)
    (bread-gluten-free bread11)

    ;; gluten-free contents
    (content-gluten-free content2)
    (content-gluten-free content5)
    (content-gluten-free content9)
    (content-gluten-free content12)

    ;; children facts: identity and locations (table assignments)
    (child child1) (at-child child1 table2)
    (child child2) (at-child child2 table1)
    (child child3) (at-child child3 table1)
    (child child4) (at-child child4 table2)
    (child child5) (at-child child5 table3)
    (child child6) (at-child child6 table3)
    (child child7) (at-child child7 table3)
    (child child8) (at-child child8 table2)
    (child child9) (at-child child9 table1)
    (child child10) (at-child child10 table3)
    (child child11) (at-child child11 table1)
    (child child12) (at-child child12 table1)

    ;; allergic children (must receive gluten-free sandwiches)
    (child-allergic-gluten child1)
    (child-allergic-gluten child3)
    (child-allergic-gluten child5)
    (child-allergic-gluten child12)

    ;; sandwich placeholders initially unmade
    (unmade sandw1) (unmade sandw2) (unmade sandw3) (unmade sandw4)
    (unmade sandw5) (unmade sandw6) (unmade sandw7) (unmade sandw8)
    (unmade sandw9) (unmade sandw10) (unmade sandw11) (unmade sandw12)
    (unmade sandw13) (unmade sandw14) (unmade sandw15) (unmade sandw16)
  )

  ;; Goal: all children served (strict constraint)
  (:goal (and
    (served child1) (served child2) (served child3) (served child4)
    (served child5) (served child6) (served child7) (served child8)
    (served child9) (served child10) (served child11) (served child12)
  ))