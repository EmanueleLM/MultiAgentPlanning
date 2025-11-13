(define (problem problem-b)
  (:domain blocksworld)
  (:objects
    red blue orange yellow - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 - stage
  )
  (:init
    (clear blue)
    (clear orange)
    (handempty)
    (on blue yellow)
    (on orange red)
    (on-table red)
    (on-table yellow)
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
  (:goal
    (and
      (on red orange)
      (on yellow red)
      (at s8)
    )
  )
)