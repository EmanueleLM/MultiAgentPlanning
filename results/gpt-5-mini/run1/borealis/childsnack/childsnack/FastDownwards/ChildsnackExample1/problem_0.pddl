(define (problem serve-seven-children)
  (:domain child-snack)

  (:objects
    ;; locations
    kitchen table1 table2 table3 table4 table5 table6 table7 - location

    ;; breads and contents
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 - bread
    content1 content2 content3 content4 content5 content6 content7 - content

    ;; sandwiches placeholders (10 available IDs)
    sandwich1 sandwich2 sandwich3 sandwich4 sandwich5 sandwich6 sandwich7 sandwich8 sandwich9 sandwich10 - sandwich

    ;; trays and slots
    tray1 tray2 - tray
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 - slot

    ;; children
    child1 child2 child3 child4 child5 child6 child7 - child
  )

  (:init
    ;; All breads and contents are in the kitchen initially
    (at-bread bread1 kitchen)
    (at-bread bread2 kitchen)
    (at-bread bread3 kitchen)
    (at-bread bread4 kitchen)
    (at-bread bread5 kitchen)
    (at-bread bread6 kitchen)
    (at-bread bread7 kitchen)

    (at-content content1 kitchen)
    (at-content content2 kitchen)
    (at-content content3 kitchen)
    (at-content content4 kitchen)
    (at-content content5 kitchen)
    (at-content content6 kitchen)
    (at-content content7 kitchen)

    ;; tray initial locations
    (tray-at tray1 kitchen)
    (tray-at tray2 kitchen)

    ;; define slots belonging to trays
    (tray-slot tray1 slot1)
    (tray-slot tray1 slot2)
    (tray-slot tray1 slot3)
    (tray-slot tray1 slot4)
    (tray-slot tray2 slot5)
    (tray-slot tray2 slot6)
    (tray-slot tray2 slot7)

    ;; All slots free at start
    (slot-free slot1)
    (slot-free slot2)
    (slot-free slot3)
    (slot-free slot4)
    (slot-free slot5)
    (slot-free slot6)
    (slot-free slot7)

    ;; sandwich placeholders start as not existing
    (notexist sandwich1)
    (notexist sandwich2)
    (notexist sandwich3)
    (notexist sandwich4)
    (notexist sandwich5)
    (notexist sandwich6)
    (notexist sandwich7)
    (notexist sandwich8)
    (notexist sandwich9)
    (notexist sandwich10)

    ;; children waiting at their tables
    (waiting-at child1 table1)
    (waiting-at child2 table2)
    (waiting-at child3 table3)
    (waiting-at child4 table4)
    (waiting-at child5 table5)
    (waiting-at child6 table6)
    (waiting-at child7 table7)

    ;; Allergies (example instance): child1 and child4 are gluten-allergic
    (allergic child1)
    (allergic child4)

    ;; Gluten-free ingredients (must be sufficient to serve allergic children)
    ;; breads bread1 and bread2 are gluten-free
    (gluten-free-bread bread1)
    (gluten-free-bread bread2)

    ;; contents content1 and content2 are gluten-free
    (gluten-free-content content1)
    (gluten-free-content content2)
  )

  (:goal (and
    (served child1)
    (served child2)
    (served child3)
    (served child4)
    (served child5)
    (served child6)
    (served child7)
  ))
)