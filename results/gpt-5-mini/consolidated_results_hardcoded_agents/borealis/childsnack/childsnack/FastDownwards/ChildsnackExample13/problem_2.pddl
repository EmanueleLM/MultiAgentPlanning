(define (problem prob-snack)
  (:domain child-snack)
  (:objects
    ;; children
    child1 child2 child3 child4 child5 child6 child7 child8 child9 child10 child11 child12 child13 - child

    ;; ingredients (portions)
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 bread10 bread11 bread12 bread13 - bread-portion
    content1 content2 content3 content4 content5 content6 content7 content8 content9 content10 content11 content12 content13 - content-portion

    ;; trays
    tray1 tray2 tray3 - tray

    ;; places (kitchen is a domain constant)
    table1 table2 table3 - place

    ;; sandwich placeholders: one per child (no extra placeholders)
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 sandw12 sandw13 - sandwich
  )

  (:init
    ;; trays initially in kitchen
    (at_tray tray1 kitchen)
    (at_tray tray2 kitchen)
    (at_tray tray3 kitchen)

    ;; gluten-free annotations (only positive facts necessary)
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

    ;; children allergic to gluten (others are implicitly not allergic)
    (child_allergic child1)
    (child_allergic child4)
    (child_allergic child8)
    (child_allergic child12)
    (child_allergic child13)

    ;; children waiting at places
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

    ;; No explicit 'available' facts for breads, contents, sandwiches, or "unserved" children:
    ;; availability is expressed by absence of bread_used/content_used/sandwich_used/served facts,
    ;; which reduces init cardinality while preserving the resource constraints enforced by actions.
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