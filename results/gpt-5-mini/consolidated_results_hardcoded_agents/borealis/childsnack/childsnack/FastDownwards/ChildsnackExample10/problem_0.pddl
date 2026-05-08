(define (problem child-snack-prob)
  (:domain child-snack)

  (:objects
    ;; places
    kitchen table1 table2 table3 - place

    ;; trays
    tray1 tray2 tray3 - tray

    ;; breads and contents (resources)
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 - bread
    content1 content2 content3 content4 content5 content6 content7 content8 - content

    ;; sandwiches (placeholders)
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 sandw12 sandw13 sandw14 sandw15 - sandwich

    ;; children
    child1 child2 child3 child4 child5 child6 child7 child8 - child
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

    (at_kitchen_content content1)
    (at_kitchen_content content2)
    (at_kitchen_content content3)
    (at_kitchen_content content4)
    (at_kitchen_content content5)
    (at_kitchen_content content6)
    (at_kitchen_content content7)
    (at_kitchen_content content8)

    ;; mark gluten-free breads and contents (need at least as many GF pairs as allergic children)
    (bread_gluten_free bread1)
    (bread_gluten_free bread2)
    (bread_gluten_free bread3)
    (bread_gluten_free bread4)

    (content_gluten_free content1)
    (content_gluten_free content2)
    (content_gluten_free content3)
    (content_gluten_free content4)

    ;; children positions at tables
    (at_child child1 table1)
    (at_child child2 table1)
    (at_child child3 table1)
    (at_child child4 table2)
    (at_child child5 table2)
    (at_child child6 table3)
    (at_child child7 table3)
    (at_child child8 table3)

    ;; allergic children (must receive gluten-free sandwiches)
    (child_gluten_allergic child2)
    (child_gluten_allergic child4)
    (child_gluten_allergic child7)
    (child_gluten_allergic child8)

    ;; No sandwiches are made initially; no bread_used/content_used, no served facts
    ;; (sandwich_made ...) facts are absent by default
  )

  ;; Goal: all children are served
  (:goal (and
    (served child1)
    (served child2)
    (served child3)
    (served child4)
    (served child5)
    (served child6)
    (served child7)
    (served child8)
  ))
)