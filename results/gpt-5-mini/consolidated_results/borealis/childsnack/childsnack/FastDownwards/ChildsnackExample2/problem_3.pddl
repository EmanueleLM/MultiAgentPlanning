(define (problem prob-snack)
  (:domain child-snack)
  (:objects
    child1 child2 child3 child4 child5 child6 child7 - child
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 - bread-portion
    content1 content2 content3 content4 content5 content6 content7 - content-portion
    tray1 tray2 - tray
    table1 table2 table3 - place
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 - sandwich
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9
    stage10 stage11 stage12 stage13 stage14 stage15 stage16 stage17 stage18 stage19
    stage20 stage21 stage22 stage23 stage24 stage25 stage26 stage27 stage28 stage29
    stage30 stage31 stage32 stage33 stage34 stage35 stage36 stage37 stage38 stage39
    stage40 - stage
  )
  (:init
     ;; trays start in the kitchen
     (at tray1 kitchen)
     (at tray2 kitchen)

     ;; breads and contents available in kitchen
     (at_kitchen_bread bread1)
     (at_kitchen_bread bread2)
     (at_kitchen_bread bread3)
     (at_kitchen_bread bread4)
     (at_kitchen_bread bread5)
     (at_kitchen_bread bread6)
     (at_kitchen_bread bread7)

     (at_kitchen_content content1)
     (at_kitchen_content content2)
     (at_kitchen_content content3)
     (at_kitchen_content content4)
     (at_kitchen_content content5)
     (at_kitchen_content content6)
     (at_kitchen_content content7)

     ;; gluten-free markings
     (no_gluten_bread bread5)
     (no_gluten_bread bread2)
     (no_gluten_content content7)
     (no_gluten_content content6)

     ;; allergies
     (allergic_gluten child4)
     (allergic_gluten child7)

     (not_allergic_gluten child1)
     (not_allergic_gluten child2)
     (not_allergic_gluten child3)
     (not_allergic_gluten child5)
     (not_allergic_gluten child6)

     ;; waiting places
     (waiting child1 table1)
     (waiting child2 table1)
     (waiting child3 table1)
     (waiting child4 table3)
     (waiting child5 table1)
     (waiting child6 table3)
     (waiting child7 table1)

     ;; sandwiches do not exist yet
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

     ;; stages: chain next relations and start at stage0
     (next stage0 stage1)
     (next stage1 stage2)
     (next stage2 stage3)
     (next stage3 stage4)
     (next stage4 stage5)
     (next stage5 stage6)
     (next stage6 stage7)
     (next stage7 stage8)
     (next stage8 stage9)
     (next stage9 stage10)
     (next stage10 stage11)
     (next stage11 stage12)
     (next stage12 stage13)
     (next stage13 stage14)
     (next stage14 stage15)
     (next stage15 stage16)
     (next stage16 stage17)
     (next stage17 stage18)
     (next stage18 stage19)
     (next stage19 stage20)
     (next stage20 stage21)
     (next stage21 stage22)
     (next stage22 stage23)
     (next stage23 stage24)
     (next stage24 stage25)
     (next stage25 stage26)
     (next stage26 stage27)
     (next stage27 stage28)
     (next stage28 stage29)
     (next stage29 stage30)
     (next stage30 stage31)
     (next stage31 stage32)
     (next stage32 stage33)
     (next stage33 stage34)
     (next stage34 stage35)
     (next stage35 stage36)
     (next stage36 stage37)
     (next stage37 stage38)
     (next stage38 stage39)
     (next stage39 stage40)

     (current_stage stage0)
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
    )
  )
)