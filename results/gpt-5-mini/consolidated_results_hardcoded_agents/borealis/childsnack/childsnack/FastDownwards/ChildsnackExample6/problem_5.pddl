(define (problem prob-snack)
  (:domain child-snack)
  (:objects
    child1 child2 child3 child4 child5 child6 child7 child8 child9 - child
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 - bread-portion
    content1 content2 content3 content4 content5 content6 content7 content8 content9 - content-portion
    tray1 tray2 tray3 - tray
    table1 table2 table3 kitchen - place
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 sandw12 - sandwich
    ;; discrete stages to enforce strict linear ordering of actions
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9
    stage10 stage11 stage12 stage13 stage14 stage15 stage16 stage17 stage18 stage19
    stage20 stage21 stage22 stage23 stage24 stage25 stage26 stage27 stage28 stage29
    stage30 stage31 stage32 stage33 stage34 stage35 stage36 stage37 stage38 stage39
    stage40 stage41 stage42 stage43 stage44 stage45 stage46 stage47 stage48 stage49
    stage50 stage51 stage52 stage53 stage54 stage55 stage56 stage57 stage58 stage59
    stage60 - stage
  )

  (:init
    ;; trays start in kitchen
    (tray-at tray1 kitchen)
    (tray-at tray2 kitchen)
    (tray-at tray3 kitchen)

    ;; bread and content are in kitchen initially (available)
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

    ;; gluten-free markers
    (bread-gf bread6)
    (bread-gf bread2)
    (bread-gf bread7)

    (content-gf content9)
    (content-gf content4)
    (content-gf content5)

    ;; children waiting locations
    (waiting child1 table3)
    (waiting child2 table1)
    (waiting child3 table3)
    (waiting child4 table1)
    (waiting child5 table1)
    (waiting child6 table1)
    (waiting child7 table3)
    (waiting child8 table2)
    (waiting child9 table2)

    ;; allergic children
    (allergic-gluten child2)
    (allergic-gluten child3)
    (allergic-gluten child9)

    ;; explicit stage successor chain
    (succ stage0 stage1) (succ stage1 stage2) (succ stage2 stage3) (succ stage3 stage4) (succ stage4 stage5)
    (succ stage5 stage6) (succ stage6 stage7) (succ stage7 stage8) (succ stage8 stage9) (succ stage9 stage10)
    (succ stage10 stage11) (succ stage11 stage12) (succ stage12 stage13) (succ stage13 stage14) (succ stage14 stage15)
    (succ stage15 stage16) (succ stage16 stage17) (succ stage17 stage18) (succ stage18 stage19) (succ stage19 stage20)
    (succ stage20 stage21) (succ stage21 stage22) (succ stage22 stage23) (succ stage23 stage24) (succ stage24 stage25)
    (succ stage25 stage26) (succ stage26 stage27) (succ stage27 stage28) (succ stage28 stage29) (succ stage29 stage30)
    (succ stage30 stage31) (succ stage31 stage32) (succ stage32 stage33) (succ stage33 stage34) (succ stage34 stage35)
    (succ stage35 stage36) (succ stage36 stage37) (succ stage37 stage38) (succ stage38 stage39) (succ stage39 stage40)
    (succ stage40 stage41) (succ stage41 stage42) (succ stage42 stage43) (succ stage43 stage44) (succ stage44 stage45)
    (succ stage45 stage46) (succ stage46 stage47) (succ stage47 stage48) (succ stage48 stage49) (succ stage49 stage50)
    (succ stage50 stage51) (succ stage51 stage52) (succ stage52 stage53) (succ stage53 stage54) (succ stage54 stage55)
    (succ stage55 stage56) (succ stage56 stage57) (succ stage57 stage58) (succ stage58 stage59) (succ stage59 stage60)

    ;; starting stage
    (current stage0)
  )

  (:goal (and
    (served child1) (served child2) (served child3) (served child4) (served child5)
    (served child6) (served child7) (served child8) (served child9)
  ))
)