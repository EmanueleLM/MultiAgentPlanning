(define (problem child-snack-problem)
  (:domain child-snack)

  (:objects
    chef1 - chef
    server1 - server
    tray1 - tray
    kitchen table - location
    c1 c2 c3 c4 c5 c6 c7 c8 - child
    s1 s2 s3 s4 s5 s6 s7 s8 - sandwich
  )

  (:init
    ; initial agent/objects locations
    (at chef1 kitchen)
    (at server1 kitchen)
    (at-tray tray1 kitchen)

    ; all children are seated at the table
    (child-at c1 table)
    (child-at c2 table)
    (child-at c3 table)
    (child-at c4 table)
    (child-at c5 table)
    (child-at c6 table)
    (child-at c7 table)
    (child-at c8 table)

    ; dietary constraints (strict: these children must receive gluten-free sandwiches)
    (requires-no-gluten c2)
    (requires-no-gluten c5)

    ; sandwich assignments: each sandwich is intended for one child
    (sandwich-for s1 c1)
    (sandwich-for s2 c2)
    (sandwich-for s3 c3)
    (sandwich-for s4 c4)
    (sandwich-for s5 c5)
    (sandwich-for s6 c6)
    (sandwich-for s7 c7)
    (sandwich-for s8 c8)

    ; No sandwiches are made yet (absence of (made ...) and (gluten-free ...) is intentional)
  )

  (:goal (and
    (served c1)
    (served c2)
    (served c3)
    (served c4)
    (served c5)
    (served c6)
    (served c7)
    (served c8)
  ))
)