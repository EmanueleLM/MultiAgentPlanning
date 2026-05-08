(define (problem serve-seven-children)
  (:domain child-snack)

  (:objects
    ;; locations
    kitchen table1 table2 table3 table4 table5 table6 table7 - location

    ;; children
    child1 child2 child3 child4 child5 child6 child7 - child

    ;; trays
    tray1 tray2 - tray

    ;; tray slots (explicit capacity)
    slot_t1_1 slot_t1_2 slot_t1_3 slot_t1_4 - tray_slot
    slot_t2_1 slot_t2_2 slot_t2_3 - tray_slot

    ;; bread portions
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 - bread_portion

    ;; content portions
    content1 content2 content3 content4 content5 content6 content7 - content_portion

    ;; sandwich identity slots
    sandwich1 sandwich2 sandwich3 sandwich4 sandwich5 sandwich6 sandwich7 sandwich8 sandwich9 sandwich10 - sandwich
  )

  (:init
    ;; Locations: trays start in kitchen
    (at_tray tray1 kitchen)
    (at_tray tray2 kitchen)

    ;; tray slots belong to trays and start at kitchen and are free
    (tray_slot slot_t1_1) (slot_of slot_t1_1 tray1) (slot_at slot_t1_1 kitchen) (slot_free slot_t1_1)
    (tray_slot slot_t1_2) (slot_of slot_t1_2 tray1) (slot_at slot_t1_2 kitchen) (slot_free slot_t1_2)
    (tray_slot slot_t1_3) (slot_of slot_t1_3 tray1) (slot_at slot_t1_3 kitchen) (slot_free slot_t1_3)
    (tray_slot slot_t1_4) (slot_of slot_t1_4 tray1) (slot_at slot_t1_4 kitchen) (slot_free slot_t1_4)

    (tray_slot slot_t2_1) (slot_of slot_t2_1 tray2) (slot_at slot_t2_1 kitchen) (slot_free slot_t2_1)
    (tray_slot slot_t2_2) (slot_of slot_t2_2 tray2) (slot_at slot_t2_2 kitchen) (slot_free slot_t2_2)
    (tray_slot slot_t2_3) (slot_of slot_t2_3 tray2) (slot_at slot_t2_3 kitchen) (slot_free slot_t2_3)

    ;; Bread and content portions are available and located in kitchen
    (bread_available bread1) (at_bread bread1 kitchen)
    (bread_available bread2) (at_bread bread2 kitchen)
    (bread_available bread3) (at_bread bread3 kitchen)
    (bread_available bread4) (at_bread bread4 kitchen)
    (bread_available bread5) (at_bread bread5 kitchen)
    (bread_available bread6) (at_bread bread6 kitchen)
    (bread_available bread7) (at_bread bread7 kitchen)

    (content_available content1) (at_content content1 kitchen)
    (content_available content2) (at_content content2 kitchen)
    (content_available content3) (at_content content3 kitchen)
    (content_available content4) (at_content content4 kitchen)
    (content_available content5) (at_content content5 kitchen)
    (content_available content6) (at_content content6 kitchen)
    (content_available content7) (at_content content7 kitchen)

    ;; Mark which bread/content are gluten-free (choose explicit sets)
    ;; (These initial facts are part of the problem instance.)
    (gluten_free_bread bread2)
    (gluten_free_bread bread4)
    (gluten_free_bread bread6)

    (gluten_free_content content1)
    (gluten_free_content content3)
    (gluten_free_content content5)

    ;; Sandwich slots exist (identities) and start at kitchen; none have been created or consumed yet
    (sandwich_slot sandwich1) (at_sandwich sandwich1 kitchen)
    (sandwich_slot sandwich2) (at_sandwich sandwich2 kitchen)
    (sandwich_slot sandwich3) (at_sandwich sandwich3 kitchen)
    (sandwich_slot sandwich4) (at_sandwich sandwich4 kitchen)
    (sandwich_slot sandwich5) (at_sandwich sandwich5 kitchen)
    (sandwich_slot sandwich6) (at_sandwich sandwich6 kitchen)
    (sandwich_slot sandwich7) (at_sandwich sandwich7 kitchen)
    (sandwich_slot sandwich8) (at_sandwich sandwich8 kitchen)
    (sandwich_slot sandwich9) (at_sandwich sandwich9 kitchen)
    (sandwich_slot sandwich10) (at_sandwich sandwich10 kitchen)
    ;; note: sandwich_created and sandwich_consumed are false by default (not listed)

    ;; Children are at their tables
    (child_at child1 table1)
    (child_at child2 table2)
    (child_at child3 table3)
    (child_at child4 table4)
    (child_at child5 table5)
    (child_at child6 table6)
    (child_at child7 table7)

    ;; Allergic children (must receive gf sandwich)
    (child_allergic child1)
    (child_allergic child3)

    ;; No child initially served
    ;; (served ?ch) are false by default

    ;; Synchronization invariants implicit in initial state:
    ;; No sandwiches are on trays yet (no on_tray, no sandwich_on_tray)
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