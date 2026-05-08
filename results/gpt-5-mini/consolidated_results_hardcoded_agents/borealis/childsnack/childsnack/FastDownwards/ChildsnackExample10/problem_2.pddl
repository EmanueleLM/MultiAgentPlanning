(define (problem prob-snack)
  (:domain child-snack)
  (:objects
    ;; children
    child1 child2 child3 child4 child5 child6 child7 child8 child9 child10 child11 - child

    ;; bread portions
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 bread10 bread11 - bread-portion

    ;; content portions
    content1 content2 content3 content4 content5 content6 content7 content8 content9 content10 content11 - content-portion

    ;; trays
    tray1 tray2 tray3 - tray

    ;; places (kitchen is a domain constant)
    table1 table2 table3 - place

    ;; sandwiches placeholders
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 sandw12 sandw13 sandw14 sandw15 - sandwich

    ;; explicit ordered stages (12 steps to allow 11 serves advancing from stage0 to stage11)
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 stage11 - step
  )

  (:init
    ;; trays start in the kitchen
    (at_tray tray1 kitchen)
    (at_tray tray2 kitchen)
    (at_tray tray3 kitchen)

    ;; bread and content portions available in the kitchen
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

    ;; gluten-free breads and contents (as specified)
    (no_gluten_bread bread2)
    (no_gluten_bread bread7)
    (no_gluten_bread bread8)
    (no_gluten_bread bread9)

    (no_gluten_content content2)
    (no_gluten_content content6)
    (no_gluten_content content7)
    (no_gluten_content content9)

    ;; children allergy flags (as specified)
    (child_gluten_allergic child2)
    (child_gluten_allergic child4)
    (child_gluten_allergic child7)
    (child_gluten_allergic child8)

    ;; children waiting at places (as specified)
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

    ;; sandwiches do not exist/prepared yet -> marked unused
    (unused sandw1)
    (unused sandw2)
    (unused sandw3)
    (unused sandw4)
    (unused sandw5)
    (unused sandw6)
    (unused sandw7)
    (unused sandw8)
    (unused sandw9)
    (unused sandw10)
    (unused sandw11)
    (unused sandw12)
    (unused sandw13)
    (unused sandw14)
    (unused sandw15)

    ;; stage ordering relations and initial active stage
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

    (active_stage stage0)

    ;; distinct-place facts for all ordered distinct pairs (kitchen and tables)
    (distinct_place kitchen table1)
    (distinct_place kitchen table2)
    (distinct_place kitchen table3)
    (distinct_place table1 kitchen)
    (distinct_place table2 kitchen)
    (distinct_place table3 kitchen)
    (distinct_place table1 table2)
    (distinct_place table1 table3)
    (distinct_place table2 table1)
    (distinct_place table2 table3)
    (distinct_place table3 table1)
    (distinct_place table3 table2)
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