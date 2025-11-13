(define (problem S1)
  (:domain blocksworld)
  (:objects
    red blue orange yellow - block
  )
  (:init
    (handempty)
    (clear red)
    (on red blue)
    (on blue orange)
    (on orange yellow)
    (ontable yellow)
  )
  (:goal
    (and
      (on blue orange)
      (on orange yellow)
      (on yellow red)
    )
  )
)