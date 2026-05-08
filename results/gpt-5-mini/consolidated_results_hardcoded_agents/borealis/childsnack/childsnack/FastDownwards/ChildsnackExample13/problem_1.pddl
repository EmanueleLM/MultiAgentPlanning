(define (problem prob-snack)
  (:domain child-snack)
  (:objects
    child1 child2 child3 child4 child5 child6 child7 child8 child9 child10 child11 child12 child13 - child

    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 bread10 bread11 bread12 bread13 - bread-portion
    content1 content2 content3 content4 content5 content6 content7 content8 content9 content10 content11 content12 content13 - content-portion

    tray1 tray2 tray3 - tray

    table1 table2 table3 kitchen - place

    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 sandw12 sandw13 sandw14 sandw15 sandw16 sandw17 - sandwich
  )

  (:init
    ;; trays initially in kitchen
    (at_tray tray1 kitchen)
    (at_tray tray2 kitchen)
    (at_tray tray3 kitchen)

    ;; breads and contents available in kitchen
    (at_kitchen_bread bread1) (at_kitchen_bread bread2) (at_kitchen_bread bread3)
    (at_kitchen_bread bread4) (at_kitchen_bread bread5) (at_kitchen_bread bread6)
    (at_kitchen_bread bread7) (at_kitchen_bread bread8) (at_kitchen_bread bread9)
    (at_kitchen_bread bread10) (at_kitchen_bread bread11) (at_kitchen_bread bread12)
    (at_kitchen_bread bread13)

    (at_kitchen_content content1) (at_kitchen_content content2) (at_kitchen_content content3)
    (at_kitchen_content content4) (at_kitchen_content content5) (at_kitchen_content content6)
    (at_kitchen_content content7) (at_kitchen_content content8) (at_kitchen_content content9)
    (at_kitchen_content content10) (at_kitchen_content content11) (at_kitchen_content content12)
    (at_kitchen_content content13)

    ;; gluten-free ingredient annotations (from problem statement)
    (no_gluten_bread bread1)
    (no_gluten_bread bread3)
    (no_gluten_bread bread5)
    (no_gluten_bread bread11)
    (no_gluten_bread bread12)

    (no_gluten_content content2)
    (no_gluten_content content4)
    (no_gluten_content content6)
    (no_gluten_content content10)
    (no_gluten_content content11)

    ;; child allergy annotations (allergic to gluten)
    (child_allergic child1)
    (child_allergic child4)
    (child_allergic child8)
    (child_allergic child12)
    (child_allergic child13)

    ;; children waiting at places (from problem statement)
    (waiting child1 table2)
    (waiting child5 table2)

    (waiting child2 table3)
    (waiting child3 table3)
    (waiting child4 table3)
    (waiting child7 table3)
    (waiting child10 table3)

    (waiting child6 table1)
    (waiting child8 table1)
    (waiting child9 table1)
    (waiting child11 table1)
    (waiting child12 table1)
    (waiting child13 table1)

    ;; all children are initially unserved
    (unserved child1) (unserved child2) (unserved child3) (unserved child4)
    (unserved child5) (unserved child6) (unserved child7) (unserved child8)
    (unserved child9) (unserved child10) (unserved child11) (unserved child12)
    (unserved child13)

    ;; all sandwich placeholders initially free
    (sandwich_free sandw1) (sandwich_free sandw2) (sandwich_free sandw3)
    (sandwich_free sandw4) (sandwich_free sandw5) (sandwich_free sandw6)
    (sandwich_free sandw7) (sandwich_free sandw8) (sandwich_free sandw9)
    (sandwich_free sandw10) (sandwich_free sandw11) (sandwich_free sandw12)
    (sandwich_free sandw13) (sandwich_free sandw14) (sandwich_free sandw15)
    (sandwich_free sandw16) (sandwich_free sandw17)
  )

  (:goal
    (and
      (served child1) (served child2) (served child3) (served child4)
      (served child5) (served child6) (served child7) (served child8)
      (served child9) (served child10) (served child11) (served child12)
      (served child13)
    )
  )
)