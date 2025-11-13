(define (problem blocksworld12-s1)
  (:domain blocksworld12)
  (:objects
    red blue orange yellow - block
  )
  (:init
    (clear orange)
    (clear yellow)
    (handempty)
    (on orange blue)
    (on yellow red)
    (ontable red)
    (ontable blue)
  )
  (:goal
    (and
      (on red blue)
    )
  )
)