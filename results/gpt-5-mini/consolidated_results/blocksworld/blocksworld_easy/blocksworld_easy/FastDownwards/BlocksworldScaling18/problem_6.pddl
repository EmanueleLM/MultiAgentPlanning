(define (problem blocks-instance-staged)
  (:domain blocks-world-staged)
  (:objects
    blue orange red yellow - block
    s0 s1 s2 s3 s4 - stage
  )
  (:init
    ;; Block configuration (initial)
    (on blue red)
    (on orange yellow)
    (ontable red)
    (ontable yellow)
    (clear blue)
    (clear orange)
    (handempty)

    ;; Stage/time structure (static successor relation)
    (current s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
  )
  (:goal (and
    (on blue red)
    (on yellow orange)
  ))
)