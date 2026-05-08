(define (problem BlocksworldScaling17-problem)
  (:domain BlocksworldScaling17)
  (:objects
    blue red yellow orange - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 - time
  )

  (:init
    ;; Initial block configuration (as specified)
    (clear blue)
    (clear orange)
    (handempty)
    (on red yellow)
    (on orange red)
    (ontable blue)
    (ontable yellow)

    ;; Time progression: start at s0 and enforce successor ordering
    (at s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)
    (next s7 s8)
  )

  ;; Goal: enforce the final stacked configuration at the terminal time s8.
  (:goal (and
    (on red blue)
    (on orange red)
    (on yellow orange)
    (at s8)
  ))
)