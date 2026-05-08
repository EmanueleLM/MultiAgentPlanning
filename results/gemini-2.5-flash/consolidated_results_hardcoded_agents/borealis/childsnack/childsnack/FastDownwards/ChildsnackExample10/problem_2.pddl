(define (problem prob-snack)
  (:domain child-snack)
  (:objects
    child1 child2 child3 child4 child5 child6 child7 child8 child9 child10 child11 - child
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 bread10 bread11 - bread-portion
    content1 content2 content3 content4 content5 content6 content7 content8 content9 content10 content11 - content-portion
    tray1 tray2 tray3 - tray
    table1 table2 table3 - place
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 sandw12 sandw13 sandw14 sandw15 - sandwich
  )
  (:init
     ; 3 Tray Locations
     (at tray1 kitchen)
     (at tray2 kitchen)
     (at tray3 kitchen)

     ; 11 Bread Portions in Kitchen
     (at_kitchen_bread bread1)
     (at_kitchen_bread bread2)
     (at_kitchen_bread bread3)
     (at_kitchen_bread bread4)
     (at_kitchen_bread bread5)
     (at_kitchen_bread bread6)
     (at_kitchen_bread bread7)
     (at_kitchen_bread bread8)
     (at_kitchen_bread bread9)
     (at_kitchen_bread bread10)
     (at_kitchen_bread bread11)

     ; 11 Content Portions in Kitchen
     (at_kitchen_content content1)
     (at_kitchen_content content2)
     (at_kitchen_content content3)
     (at_kitchen_content content4)
     (at_kitchen_content content5)
     (at_kitchen_content content6)
     (at_kitchen_content content7)
     (at_kitchen_content content8)
     (at_kitchen_content content9)
     (at_kitchen_content content10)
     (at_kitchen_content content11)

     ; 4 Gluten-Free Bread Portions
     (no_gluten_bread bread2)
     (no_gluten_bread bread7)
     (no_gluten_bread bread8)
     (no_gluten_bread bread9)

     ; 4 Gluten-Free Content Portions
     (no_gluten_content content2)
     (no_gluten_content content6)
     (no_gluten_content content7)
     (no_gluten_content content9)

     ; 4 Allergic Children (Others are implicitly not allergic)
     (allergic_gluten child2)
     (allergic_gluten child4)
     (allergic_gluten child7)
     (allergic_gluten child8)
     
     ; 11 Waiting Children (Locations)
     (waiting child1 table1)
     (waiting child2 table1)
     (waiting child3 table1)
     (waiting child10 table1)
     (waiting child7 table1)
     (waiting child5 table2)
     (waiting child6 table2)
     (waiting child8 table2)
     (waiting child9 table2)
     (waiting child11 table2)
     (waiting child4 table3)
     
     ; Sandwiches are implicitly (not (created ?s))
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
    )
  )
)