(define (problem prob-snack)
  (:domain child-snack)
  (:objects
    ;; children
    child1 child2 child3 child4 child5 child6 child7 - child

    ;; bread and content portions
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 - bread_portion
    content1 content2 content3 content4 content5 content6 content7 - content_portion

    ;; trays
    tray1 tray2 - tray

    ;; places (kitchen is a domain constant, do not re-declare it here)
    table1 table2 table3 - place

    ;; tray slots (capacity: tray1 has 4 slots, tray2 has 3 slots = 7 total)
    slot_t1_1 slot_t1_2 slot_t1_3 slot_t1_4 - tray_slot
    slot_t2_1 slot_t2_2 slot_t2_3 - tray_slot

    ;; sandwiches (identities available to be created)
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 - sandwich

    ;; explicit ordered stages for tray progression (s0 .. s10)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - stage
  )

  (:init
    ;; Tray initial locations
    (at_tray tray1 kitchen)
    (at_tray tray2 kitchen)

    ;; Tray initial stage (both start at s0)
    (tray_stage tray1 s0)
    (tray_stage tray2 s0)

    ;; Stage ordering (simple successor chain)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)

    ;; Tray slots: belong to trays and are free
    (is_tray_slot slot_t1_1) (slot_of slot_t1_1 tray1) (slot_free slot_t1_1)
    (is_tray_slot slot_t1_2) (slot_of slot_t1_2 tray1) (slot_free slot_t1_2)
    (is_tray_slot slot_t1_3) (slot_of slot_t1_3 tray1) (slot_free slot_t1_3)
    (is_tray_slot slot_t1_4) (slot_of slot_t1_4 tray1) (slot_free slot_t1_4)

    (is_tray_slot slot_t2_1) (slot_of slot_t2_1 tray2) (slot_free slot_t2_1)
    (is_tray_slot slot_t2_2) (slot_of slot_t2_2 tray2) (slot_free slot_t2_2)
    (is_tray_slot slot_t2_3) (slot_of slot_t2_3 tray2) (slot_free slot_t2_3)

    ;; Bread and content portions located in kitchen initially
    (at_bread bread1 kitchen) (at_bread bread2 kitchen) (at_bread bread3 kitchen)
    (at_bread bread4 kitchen) (at_bread bread5 kitchen) (at_bread bread6 kitchen)
    (at_bread bread7 kitchen)

    (at_content content1 kitchen) (at_content content2 kitchen) (at_content content3 kitchen)
    (at_content content4 kitchen) (at_content content5 kitchen) (at_content content6 kitchen)
    (at_content content7 kitchen)

    ;; Gluten-free annotations (as specified)
    (gluten_free_bread bread2)
    (gluten_free_bread bread6)

    (gluten_free_content content3)
    (gluten_free_content content7)

    ;; Sandwich identity slots initially not existing (must be created by make actions)
    (notexist sandw1) (notexist sandw2) (notexist sandw3) (notexist sandw4) (notexist sandw5)
    (notexist sandw6) (notexist sandw7) (notexist sandw8) (notexist sandw9) (notexist sandw10)

    ;; Children waiting locations (as specified)
    (waiting child1 table2)
    (waiting child2 table1)
    (waiting child3 table3)
    (waiting child4 table2)
    (waiting child5 table1)
    (waiting child6 table1)
    (waiting child7 table2)

    ;; Allergies (as specified)
    (child_allergic child1)
    (child_allergic child5)
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