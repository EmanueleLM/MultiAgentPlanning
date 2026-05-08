(define (problem blue-on-red-problem)
  (:domain block-world)
  (:objects
    blue red - block
  )
  (:init
    ;; initial spatial relations
    (ontable blue)
    (ontable red)
    (clear blue)
    (clear red)

    ;; single-handedness bookkeeping
    (handempty)
  )
  (:goal
    (and
      ;; mandated terminal condition: blue must be on top of red
      (on blue red)
      ;; enforce that the hand is empty at the terminal state (no outstanding holds)
      (handempty)
    )
  )
)