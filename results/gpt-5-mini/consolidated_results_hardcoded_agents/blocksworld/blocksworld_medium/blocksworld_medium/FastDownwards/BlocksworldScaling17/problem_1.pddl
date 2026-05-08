(define (problem BlocksworldScaling17-problem)
  (:domain BlocksworldScaling17)
  (:objects
    blue red yellow orange - block
    S0 S1 S2 S3 S4 S5 S6 S7 S8 - stage
  )

  (:init
    ;; Initial block configuration (as provided)
    (clear blue)
    (clear orange)
    (handempty)
    (on red yellow)
    (on orange red)
    (ontable blue)
    (ontable yellow)

    ;; Stage progression: start at S0
    (stage S0)
    (next S0 S1)
    (next S1 S2)
    (next S2 S3)
    (next S3 S4)
    (next S4 S5)
    (next S5 S6)
    (next S6 S7)
    (next S7 S8)
  )

  ;; Goal requires the specified final stack configuration to be true
  ;; at the designated final stage S8 to enforce ordered stage progression.
  (:goal (and
    (on red blue)
    (on orange red)
    (on yellow orange)
    (stage S8)
  ))
)