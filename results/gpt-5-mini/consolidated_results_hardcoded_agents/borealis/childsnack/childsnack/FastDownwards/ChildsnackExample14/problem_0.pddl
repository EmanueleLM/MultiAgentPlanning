(define (problem child-snack-problem)
  (:domain child-snack)

  ;; Objects (use provided ranges)
  (:objects
    ;; places
    kitchen table1 table2 table3 - place

    ;; agents
    chef1 server1 - agent

    ;; trays
    tray1 tray2 tray3 - tray

    ;; breads (13)
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 bread10 bread11 bread12 bread13 - bread

    ;; contents (13)
    content1 content2 content3 content4 content5 content6 content7 content8 content9 content10 content11 content12 content13 - content

    ;; sandwiches (17 slots)
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 sandw12 sandw13 sandw14 sandw15 sandw16 sandw17 - sandwich

    ;; children (3)
    child1 child2 child3 - child
  )

  ;; Initial state
  (:init
    ;; Agent locations
    (at-agent chef1 kitchen)
    (at-agent server1 kitchen)

    ;; Trays start in kitchen
    (tray-at tray1 kitchen)
    (tray-at tray2 kitchen)
    (tray-at tray3 kitchen)

    ;; Breads: all available and located in kitchen
    (available-bread bread1) (at-bread bread1 kitchen)
    (available-bread bread2) (at-bread bread2 kitchen)
    (available-bread bread3) (at-bread bread3 kitchen)
    (available-bread bread4) (at-bread bread4 kitchen)
    (available-bread bread5) (at-bread bread5 kitchen)
    (available-bread bread6) (at-bread bread6 kitchen)
    (available-bread bread7) (at-bread bread7 kitchen)
    (available-bread bread8) (at-bread bread8 kitchen)
    (available-bread bread9) (at-bread bread9 kitchen)
    (available-bread bread10) (at-bread bread10 kitchen)
    (available-bread bread11) (at-bread bread11 kitchen)
    (available-bread bread12) (at-bread bread12 kitchen)
    (available-bread bread13) (at-bread bread13 kitchen)

    ;; Contents: all available and located in kitchen
    (available-content content1) (at-content content1 kitchen)
    (available-content content2) (at-content content2 kitchen)
    (available-content content3) (at-content content3 kitchen)
    (available-content content4) (at-content content4 kitchen)
    (available-content content5) (at-content content5 kitchen)
    (available-content content6) (at-content content6 kitchen)
    (available-content content7) (at-content content7 kitchen)
    (available-content content8) (at-content content8 kitchen)
    (available-content content9) (at-content content9 kitchen)
    (available-content content10) (at-content content10 kitchen)
    (available-content content11) (at-content content11 kitchen)
    (available-content content12) (at-content content12 kitchen)
    (available-content content13) (at-content content13 kitchen)

    ;; Gluten-free labels (choose subset so at least one GF sandwich possible)
    ;; breads 1-3 are gluten-free
    (bread-gf bread1)
    (bread-gf bread2)
    (bread-gf bread3)
    ;; contents 1-3 are gluten-free
    (content-gf content1)
    (content-gf content2)
    (content-gf content3)

    ;; All sandwich slots free initially
    (sandwich-slot-free sandw1) (sandwich-slot-free sandw2) (sandwich-slot-free sandw3)
    (sandwich-slot-free sandw4) (sandwich-slot-free sandw5) (sandwich-slot-free sandw6)
    (sandwich-slot-free sandw7) (sandwich-slot-free sandw8) (sandwich-slot-free sandw9)
    (sandwich-slot-free sandw10) (sandwich-slot-free sandw11) (sandwich-slot-free sandw12)
    (sandwich-slot-free sandw13) (sandwich-slot-free sandw14) (sandwich-slot-free sandw15)
    (sandwich-slot-free sandw16) (sandwich-slot-free sandw17)

    ;; Children waiting at tables
    (child-waits-at child1 table1)
    (child-waits-at child2 table2)
    (child-waits-at child3 table3)

    ;; Allergies
    (allergic-to-gluten child1) ;; child1 must be served gluten-free sandwich
    ;; child2 and child3 are not allergic (no predicate)

    ;; No sandwiches exist yet; no staged-for-tray; no on-tray
    ;; consumed predicates not present initially
  )

  ;; Goal: all children served
  (:goal (and
    (child-served child1)
    (child-served child2)
    (child-served child3)
  ))
)