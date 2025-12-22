(define (problem prob-snack)
  (:domain child-snack)
  (:objects
    child1 child2 child3 child4 child5 child6 child7 child8 child9 child10 - child
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 bread10 - bread-portion
    content1 content2 content3 content4 content5 content6 content7 content8 content9 content10 - content-portion
    tray1 tray2 tray3 - tray
    table1 table2 table3 - place
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 sandw12 sandw13 - sandwich

    ;; explicit discrete stages (a short chain sufficient to express stage progression)
    stage0 stage1 stage2 stage3 stage4 stage5 - stage
  )
  (:init
     ;; trays start in kitchen
     (at tray1 kitchen)
     (at tray2 kitchen)
     (at tray3 kitchen)

     ;; all bread and content portions start available in the kitchen (consumed when used)
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

     ;; gluten-free markers for specific ingredients
     (no_gluten_bread bread2)
     (no_gluten_bread bread9)
     (no_gluten_bread bread4)
     (no_gluten_bread bread8)

     (no_gluten_content content2)
     (no_gluten_content content8)
     (no_gluten_content content4)
     (no_gluten_content content1)

     ;; allergic children
     (allergic_gluten child1)
     (allergic_gluten child10)
     (allergic_gluten child3)
     (allergic_gluten child4)

     ;; where children are waiting
     (waiting child1 table2)
     (waiting child2 table1)
     (waiting child3 table1)
     (waiting child4 table2)
     (waiting child5 table3)
     (waiting child6 table3)
     (waiting child7 table3)
     (waiting child8 table2)
     (waiting child9 table1)
     (waiting child10 table3)

     ;; initial stage and successor chain (explicit ordering of stages)
     (current_stage stage0)
     (succ stage0 stage1)
     (succ stage1 stage2)
     (succ stage2 stage3)
     (succ stage3 stage4)
     (succ stage4 stage5)
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
    )
  )
)