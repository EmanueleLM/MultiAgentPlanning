(define (problem stack-blue-yellow)
  (:domain block-stacking)

  (:objects
    red blue yellow orange table s0 s1 s2 s3 s4 - obj
  )

  (:init
    (on red yellow)
    (on blue orange)
    (on orange table)
    (on yellow table)

    (clear red)
    (clear blue)

    (handempty)

    (at s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
  )

  (:goal (and
    (on blue orange)
    (on yellow blue)
    (at s4)
  ))
)