(define (problem prob-snack)
  (:domain child-snack)
  (:objects
    child1 child2 child3 child4 child5 child6 child7 child8 child9 - child
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 - bread
    content1 content2 content3 content4 content5 content6 content7 content8 content9 - content
    tray1 tray2 tray3 - tray
    table1 table2 table3 - place
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 sandw12 - sandwich
  )

  (:init
    ;; trays start in the kitchen
    (tray_at tray1 kitchen)
    (tray_at tray2 kitchen)
    (tray_at tray3 kitchen)

    ;; bread and content availability
    (bread_available bread1) (bread_available bread2) (bread_available bread3)
    (bread_available bread4) (bread_available bread5) (bread_available bread6)
    (bread_available bread7) (bread_available bread8) (bread_available bread9)

    (content_available content1) (content_available content2) (content_available content3)
    (content_available content4) (content_available content5) (content_available content6)
    (content_available content7) (content_available content8) (content_available content9)

    ;; gluten-free markings for ingredients
    (bread_gluten_free bread6)
    (bread_gluten_free bread2)
    (bread_gluten_free bread7)

    (content_gluten_free content9)
    (content_gluten_free content4)
    (content_gluten_free content5)

    ;; pre-declared pairings: which bread+content produce each sandwich identifier
    (sandwich_bread sandw1 bread1)  (sandwich_content sandw1 content1)
    (sandwich_bread sandw2 bread2)  (sandwich_content sandw2 content4)
    (sandwich_bread sandw3 bread3)  (sandwich_content sandw3 content2)
    (sandwich_bread sandw4 bread4)  (sandwich_content sandw4 content3)
    (sandwich_bread sandw5 bread5)  (sandwich_content sandw5 content6)
    (sandwich_bread sandw6 bread6)  (sandwich_content sandw6 content5)
    (sandwich_bread sandw7 bread7)  (sandwich_content sandw7 content9)
    (sandwich_bread sandw8 bread8)  (sandwich_content sandw8 content7)
    (sandwich_bread sandw9 bread9)  (sandwich_content sandw9 content8)
    ;; sandw10..sandw12 have no recipe and thus cannot be created

    ;; children waiting locations
    (child_waiting_at child1 table3)
    (child_waiting_at child2 table1)
    (child_waiting_at child3 table3)
    (child_waiting_at child4 table1)
    (child_waiting_at child5 table1)
    (child_waiting_at child6 table1)
    (child_waiting_at child7 table3)
    (child_waiting_at child8 table2)
    (child_waiting_at child9 table2)

    ;; allergic children (only allergic ones are marked; non-allergic children are those without this predicate)
    (child_allergic_to_gluten child9)
    (child_allergic_to_gluten child2)
    (child_allergic_to_gluten child3)
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