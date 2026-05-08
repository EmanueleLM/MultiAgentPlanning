(define (problem prob-snack)
  (:domain child-snack)
  (:objects
    ;; children
    child1 child2 child3 child4 child5 child6 child7 child8 child9 - child
    ;; bread portions
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 - bread-portion
    ;; content portions
    content1 content2 content3 content4 content5 content6 content7 content8 content9 - content-portion
    ;; sandwiches (placeholders)
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 sandw12 - sandwich
    ;; trays
    tray1 tray2 tray3 - tray
    ;; places (kitchen is a constant in the domain, do not redeclare it here)
    table1 table2 table3 - place
  )

  (:init
    ;; Ingredient availability (all in kitchen initially)
    (bread-available bread1) (bread-available bread2) (bread-available bread3)
    (bread-available bread4) (bread-available bread5) (bread-available bread6)
    (bread-available bread7) (bread-available bread8) (bread-available bread9)

    (content-available content1) (content-available content2) (content-available content3)
    (content-available content4) (content-available content5) (content-available content6)
    (content-available content7) (content-available content8) (content-available content9)

    ;; Gluten-free markers
    (bread-gf bread6) (bread-gf bread2) (bread-gf bread7)
    (content-gf content9) (content-gf content4) (content-gf content5)

    ;; Sandwich placeholders unused initially
    (sandwich-unused sandw1) (sandwich-unused sandw2) (sandwich-unused sandw3)
    (sandwich-unused sandw4) (sandwich-unused sandw5) (sandwich-unused sandw6)
    (sandwich-unused sandw7) (sandwich-unused sandw8) (sandwich-unused sandw9)
    (sandwich-unused sandw10) (sandwich-unused sandw11) (sandwich-unused sandw12)

    ;; Trays start in the kitchen (kitchen is a domain constant)
    (tray-at tray1 kitchen) (tray-at tray2 kitchen) (tray-at tray3 kitchen)

    ;; Children waiting locations
    (waiting child1 table3)
    (waiting child2 table1)
    (waiting child3 table3)
    (waiting child4 table1)
    (waiting child5 table1)
    (waiting child6 table1)
    (waiting child7 table3)
    (waiting child8 table2)
    (waiting child9 table2)

    ;; Allergies
    (allergic-gluten child2)
    (allergic-gluten child3)
    (allergic-gluten child9)

    ;; No sandwiches exist, none are on trays, none served — these are implicit from absence of facts.
    ;; The planner will create sandwiches using make_sandwich / make_sandwich_no_gluten,
    ;; assign them to children via assigned-for, load them onto trays, move trays, and serve.

    ;; NOTE: The following mapping is intended and must be realized by the planner using the make_* actions:
    ;;  child2 (table1, allergic)  <- sandw2  (must be GF)
    ;;  child3 (table3, allergic)  <- sandw3  (must be GF)
    ;;  child9 (table2, allergic)  <- sandw1  (must be GF)
    ;;  child1 (table3)            <- sandw4  (non-GF)
    ;;  child4 (table1)            <- sandw5  (non-GF)
    ;;  child5 (table1)            <- sandw6  (non-GF)
    ;;  child6 (table1)            <- sandw7  (non-GF)
    ;;  child7 (table3)            <- sandw8  (non-GF)
    ;;  child8 (table2)            <- sandw9  (non-GF)
    ;;
    ;; The move_tray_* actions require the specified sandwiches to be loaded on the respective trays
    ;; before the tray may leave the kitchen, enforcing the load-before-move ordering as a hard constraint.
  )

  (:goal (and
    (served child1) (served child2) (served child3) (served child4) (served child5)
    (served child6) (served child7) (served child8) (served child9)

    ;; Final tray locations must match the serving assignment (hard terminal condition).
    (tray-at tray1 table1)
    (tray-at tray2 table3)
    (tray-at tray3 table2)
  ))