(define (problem prob-snack)
  (:domain child-snack)
  (:objects
    ;; children
    child1 child2 child3 child4 child5 child6 child7 child8 child9 child10 child11 child12 child13 - child

    ;; bread and content portions
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 bread10 bread11 bread12 bread13 - bread-portion
    content1 content2 content3 content4 content5 content6 content7 content8 content9 content10 content11 content12 content13 - content-portion

    ;; sandwiches (slots)
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 sandw12 sandw13 sandw14 sandw15 sandw16 sandw17 - sandwich

    ;; trays and places
    tray1 tray2 tray3 - tray
    table1 table2 table3 - place
  )

  (:init
    ;; trays at kitchen (kitchen is a domain constant)
    (tray-at tray1 kitchen)
    (tray-at tray2 kitchen)
    (tray-at tray3 kitchen)

    ;; bread located in kitchen (used as availability)
    (at-bread bread1 kitchen)
    (at-bread bread2 kitchen)
    (at-bread bread3 kitchen)
    (at-bread bread4 kitchen)
    (at-bread bread5 kitchen)
    (at-bread bread6 kitchen)
    (at-bread bread7 kitchen)
    (at-bread bread8 kitchen)
    (at-bread bread9 kitchen)
    (at-bread bread10 kitchen)
    (at-bread bread11 kitchen)
    (at-bread bread12 kitchen)
    (at-bread bread13 kitchen)

    ;; content located in kitchen
    (at-content content1 kitchen)
    (at-content content2 kitchen)
    (at-content content3 kitchen)
    (at-content content4 kitchen)
    (at-content content5 kitchen)
    (at-content content6 kitchen)
    (at-content content7 kitchen)
    (at-content content8 kitchen)
    (at-content content9 kitchen)
    (at-content content10 kitchen)
    (at-content content11 kitchen)
    (at-content content12 kitchen)
    (at-content content13 kitchen)

    ;; gluten-free labels
    (bread-gf bread3)
    (bread-gf bread5)
    (bread-gf bread8)
    (bread-gf bread10)
    (bread-gf bread11)

    (content-gf content3)
    (content-gf content7)
    (content-gf content9)
    (content-gf content11)
    (content-gf content12)

    ;; children allergic to gluten
    (allergic-gluten child1)
    (allergic-gluten child2)
    (allergic-gluten child3)
    (allergic-gluten child11)
    (allergic-gluten child12)

    ;; children waiting locations
    (child-waits-at child1 table3)
    (child-waits-at child2 table2)
    (child-waits-at child3 table2)
    (child-waits-at child4 table1)
    (child-waits-at child5 table2)
    (child-waits-at child6 table2)
    (child-waits-at child7 table1)
    (child-waits-at child8 table2)
    (child-waits-at child9 table1)
    (child-waits-at child10 table1)
    (child-waits-at child11 table3)
    (child-waits-at child12 table3)
    (child-waits-at child13 table2)
  )

  (:goal
    (and
      (child-served child1)
      (child-served child2)
      (child-served child3)
      (child-served child4)
      (child-served child5)
      (child-served child6)
      (child-served child7)
      (child-served child8)
      (child-served child9)
      (child-served child10)
      (child-served child11)
      (child-served child12)
      (child-served child13)
    )
  )
)