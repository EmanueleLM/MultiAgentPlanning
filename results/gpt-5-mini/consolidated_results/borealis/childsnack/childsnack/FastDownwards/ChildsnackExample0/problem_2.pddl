(define (problem prob-snack)
  (:domain child-snack)
  (:objects
    child1 child2 child3 child4 child5 child6 - child
    bread1 bread2 bread3 bread4 bread5 bread6 - bread-portion
    content1 content2 content3 content4 content5 content6 - content-portion
    tray1 tray2 - tray
    table1 table2 table3 - place
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 - sandwich
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9
    stage10 stage11 stage12 stage13 stage14 stage15 stage16 stage17 stage18 stage19
    stage20 stage21 stage22 stage23 stage24 stage25 - stage
  )
  (:init
     ;; trays initial locations
     (at tray1 kitchen)
     (at tray2 kitchen)

     ;; bread portions in kitchen
     (at_kitchen_bread bread1)
     (at_kitchen_bread bread2)
     (at_kitchen_bread bread3)
     (at_kitchen_bread bread4)
     (at_kitchen_bread bread5)
     (at_kitchen_bread bread6)

     ;; content portions in kitchen
     (at_kitchen_content content1)
     (at_kitchen_content content2)
     (at_kitchen_content content3)
     (at_kitchen_content content4)
     (at_kitchen_content content5)
     (at_kitchen_content content6)

     ;; gluten-free labels for ingredients
     (no_gluten_bread bread1)
     (no_gluten_bread bread4)

     (no_gluten_content content5)
     (no_gluten_content content6)

     ;; allergy information
     (allergic_gluten child3)
     (allergic_gluten child4)

     (not_allergic_gluten child1)
     (not_allergic_gluten child2)
     (not_allergic_gluten child5)
     (not_allergic_gluten child6)

     ;; waiting locations
     (waiting child1 table1)
     (waiting child2 table1)
     (waiting child5 table1)
     (waiting child3 table3)
     (waiting child4 table3)
     (waiting child6 table3)

     ;; sandwiches initially do not exist
     (notexist sandw1)
     (notexist sandw2)
     (notexist sandw3)
     (notexist sandw4)
     (notexist sandw5)
     (notexist sandw6)
     (notexist sandw7)
     (notexist sandw8)

     ;; initial stage (unique)
     (stage_current stage0)

     ;; explicit successor relations to force contiguous discrete progression
     (succ stage0 stage1)
     (succ stage1 stage2)
     (succ stage2 stage3)
     (succ stage3 stage4)
     (succ stage4 stage5)
     (succ stage5 stage6)
     (succ stage6 stage7)
     (succ stage7 stage8)
     (succ stage8 stage9)
     (succ stage9 stage10)
     (succ stage10 stage11)
     (succ stage11 stage12)
     (succ stage12 stage13)
     (succ stage13 stage14)
     (succ stage14 stage15)
     (succ stage15 stage16)
     (succ stage16 stage17)
     (succ stage17 stage18)
     (succ stage18 stage19)
     (succ stage19 stage20)
     (succ stage20 stage21)
     (succ stage21 stage22)
     (succ stage22 stage23)
     (succ stage23 stage24)
     (succ stage24 stage25)
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