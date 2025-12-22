(define (problem serve-children)
  (:domain sandwich-serving)

  (:objects
    ;; breads
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 - bread
    ;; contents
    content1 content2 content3 content4 content5 content6 content7 content8 content9 - content
    ;; sandwiches (placeholders)
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 sandw12 - sandwich
    ;; trays
    tray1 tray2 tray3 - tray
    ;; tables (including kitchen as a location)
    kitchen table1 table2 table3 - table
    ;; children
    child1 child2 child3 child4 child5 child6 child7 child8 child9 - child
  )

  (:init
    ;; Bread and content availability and locations (all in kitchen initially)
    (bread-available bread1) (at-bread bread1 kitchen)
    (bread-available bread2) (at-bread bread2 kitchen)
    (bread-available bread3) (at-bread bread3 kitchen)
    (bread-available bread4) (at-bread bread4 kitchen)
    (bread-available bread5) (at-bread bread5 kitchen)
    (bread-available bread6) (at-bread bread6 kitchen)
    (bread-available bread7) (at-bread bread7 kitchen)
    (bread-available bread8) (at-bread bread8 kitchen)
    (bread-available bread9) (at-bread bread9 kitchen)

    (content-available content1) (at-content content1 kitchen)
    (content-available content2) (at-content content2 kitchen)
    (content-available content3) (at-content content3 kitchen)
    (content-available content4) (at-content content4 kitchen)
    (content-available content5) (at-content content5 kitchen)
    (content-available content6) (at-content content6 kitchen)
    (content-available content7) (at-content content7 kitchen)
    (content-available content8) (at-content content8 kitchen)
    (content-available content9) (at-content content9 kitchen)

    ;; Gluten-free markers (as specified)
    (bread-gf bread2) (bread-gf bread6) (bread-gf bread7)
    (content-gf content9) (content-gf content4) (content-gf content5)

    ;; Sandwich placeholders are unused initially
    (sandwich-unused sandw1) (sandwich-unused sandw2) (sandwich-unused sandw3)
    (sandwich-unused sandw4) (sandwich-unused sandw5) (sandwich-unused sandw6)
    (sandwich-unused sandw7) (sandwich-unused sandw8) (sandwich-unused sandw9)
    (sandwich-unused sandw10) (sandwich-unused sandw11) (sandwich-unused sandw12)

    ;; Trays initially in kitchen
    (tray-at tray1 kitchen) (tray-at tray2 kitchen) (tray-at tray3 kitchen)

    ;; Fixed tray-to-table assignment for this serving run (hard constraint)
    (tray-assigned tray1 table1)
    (tray-assigned tray2 table3)
    (tray-assigned tray3 table2)

    ;; Children locations (waiting at tables)
    (child-at child1 table3)
    (child-at child2 table1)
    (child-at child3 table3)
    (child-at child4 table1)
    (child-at child5 table1)
    (child-at child6 table1)
    (child-at child7 table3)
    (child-at child8 table2)
    (child-at child9 table2)

    ;; Allergies: child2, child3, child9 are gluten-allergic
    (allergic child2)
    (allergic child3)
    (allergic child9)

    ;; Preassigned mapping of which sandwich will be created for which child.
    ;; The chef fragment specified specific ingredient pairings for sandw1..sandw9.
    ;; We enforce creation of those pairs for the intended children by the planner via actions.
    ;; (Mapping below indicates which sandwich placeholder should be created for each child.)
    ;; child-to-sandwich assignment (will be actualized by 'make' actions which set assigned-for)
    ;; Planned assignment:
    ;;  - child2 (allergic, table1)  <- sandw2  (bread6 + content5)  GF
    ;;  - child3 (allergic, table3)  <- sandw3  (bread7 + content9)  GF
    ;;  - child9 (allergic, table2)  <- sandw1  (bread2 + content4)  GF
    ;;  - child1 (table3)            <- sandw4  (bread1 + content1)  non-GF
    ;;  - child4 (table1)            <- sandw5  (bread3 + content2)  non-GF
    ;;  - child5 (table1)            <- sandw6  (bread4 + content3)  non-GF
    ;;  - child6 (table1)            <- sandw7  (bread5 + content6)  non-GF
    ;;  - child7 (table3)            <- sandw8  (bread8 + content7)  non-GF
    ;;  - child8 (table2)            <- sandw9  (bread9 + content8)  non-GF
    ;;
    ;; Note: these assignments will be created by the planner using the corresponding make_* actions.
    ;; No direct initial (assigned-for) facts are asserted here; creation actions will add them.

    ;; For clarity: initial state contains no sandwich-exists, no sandwich-on-tray, no served facts.
  )

  (:goal (and
    ;; All nine children served with sandwiches safe for their allergies
    (served child1) (served child2) (served child3) (served child4) (served child5)
    (served child6) (served child7) (served child8) (served child9)

    ;; Tray final positions must match the fixed assignment (hard constraint)
    (tray-at tray1 table1)
    (tray-at tray2 table3)
    (tray-at tray3 table2)
  ))