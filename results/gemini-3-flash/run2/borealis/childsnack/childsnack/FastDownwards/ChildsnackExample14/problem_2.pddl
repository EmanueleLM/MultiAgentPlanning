(define (problem prob-snack)
  (:domain child-snack)
  (:objects
    table1 table2 table3 - place
    tray1 tray2 tray3 - tray
    bread3 bread5 bread8 bread10 bread11 - gf-bread
    bread1 bread2 bread4 bread6 bread7 bread9 bread12 bread13 - reg-bread
    content3 content7 content9 content11 content12 - gf-content
    content1 content2 content4 content5 content6 content8 content10 content13 - reg-content
    child1 child2 child3 child11 child12 - allergic-child
    child4 child5 child6 child7 child8 child9 child10 child13 - non-allergic-child
    sandw1 sandw2 sandw3 sandw4 sandw5 - gf-sandwich
    sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 sandw12 sandw13 - reg-sandwich
  )
  (:init
    (at tray1 kitchen) (at tray2 kitchen) (at tray3 kitchen)
    (at bread1 kitchen) (at bread2 kitchen) (at bread3 kitchen) (at bread4 kitchen) (at bread5 kitchen)
    (at bread6 kitchen) (at bread7 kitchen) (at bread8 kitchen) (at bread9 kitchen) (at bread10 kitchen)
    (at bread11 kitchen) (at bread12 kitchen) (at bread13 kitchen)
    (at content1 kitchen) (at content2 kitchen) (at content3 kitchen) (at content4 kitchen) (at content5 kitchen)
    (at content6 kitchen) (at content7 kitchen) (at content8 kitchen) (at content9 kitchen) (at content10 kitchen)
    (at content11 kitchen) (at content12 kitchen) (at content13 kitchen)
    (waiting child1 table3) (waiting child11 table3) (waiting child12 table3)
    (waiting child2 table2) (waiting child3 table2) (waiting child5 table2) (waiting child6 table2) (waiting child8 table2) (waiting child13 table2)
    (waiting child4 table1) (waiting child7 table1) (waiting child9 table1) (waiting child10 table1)
  )
  (:goal
    (and
      (served child1) (served child2) (served child3) (served child4) (served child5)
      (served child6) (served child7) (served child8) (served child9) (served child10)
      (served child11) (served child12) (served child13)
    )
  )
)