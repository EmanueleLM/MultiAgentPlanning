(define (problem blocksworld4-s1)
  (:domain blocksworld)
  (:objects
    red blue orange yellow - block
    hand - hand
  )
  (:init
    (clear orange)
    (clear yellow)
    (handempty)
    (on blue red)
    (on orange blue)
    (ontable red)
    (ontable yellow)
  )
  (:goal (and
    (on blue red)
    (on yellow orange)
  ))
)