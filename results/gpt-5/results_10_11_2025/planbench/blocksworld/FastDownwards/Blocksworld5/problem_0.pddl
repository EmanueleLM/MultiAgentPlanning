(define (problem s1)
  (:domain blocksworld)
  (:objects
    yellow - block
    red - block
    orange - block
    blue - block
  )
  (:init
    (clear yellow)
    (handempty)
    (on orange blue)
    (on red orange)
    (on yellow red)
    (ontable blue)
  )
  (:goal
    (and
      (on red blue)
      (on yellow orange)
    )
  )
)