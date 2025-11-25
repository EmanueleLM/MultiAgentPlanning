(define (problem bw-problem-orange-on-blue)
  (:domain blocksworld)
  (:objects
    blue orange red yellow - block
    s0 s1 s2 s3 s4 - stage
  )
  (:init
    (on blue orange)
    (on orange red)
    (on red yellow)
    (ontable yellow)
    (clear blue)
    (handempty)

    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (current s0)
  )
  (:goal (and
    (on orange blue)
    (current s4)
  ))
)