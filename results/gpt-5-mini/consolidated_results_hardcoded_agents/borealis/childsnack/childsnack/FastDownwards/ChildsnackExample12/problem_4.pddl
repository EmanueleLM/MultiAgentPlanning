(define (problem prob-snack)
  (:domain child-snack)
  (:objects
    child1 child2 child3 child4 child5 child6 child7 child8 child9 child10 child11 child12 - child
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 bread10 bread11 bread12 - bread-portion
    content1 content2 content3 content4 content5 content6 content7 content8 content9 content10 content11 content12 - content-portion
    tray1 tray2 tray3 - tray
    table1 table2 table3 - place
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 sandw12 sandw13 sandw14 sandw15 sandw16 - sandwich
  )

  (:init
    ;; Trays start in the kitchen
    (at tray1 kitchen)
    (at tray2 kitchen)
    (at tray3 kitchen)

    ;; All bread and content portions are initially available in the kitchen
    (bread_available bread1)
    (bread_available bread2)
    (bread_available bread3)
    (bread_available bread4)
    (bread_available bread5)
    (bread_available bread6)
    (bread_available bread7)
    (bread_available bread8)
    (bread_available bread9)
    (bread_available bread10)
    (bread_available bread11)
    (bread_available bread12)

    (content_available content1)
    (content_available content2)
    (content_available content3)
    (content_available content4)
    (content_available content5)
    (content_available content6)
    (content_available content7)
    (content_available content8)
    (content_available content9)
    (content_available content10)
    (content_available content11)
    (content_available content12)

    ;; Gluten-free ingredient markings
    (no_gluten_bread bread7)
    (no_gluten_bread bread3)
    (no_gluten_bread bread10)
    (no_gluten_bread bread9)

    (no_gluten_content content6)
    (no_gluten_content content8)
    (no_gluten_content content3)
    (no_gluten_content content2)

    ;; Children allergic to gluten
    (allergic_gluten child8)
    (allergic_gluten child9)
    (allergic_gluten child3)
    (allergic_gluten child4)

    ;; Children waiting at their tables
    (waiting child1 table1)
    (waiting child2 table1)
    (waiting child3 table1)
    (waiting child4 table3)
    (waiting child5 table2)
    (waiting child6 table2)
    (waiting child7 table1)
    (waiting child8 table2)
    (waiting child9 table2)
    (waiting child10 table1)
    (waiting child11 table2)
    (waiting child12 table1)

    ;; All sandwich placeholders are initially not made
    (not_made sandw1)
    (not_made sandw2)
    (not_made sandw3)
    (not_made sandw4)
    (not_made sandw5)
    (not_made sandw6)
    (not_made sandw7)
    (not_made sandw8)
    (not_made sandw9)
    (not_made sandw10)
    (not_made sandw11)
    (not_made sandw12)
    (not_made sandw13)
    (not_made sandw14)
    (not_made sandw15)
    (not_made sandw16)
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
      (served child9)
      (served child10)
      (served child11)
      (served child12)
    )
  )
)