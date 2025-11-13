(define (problem S2)
  (:domain blocksworld)
  (:objects
    red blue orange yellow - block
  )
  (:init
    (handempty)
    (clear red)
    (clear orange)
    (on blue yellow)
    (on orange blue)
    (ontable red)
    (ontable yellow)
  )
  (:goal
    (and
      (on red orange)
      (on blue red)
    )
  )
)