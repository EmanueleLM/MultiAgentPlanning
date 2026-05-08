(define (problem sandwich-problem)
  (:domain sandwich-domain)

  (:objects
    chef - agent

    ;; trays
    t1 t2 t3 - tray

    ;; sandwiches (identifiers to be created/used)
    s1 s2 s3 s4 s5 s6 s7 s8 s9 - sandwich

    ;; bread portions
    b1 b2 b3 b4 b5 b6 b7 b8 b9 - bread_portion

    ;; content portions
    p1 p2 p3 p4 p5 p6 p7 p8 p9 - content_portion

    ;; children
    c1 c2 c3 c4 c5 c6 c7 c8 c9 - child

    ;; locations
    kitchen table1 table2 table3 - location
  )

  (:init
    ;; actor and tray locations
    (at chef kitchen)
    (at t1 kitchen) (at t2 kitchen) (at t3 kitchen)

    ;; trays initially empty (capacity slot model)
    (tray_free t1) (tray_free t2) (tray_free t3)

    ;; children locations (3 tables, 3 children per table)
    (at c1 table1) (at c2 table1) (at c3 table1)
    (at c4 table2) (at c5 table2) (at c6 table2)
    (at c7 table3) (at c8 table3) (at c9 table3)

    ;; allergies: three children allergic to gluten (ensure we provide gluten-free sandwiches for them)
    (child_allergic_gluten c1)
    (child_allergic_gluten c4)
    (child_allergic_gluten c7)

    ;; ingredient availability (one portion per intended sandwich)
    (has_bread b1) (has_bread b2) (has_bread b3) (has_bread b4) (has_bread b5) (has_bread b6) (has_bread b7) (has_bread b8) (has_bread b9)
    (has_content p1) (has_content p2) (has_content p3) (has_content p4) (has_content p5) (has_content p6) (has_content p7) (has_content p8) (has_content p9)

    ;; gluten-free markings on some portions to support allergic children
    (bread_gluten_free b1) (bread_gluten_free b4) (bread_gluten_free b7)
    (content_gluten_free p1) (content_gluten_free p4) (content_gluten_free p7)

    ;; no sandwiches exist yet (explicitly none of the exists_sandwich or on_tray or served predicates are true)
  )

  ;; Goal: every child c1..c9 must be served a distinct sandwich s1..s9 respectively.
  ;; The planner must create the sandwiches, place them onto trays, move trays to tables, and serve.
  (:goal (and
    (served c1 s1)
    (served c2 s2)
    (served c3 s3)
    (served c4 s4)
    (served c5 s5)
    (served c6 s6)
    (served c7 s7)
    (served c8 s8)
    (served c9 s9)
  ))
)