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
     (at tray1 kitchen)
     (at tray2 kitchen)
     ; Bread portions
     (fresh_bread bread1) (available bread1)
     (fresh_bread bread2) (available bread2)
     (fresh_bread bread3) (available bread3)
     (fresh_bread bread4) (available bread4)
     (fresh_bread bread5) (available bread5)
     (fresh_bread bread6) (available bread6)
     ; Content portions
     (fresh_content content1) (available content1)
     (fresh_content content2) (available content2)
     (fresh_content content3) (available content3)
     (fresh_content content4) (available content4)
     (fresh_content content5) (available content5)
     (fresh_content content6) (available content6)
     ; Gluten-free bread specifications
     (is_gluten_free_bread bread4)
     (is_gluten_free_bread bread1)
     ; Child allergies
     (has_gluten_allergy child3)
     (has_gluten_allergy child4)
     ; Children locations
     (at child1 table1)
     (at child2 table1)
     (at child3 table3)
     (at child4 table3)
     (at child5 table1)
     (at child6 table3)
     ; Sandwiches are not ready/existent initially. Their absence from
     ; sandwich_ready implies they are not yet made.
  )
  (:goal
    (and
     (fed child1)
     (fed child2)
     (fed child3)
     (fed child4)
     (fed child5)
     (fed child6)
    )
  )
)