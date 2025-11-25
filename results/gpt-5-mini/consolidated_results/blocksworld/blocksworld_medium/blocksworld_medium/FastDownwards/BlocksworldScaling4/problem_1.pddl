(define (problem blocks-world-problem)
  (:domain blocks-world)
  (:objects
    red orange blue yellow - block
    s0 s1 s2 s3 s4 s5 s6 - stage
  )
  (:init
    ;; Blocks world initial configuration
    (handempty)
    (clear red)
    (clear orange)
    (on red yellow)
    (on orange blue)
    (ontable blue)
    (ontable yellow)

    ;; Stage initial and successor chain (explicit discrete time steps)
    (at-stage s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)

    ;; Explicit inequality facts to forbid self-stacking/identity in actions
    (neq red orange) (neq red blue) (neq red yellow)
    (neq orange red) (neq orange blue) (neq orange yellow)
    (neq blue red) (neq blue orange) (neq blue yellow)
    (neq yellow red) (neq yellow orange) (neq yellow blue)
  )
  ;; Goal requires both the structural block relation and reaching the final stage.
  (:goal (and (on red yellow) (on yellow orange) (at-stage s6)))
)