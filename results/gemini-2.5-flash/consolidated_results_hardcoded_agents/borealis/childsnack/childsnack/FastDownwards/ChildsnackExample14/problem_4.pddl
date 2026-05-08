(define (problem prob-snack)
  (:domain child-snack)
  (:objects
    child1 child2 child3 child4 child5 child6 child7 child8 child9 child10 child11 child12 child13 - child
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 bread10 bread11 bread12 bread13 - bread-portion
    content1 content2 content3 content4 content5 content6 content7 content8 content9 content10 content11 content12 content13 - content-portion
    tray1 tray2 tray3 - tray
    table1 table2 table3 - place
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 sandw12 sandw13 - sandwich
  )
  (:init
     ; 3 Tray Locations
     (at tray1 kitchen)
     (at tray2 kitchen)
     (at tray3 kitchen)

     ; Ingredient Availability (0 facts: handled by CWA on used_bread/used_content)

     ; 5 GF Bread definitions
     (no_gluten_bread bread3)
     (no_gluten_bread bread5)
     (no_gluten_bread bread8)
     (no_gluten_bread bread10)
     (no_gluten_bread bread11)

     ; 5 GF Content definitions
     (no_gluten_content content3)
     (no_gluten_content content7)
     (no_gluten_content content9)
     (no_gluten_content content11)
     (no_gluten_content content12)

     ; 5 Allergic Children (Non-allergic children determined by CWA)
     (allergic_gluten child1)
     (allergic_gluten child2)
     (allergic_gluten child3)
     (allergic_gluten child11)
     (allergic_gluten child12)

     ; 13 Waiting Locations
     (waiting child1 table3)
     (waiting child2 table2)
     (waiting child3 table2)
     (waiting child4 table1)
     (waiting child5 table2)
     (waiting child6 table2)
     (waiting child7 table1)
     (waiting child8 table2)
     (waiting child9 table1)
     (waiting child10 table1)
     (waiting child11 table3)
     (waiting child12 table3)
     (waiting child13 table2)

     ; 13 Sandwiches Not Existing 
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
     (notexist sandw12)
     (notexist sandw13)
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
     (served child13)
    )
  )
)