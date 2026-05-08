(define (problem serve_13_children)
  (:domain child_snack)

  (:objects
    ;; children
    child1 child2 child3 child4 child5 child6 child7 child8 child9 child10 child11 child12 child13 - child

    ;; trays
    tray1 tray2 tray3 - tray

    ;; places (three tables plus kitchen)
    table1 table2 table3 kitchen - place

    ;; bread and content portions
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 bread10 bread11 bread12 bread13 - bread
    content1 content2 content3 content4 content5 content6 content7 content8 content9 content10 content11 content12 content13 - content

    ;; sandwich placeholders
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 - sandwich
  )

  (:init
    ;; Children locations (distributed across three tables)
    (at_child child1 table1)
    (at_child child2 table1)
    (at_child child3 table1)
    (at_child child4 table1)
    (at_child child5 table1)

    (at_child child6 table2)
    (at_child child7 table2)
    (at_child child8 table2)
    (at_child child9 table2)

    (at_child child10 table3)
    (at_child child11 table3)
    (at_child child12 table3)
    (at_child child13 table3)

    ;; Initial tray locations
    (at_tray tray1 kitchen)
    (at_tray tray2 table1)
    (at_tray tray3 table2)

    ;; All breads and contents are initially available
    (bread_available bread1) (bread_available bread2) (bread_available bread3) (bread_available bread4)
    (bread_available bread5) (bread_available bread6) (bread_available bread7) (bread_available bread8)
    (bread_available bread9) (bread_available bread10) (bread_available bread11) (bread_available bread12)
    (bread_available bread13)

    (content_available content1) (content_available content2) (content_available content3) (content_available content4)
    (content_available content5) (content_available content6) (content_available content7) (content_available content8)
    (content_available content9) (content_available content10) (content_available content11) (content_available content12)
    (content_available content13)

    ;; Gluten-free ingredient annotations
    ;; breads 1-4 are gluten-free
    (bread_glutenfree bread1) (bread_glutenfree bread2) (bread_glutenfree bread3) (bread_glutenfree bread4)
    ;; contents 1-4 are gluten-free
    (content_glutenfree content1) (content_glutenfree content2) (content_glutenfree content3) (content_glutenfree content4)

    ;; Allergic children: these four children must receive GF sandwiches
    (child_allergic child2)
    (child_allergic child5)
    (child_allergic child8)
    (child_allergic child11)

    ;; All children initially unserved
    (child_unserved child1) (child_unserved child2) (child_unserved child3) (child_unserved child4) (child_unserved child5)
    (child_unserved child6) (child_unserved child7) (child_unserved child8) (child_unserved child9) (child_unserved child10)
    (child_unserved child11) (child_unserved child12) (child_unserved child13)

    ;; All sandwich placeholders are initially free (can be used)
    (sandwich_free s1) (sandwich_free s2) (sandwich_free s3) (sandwich_free s4) (sandwich_free s5)
    (sandwich_free s6) (sandwich_free s7) (sandwich_free s8) (sandwich_free s9) (sandwich_free s10)
    (sandwich_free s11) (sandwich_free s12) (sandwich_free s13) (sandwich_free s14) (sandwich_free s15)
    (sandwich_free s16) (sandwich_free s17)
  )

  (:goal
    (and
      (served child1) (served child2) (served child3) (served child4) (served child5)
      (served child6) (served child7) (served child8) (served child9) (served child10)
      (served child11) (served child12) (served child13)
    )
  )
)