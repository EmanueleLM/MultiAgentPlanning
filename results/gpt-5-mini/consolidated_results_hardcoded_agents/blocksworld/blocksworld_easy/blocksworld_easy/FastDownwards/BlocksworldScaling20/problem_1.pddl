(define (problem blue-on-red-problem)
  (:domain block-world)
  (:objects
    red blue yellow orange - block
    s0 s1 s2 s3 s4 - step
  )
  (:init
    ;; initial stacked configuration: red on blue on yellow on orange on table
    (on red blue)
    (on blue yellow)
    (on yellow orange)
    (ontable orange)

    ;; clear predicates: only the top block is clear initially
    (clear red)
    (not (clear blue)) ; note: PDDL does not allow explicit (not ...) in :init, so we omit negative init facts

    ;; single-handedness
    (handempty)

    ;; stage progression: start at s0 and define successors s0->s1->s2->s3->s4
    (curr s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
  )
  (:goal
    (and
      ;; mandatory terminal configuration
      (on blue red)
      ;; require progression to final stage s4 (enforces ordered action sequence)
      (curr s4)
    )
  )
)