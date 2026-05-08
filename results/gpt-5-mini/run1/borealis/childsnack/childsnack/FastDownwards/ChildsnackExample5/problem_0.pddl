(define (problem serve-nine-children)
  (:domain sandwich-serving)

  (:objects
    ;; agent
    chef - agent

    ;; bread portions
    b1 b2 b3 b4 b5 b6 b7 b8 b9 - bread_portion

    ;; content portions
    c1 c2 c3 c4 c5 c6 c7 c8 c9 - content_portion

    ;; sandwich identifiers (pool of 12 ids, initially unused)
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 - sandwich

    ;; trays (we use capacity=1 trays so each tray can carry one sandwich at a time)
    t1 t2 t3 t4 t5 t6 t7 t8 t9 - tray

    ;; children
    child1 child2 child3 child4 child5 child6 child7 child8 child9 - child

    ;; locations
    kitchen table1 table2 table3 table4 table5 table6 table7 table8 table9 - location
  )

  (:init
    ;; chef starts in kitchen
    (at_agent chef kitchen)

    ;; children locations: each child at their table
    (child_at child1 table1)
    (child_at child2 table2)
    (child_at child3 table3)
    (child_at child4 table4)
    (child_at child5 table5)
    (child_at child6 table6)
    (child_at child7 table7)
    (child_at child8 table8)
    (child_at child9 table9)

    ;; designate allergic children (hard constraints)
    ;; Let's mark child1, child2, child3 as allergic to gluten
    (child_allergic_to_gluten child1)
    (child_allergic_to_gluten child2)
    (child_allergic_to_gluten child3)
    ;; other children are non-allergic by absence of the predicate

    ;; bread and content availability (all nine portions available)
    (bread_available b1) (bread_available b2) (bread_available b3)
    (bread_available b4) (bread_available b5) (bread_available b6)
    (bread_available b7) (bread_available b8) (bread_available b9)

    (content_available c1) (content_available c2) (content_available c3)
    (content_available c4) (content_available c5) (content_available c6)
    (content_available c7) (content_available c8) (content_available c9)

    ;; mark some bread/content as gluten-free so allergic children can be served
    ;; make b1,b2,b3 and c1,c2,c3 gluten-free (sufficient for three allergic children)
    (bread_is_gluten_free b1) (bread_is_gluten_free b2) (bread_is_gluten_free b3)
    (content_is_gluten_free c1) (content_is_gluten_free c2) (content_is_gluten_free c3)

    ;; tray initial positions: all trays start in kitchen with one free slot each
    (tray_at t1 kitchen) (tray_has_slot t1)
    (tray_at t2 kitchen) (tray_has_slot t2)
    (tray_at t3 kitchen) (tray_has_slot t3)
    (tray_at t4 kitchen) (tray_has_slot t4)
    (tray_at t5 kitchen) (tray_has_slot t5)
    (tray_at t6 kitchen) (tray_has_slot t6)
    (tray_at t7 kitchen) (tray_has_slot t7)
    (tray_at t8 kitchen) (tray_has_slot t8)
    (tray_at t9 kitchen) (tray_has_slot t9)

    ;; connectivity: kitchen connected to every table (bidirectional)
    (location_connected kitchen table1) (location_connected table1 kitchen)
    (location_connected kitchen table2) (location_connected table2 kitchen)
    (location_connected kitchen table3) (location_connected table3 kitchen)
    (location_connected kitchen table4) (location_connected table4 kitchen)
    (location_connected kitchen table5) (location_connected table5 kitchen)
    (location_connected kitchen table6) (location_connected table6 kitchen)
    (location_connected kitchen table7) (location_connected table7 kitchen)
    (location_connected kitchen table8) (location_connected table8 kitchen)
    (location_connected kitchen table9) (location_connected table9 kitchen)

    ;; sandwich id pool: all ids unused at start
    (unused_sandwich_id s1) (unused_sandwich_id s2) (unused_sandwich_id s3)
    (unused_sandwich_id s4) (unused_sandwich_id s5) (unused_sandwich_id s6)
    (unused_sandwich_id s7) (unused_sandwich_id s8) (unused_sandwich_id s9)
    (unused_sandwich_id s10) (unused_sandwich_id s11) (unused_sandwich_id s12)
  )

  (:goal
    (and
      ;; require each child to be served (child_served is set by serve actions)
      (child_served child1)
      (child_served child2)
      (child_served child3)
      (child_served child4)
      (child_served child5)
      (child_served child6)
      (child_served child7)
      (child_served child8)
      (child_served child9)

      ;; final terminal condition: chef returns to kitchen (explicit terminal location requirement)
      (at_agent chef kitchen)
    )
  )
)