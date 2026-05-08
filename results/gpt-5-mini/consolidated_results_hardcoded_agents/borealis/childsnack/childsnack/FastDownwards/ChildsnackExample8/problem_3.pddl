(define (problem prob-snack-10)
  (:domain child-snack)

  (:objects
    ;; children
    child1 child2 child3 child4 child5 child6 child7 child8 child9 child10 - child

    ;; bread portions
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 bread10 - bread-portion

    ;; content portions
    content1 content2 content3 content4 content5 content6 content7 content8 content9 content10 - content-portion

    ;; sandwiches (10 potential sandwich objects - enough for 10 children)
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 - sandwich

    ;; trays
    tray1 tray2 tray3 - tray

    ;; places (tables; kitchen is a domain constant)
    table1 table2 table3 - place
  )

  (:init
    ;; breads and contents are at kitchen
    (bread_at bread1 kitchen)
    (bread_at bread2 kitchen)
    (bread_at bread3 kitchen)
    (bread_at bread4 kitchen)
    (bread_at bread5 kitchen)
    (bread_at bread6 kitchen)
    (bread_at bread7 kitchen)
    (bread_at bread8 kitchen)
    (bread_at bread9 kitchen)
    (bread_at bread10 kitchen)

    (content_at content1 kitchen)
    (content_at content2 kitchen)
    (content_at content3 kitchen)
    (content_at content4 kitchen)
    (content_at content5 kitchen)
    (content_at content6 kitchen)
    (content_at content7 kitchen)
    (content_at content8 kitchen)
    (content_at content9 kitchen)
    (content_at content10 kitchen)

    ;; gluten-free assignments per problem statement
    (bread_gf bread6)
    (bread_gf bread2)
    (bread_gf bread8)
    (bread_gf bread7)

    (content_gf content5)
    (content_gf content6)
    (content_gf content2)
    (content_gf content8)

    ;; trays at kitchen and initially pure
    (tray_at tray1 kitchen)
    (tray_at tray2 kitchen)
    (tray_at tray3 kitchen)
    (tray_pure tray1)
    (tray_pure tray2)
    (tray_pure tray3)

    ;; children waiting locations (as specified)
    (waiting_at child1 table1)
    (waiting_at child2 table1)
    (waiting_at child3 table1)
    (waiting_at child7 table1)
    (waiting_at child10 table1)

    (waiting_at child5 table2)
    (waiting_at child6 table2)
    (waiting_at child8 table2)
    (waiting_at child9 table2)

    (waiting_at child4 table3)

    ;; children allergic to gluten per problem statement (others are implicitly non-allergic)
    (child_allergic_gluten child9)
    (child_allergic_gluten child2)
    (child_allergic_gluten child3)
    (child_allergic_gluten child7)
  )

  (:goal (and
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
  ))
)