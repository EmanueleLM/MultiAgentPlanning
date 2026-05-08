(define (problem child-snack-problem)
  (:domain child-snack)
  (:objects
    chef1 - chef
    server1 - server

    c1 c2 c3 c4 c5 c6 c7 c8 - child

    s1 s2 s3 s4 s5 s6 s7 s8 - sandwich

    kitchen dining_table - location
  )

  (:init
    ;; initial agent locations
    (at chef1 kitchen)
    (at server1 kitchen)

    ;; tray starts in kitchen
    (tray_at kitchen)

    ;; intended mapping: one sandwich assigned to each child
    (intended_for s1 c1)
    (intended_for s2 c2)
    (intended_for s3 c3)
    (intended_for s4 c4)
    (intended_for s5 c5)
    (intended_for s6 c6)
    (intended_for s7 c7)
    (intended_for s8 c8)

    ;; children that require gluten-free sandwiches - treated as hard constraints
    ;; (these are derived from the public initial information for this problem instance)
    (child_needs_no_gluten c2)
    (child_needs_no_gluten c5)
    (child_needs_no_gluten c7)

    ;; No sandwiches are made yet; no on_tray facts; no assembly_done.
  )

  (:goal
    (and
      ;; every intended sandwich has been served to its assigned child
      (served s1 c1)
      (served s2 c2)
      (served s3 c3)
      (served s4 c4)
      (served s5 c5)
      (served s6 c6)
      (served s7 c7)
      (served s8 c8)

      ;; final mandated terminal conditions:
      ;; chef remains at the kitchen, server and tray must be at the dining table
      (at chef1 kitchen)
      (at server1 dining_table)
      (tray_at dining_table)
    )
  )
)