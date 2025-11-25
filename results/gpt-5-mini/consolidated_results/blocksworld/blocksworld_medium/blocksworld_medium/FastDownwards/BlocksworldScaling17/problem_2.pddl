(define (problem BlocksworldScaling17-problem)
  (:domain BlocksworldScaling17)
  (:objects
    blue red yellow orange - block
    S0 S1 S2 S3 S4 S5 S6 S7 S8 - time
  )

  (:init
    ;; Initial block configuration (from specification)
    (clear blue)
    (clear orange)
    (handempty)
    (on red yellow)
    (on orange red)
    (ontable blue)
    (ontable yellow)

    ;; Time progression: start at S0 and enforce successor ordering
    (at S0)
    (next S0 S1)
    (next S1 S2)
    (next S2 S3)
    (next S3 S4)
    (next S4 S5)
    (next S5 S6)
    (next S6 S7)
    (next S7 S8)
  )

  ;; Goal: enforce the final stacked configuration at the terminal time S8.
  (:goal (and
    (on red blue)
    (on orange red)
    (on yellow orange)
    (at S8)
  ))
)