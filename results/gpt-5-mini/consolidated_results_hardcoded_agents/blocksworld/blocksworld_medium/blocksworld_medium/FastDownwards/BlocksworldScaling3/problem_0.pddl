(define (problem blocks-instance-3)
  (:domain blocks-world)
  (:objects A B C - block)
  (:init
    ;; Initial configuration:
    ;; A is on B, B is on C, C is on the table.
    (on A B)
    (on B C)
    (ontable C)

    ;; Clear and hand status derived from the above
    (clear A)
    ;; B and C are not clear in the initial state (no explicit negative facts in PDDL; effects/actions enforce deletions)
    (handempty)
    ;; No block is held initially; holding facts absent
  )

  ;; Goal: final configuration must be exactly:
  ;; A on table, B on A, C on B (i.e., stack C on B on A on table),
  ;; and the robot arm must be empty and top block must be clear.
  (:goal (and
    (ontable A)
    (on B A)
    (on C B)
    (clear C)
    (handempty)
  ))
)