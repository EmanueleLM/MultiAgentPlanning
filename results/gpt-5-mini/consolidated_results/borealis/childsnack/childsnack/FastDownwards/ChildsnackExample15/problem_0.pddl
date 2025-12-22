(define (problem lunch-serving-problem)
  (:domain lunch-serving)
  (:objects
    ;; Staff
    chef - chef
    server - server

    ;; Children (14)
    child1 child2 child3 child4 child5 child6 child7 child8 child9 child10 child11 child12 child13 child14 - child

    ;; Trays (3)
    tray1 tray2 tray3 - tray

    ;; Bread portions (14)
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 bread10 bread11 bread12 bread13 bread14 - bread

    ;; Filling portions (14)
    fill1 fill2 fill3 fill4 fill5 fill6 fill7 fill8 fill9 fill10 fill11 fill12 fill13 fill14 - filling

    ;; Sandwich placeholders (14)
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 - sandwich

    ;; Locations
    kitchen table1 table2 table3 - location
  )

  (:init
    ;; Initial locations: chef and server at kitchen
    (at-staff chef kitchen)
    (at-staff server kitchen)

    ;; Trays start in the kitchen
    (at-tray tray1 kitchen)
    (at-tray tray2 kitchen)
    (at-tray tray3 kitchen)

    ;; Bread availability in kitchen
    (bread-available bread1) (bread-available bread2) (bread-available bread3) (bread-available bread4)
    (bread-available bread5) (bread-available bread6) (bread-available bread7) (bread-available bread8)
    (bread-available bread9) (bread-available bread10) (bread-available bread11) (bread-available bread12)
    (bread-available bread13) (bread-available bread14)

    ;; Filling availability in kitchen
    (filling-available fill1) (filling-available fill2) (filling-available fill3) (filling-available fill4)
    (filling-available fill5) (filling-available fill6) (filling-available fill7) (filling-available fill8)
    (filling-available fill9) (filling-available fill10) (filling-available fill11) (filling-available fill12)
    (filling-available fill13) (filling-available fill14)

    ;; Gluten-free markings on some bread portions (must be sufficient for allergic children)
    (bread-gf bread1)
    (bread-gf bread2)
    (bread-gf bread3)
    (bread-gf bread4)

    ;; Filling gluten-free markings (present but not required for allergy rule in this model)
    ;; (none are marked gf in this scenario; fields included to reflect audit data if present)

    ;; Sandwich placeholders available to be produced
    (sandwich-unused s1) (sandwich-unused s2) (sandwich-unused s3) (sandwich-unused s4)
    (sandwich-unused s5) (sandwich-unused s6) (sandwich-unused s7) (sandwich-unused s8)
    (sandwich-unused s9) (sandwich-unused s10) (sandwich-unused s11) (sandwich-unused s12)
    (sandwich-unused s13) (sandwich-unused s14)

    ;; Seating: distribute 14 children across 3 tables
    ;; Table1: children 1-5
    (seated-at child1 table1)
    (seated-at child2 table1)
    (seated-at child3 table1)
    (seated-at child4 table1)
    (seated-at child5 table1)

    ;; Table2: children 6-10
    (seated-at child6 table2)
    (seated-at child7 table2)
    (seated-at child8 table2)
    (seated-at child9 table2)
    (seated-at child10 table2)

    ;; Table3: children 11-14
    (seated-at child11 table3)
    (seated-at child12 table3)
    (seated-at child13 table3)
    (seated-at child14 table3)

    ;; Allergy flags (must be served only gluten-free sandwiches)
    ;; Four children are allergic in this scenario
    (child-allergic child2)
    (child-allergic child5)
    (child-allergic child9)
    (child-allergic child14)
  )

  (:goal (and
    (served child1) (served child2) (served child3) (served child4) (served child5)
    (served child6) (served child7) (served child8) (served child9) (served child10)
    (served child11) (served child12) (served child13) (served child14)
  ))
)