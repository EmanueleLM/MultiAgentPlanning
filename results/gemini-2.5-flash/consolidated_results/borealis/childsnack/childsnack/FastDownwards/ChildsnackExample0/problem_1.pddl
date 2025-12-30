(define (problem prob-snack)
  (:domain child-snack)
  (:objects
    child1 child2 child3 child4 child5 child6 - child
    bread1 bread2 bread3 bread4 bread5 bread6 - bread-portion
    content1 content2 content3 content4 content5 content6 - content-portion
    tray1 tray2 - tray
    table1 table2 table3 - place
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 - sandwich
  )
  (:init
     (at_tray tray1 kitchen)
     (at_tray tray2 kitchen)
     
     (at_kitchen_bread bread1)
     (at_kitchen_bread bread2)
     (at_kitchen_bread bread3)
     (at_kitchen_bread bread4)
     (at_kitchen_bread bread5)
     (at_kitchen_bread bread6)
     
     (at_kitchen_content content1)
     (at_kitchen_content content2)
     (at_kitchen_content content3)
     (at_kitchen_content content4)
     (at_kitchen_content content5)
     (at_kitchen_content content6)
     
     (no_gluten_bread bread4)
     (no_gluten_bread bread1)
     (no_gluten_content content6)
     (no_gluten_content content5)
     
     (allergic_gluten child3)
     (allergic_gluten child4)
     (not_allergic_gluten child1)
     (not_allergic_gluten child2)
     (not_allergic_gluten child5)
     (not_allergic_gluten child6)
     
     (waiting child1 table1)
     (waiting child2 table1)
     (waiting child3 table3)
     (waiting child4 table3)
     (waiting child5 table1)
     (waiting child6 table3)
  )
  (:goal
    (and
     (served child1)
     (served child2)
     (served child3)
     (served child4)
     (served child5)
     (served child6)
    )
  )
)