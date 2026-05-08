(define (problem prob-snack)
  (:domain child-snack)
  (:objects
    child1 child2 child3 child4 child5 child6 child7 child8 child9 - child

    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 - bread-portion
    content1 content2 content3 content4 content5 content6 content7 content8 content9 - content-portion

    tray1 tray2 tray3 - tray

    table1 table2 table3 - place

    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 sandw12 - sandwich

    ;; discrete steps to enforce forward-only progression for trays
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 step12 step13 step14 step15 step16 step17 step18 step19 step20 - step
  )

  (:init
     ;; trays at kitchen
     (at tray1 kitchen)
     (at tray2 kitchen)
     (at tray3 kitchen)

     ;; trays initial progression stage
     (at_step tray1 step0)
     (at_step tray2 step0)
     (at_step tray3 step0)

     ;; step successor relations (static) - enforces discrete forward progression
     (next step0 step1)
     (next step1 step2)
     (next step2 step3)
     (next step3 step4)
     (next step4 step5)
     (next step5 step6)
     (next step6 step7)
     (next step7 step8)
     (next step8 step9)
     (next step9 step10)
     (next step10 step11)
     (next step11 step12)
     (next step12 step13)
     (next step13 step14)
     (next step14 step15)
     (next step15 step16)
     (next step16 step17)
     (next step17 step18)
     (next step18 step19)
     (next step19 step20)

     ;; breads and contents available in kitchen
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

     ;; gluten-free ingredient markings
     (no_gluten_bread bread2)
     (no_gluten_bread bread3)
     (no_gluten_bread bread8)

     (no_gluten_content content1)
     (no_gluten_content content5)
     (no_gluten_content content6)

     ;; child allergy flags
     (allergic_gluten child2)
     (allergic_gluten child5)
     (allergic_gluten child7)

     (not_allergic_gluten child1)
     (not_allergic_gluten child3)
     (not_allergic_gluten child4)
     (not_allergic_gluten child6)
     (not_allergic_gluten child8)
     (not_allergic_gluten child9)

     ;; children waiting at tables (locations)
     (waiting child1 table2)
     (waiting child2 table1)
     (waiting child3 table1)
     (waiting child4 table2)
     (waiting child5 table1)
     (waiting child6 table1)
     (waiting child7 table2)
     (waiting child8 table3)
     (waiting child9 table3)

     ;; sandwiches do not exist yet (identifiers unused)
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
    )
  )
)