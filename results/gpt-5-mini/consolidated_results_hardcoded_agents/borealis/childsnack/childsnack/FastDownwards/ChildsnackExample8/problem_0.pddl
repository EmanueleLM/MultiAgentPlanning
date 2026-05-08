(define (problem serve-children-problem)
  (:domain sandwich-serving)

  (:objects
    ;; places
    kitchen table1 table2 table3 table4 table5 - place

    ;; trays
    tray1 tray2 tray3 - tray

    ;; tray slots (5 slots per tray = capacity 5)
    slot1_t1 slot2_t1 slot3_t1 slot4_t1 slot5_t1
    slot1_t2 slot2_t2 slot3_t2 slot4_t2 slot5_t2
    slot1_t3 slot2_t3 slot3_t3 slot4_t3 slot5_t3 - slot

    ;; breads and contents (10 each)
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 bread10 - bread
    content1 content2 content3 content4 content5 content6 content7 content8 content9 content10 - content

    ;; placeholders and sandwiches (13 placeholders)
    sp1 sp2 sp3 sp4 sp5 sp6 sp7 sp8 sp9 sp10 sp11 sp12 sp13 - placeholder
    sandwich1 sandwich2 sandwich3 sandwich4 sandwich5 sandwich6 sandwich7 sandwich8 sandwich9 sandwich10 sandwich11 sandwich12 sandwich13 - sandwich

    ;; children
    child1 child2 child3 child4 child5 child6 child7 child8 child9 child10 - child

    ;; agents
    chef1 - chef
    server1 - server
  )

  (:init
    ;; places declared implicitly by presence in objects

    ;; trays and initial tray state
    (tray tray1)
    (tray tray2)
    (tray tray3)
    (tray-at tray1 kitchen)
    (tray-at tray2 kitchen)
    (tray-at tray3 kitchen)
    (tray-pure tray1)
    (tray-pure tray2)
    (tray-pure tray3)
    (tray-capacity-implicit tray1)
    (tray-capacity-implicit tray2)
    (tray-capacity-implicit tray3)

    ;; slots ownership and all free initially
    (slot-of slot1_t1 tray1) (slot-of slot2_t1 tray1) (slot-of slot3_t1 tray1) (slot-of slot4_t1 tray1) (slot-of slot5_t1 tray1)
    (slot-of slot1_t2 tray2) (slot-of slot2_t2 tray2) (slot-of slot3_t2 tray2) (slot-of slot4_t2 tray2) (slot-of slot5_t2 tray2)
    (slot-of slot1_t3 tray3) (slot-of slot2_t3 tray3) (slot-of slot3_t3 tray3) (slot-of slot4_t3 tray3) (slot-of slot5_t3 tray3)

    (free-slot slot1_t1) (free-slot slot2_t1) (free-slot slot3_t1) (free-slot slot4_t1) (free-slot slot5_t1)
    (free-slot slot1_t2) (free-slot slot2_t2) (free-slot slot3_t2) (free-slot slot4_t2) (free-slot slot5_t2)
    (free-slot slot1_t3) (free-slot slot2_t3) (free-slot slot3_t3) (free-slot slot4_t3) (free-slot slot5_t3)

    ;; breads and contents at kitchen and available
    (bread bread1) (bread bread2) (bread bread3) (bread bread4) (bread bread5) (bread bread6) (bread bread7) (bread bread8) (bread bread9) (bread bread10)
    (content content1) (content content2) (content content3) (content content4) (content content5) (content content6) (content content7) (content content8) (content content9) (content content10)

    (at bread1 kitchen) (available-in-kitchen bread1)
    (at bread2 kitchen) (available-in-kitchen bread2)
    (at bread3 kitchen) (available-in-kitchen bread3)
    (at bread4 kitchen) (available-in-kitchen bread4)
    (at bread5 kitchen) (available-in-kitchen bread5)
    (at bread6 kitchen) (available-in-kitchen bread6)
    (at bread7 kitchen) (available-in-kitchen bread7)
    (at bread8 kitchen) (available-in-kitchen bread8)
    (at bread9 kitchen) (available-in-kitchen bread9)
    (at bread10 kitchen) (available-in-kitchen bread10)

    (at content1 kitchen) (available-in-kitchen content1)
    (at content2 kitchen) (available-in-kitchen content2)
    (at content3 kitchen) (available-in-kitchen content3)
    (at content4 kitchen) (available-in-kitchen content4)
    (at content5 kitchen) (available-in-kitchen content5)
    (at content6 kitchen) (available-in-kitchen content6)
    (at content7 kitchen) (available-in-kitchen content7)
    (at content8 kitchen) (available-in-kitchen content8)
    (at content9 kitchen) (available-in-kitchen content9)
    (at content10 kitchen) (available-in-kitchen content10)

    ;; gluten-free assignment: breads 1-5 and contents 1-5 are gluten-free
    (bread-is-gluten-free bread1) (bread-is-gluten-free bread2) (bread-is-gluten-free bread3) (bread-is-gluten-free bread4) (bread-is-gluten-free bread5)
    (content-is-gluten-free content1) (content-is-gluten-free content2) (content-is-gluten-free content3) (content-is-gluten-free content4) (content-is-gluten-free content5)

    ;; placeholders available and bound to canonical sandwich ids
    (placeholder sp1) (placeholder sp2) (placeholder sp3) (placeholder sp4) (placeholder sp5) (placeholder sp6) (placeholder sp7) (placeholder sp8) (placeholder sp9) (placeholder sp10) (placeholder sp11) (placeholder sp12) (placeholder sp13)
    (placeholder-available sp1) (placeholder-available sp2) (placeholder-available sp3) (placeholder-available sp4) (placeholder-available sp5) (placeholder-available sp6) (placeholder-available sp7) (placeholder-available sp8) (placeholder-available sp9) (placeholder-available sp10) (placeholder-available sp11) (placeholder-available sp12) (placeholder-available sp13)

    (placeholder-binds sp1 sandwich1) (placeholder-binds sp2 sandwich2) (placeholder-binds sp3 sandwich3) (placeholder-binds sp4 sandwich4) (placeholder-binds sp5 sandwich5)
    (placeholder-binds sp6 sandwich6) (placeholder-binds sp7 sandwich7) (placeholder-binds sp8 sandwich8) (placeholder-binds sp9 sandwich9) (placeholder-binds sp10 sandwich10) (placeholder-binds sp11 sandwich11) (placeholder-binds sp12 sandwich12) (placeholder-binds sp13 sandwich13)

    ;; children waiting locations (two per table)
    (child child1) (child child2) (child child3) (child child4) (child child5) (child child6) (child child7) (child child8) (child child9) (child child10)
    (waiting-at child1 table1) (waiting-at child2 table1)
    (waiting-at child3 table2) (waiting-at child4 table2)
    (waiting-at child5 table3) (waiting-at child6 table3)
    (waiting-at child7 table4) (waiting-at child8 table4)
    (waiting-at child9 table5) (waiting-at child10 table5)

    ;; specify some children as allergic to gluten (ensures some GF sandwiches needed)
    (child-allergic-gluten child1)
    (child-allergic-gluten child4)
    (child-allergic-gluten child7)

    ;; agents
    (chef chef1)
    (server server1)
  )

  ;; Goal: every child must be served (served flag true)
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