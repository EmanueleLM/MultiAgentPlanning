(define (problem problem-a)
  (:domain blocksworld)
  (:objects
    red blue orange yellow - block
    s0 s1 s2 s3 s4 - stage
  )
  (:init
    (clear red)
    (clear blue)
    (clear orange)
    (handempty)
    (on orange yellow)
    (on-table red)
    (on-table blue)
    (on-table yellow)
    (at s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
  )
  (:goal
    (and
      (on red blue)
      (on orange red)
      (at s4)
    )
  )
)