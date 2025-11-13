(define (problem blocksworld-prob1)
  (:domain blocksworld)
  (:objects red blue yellow orange - block)
  (:init
    (clear orange)
    (clear yellow)
    (handempty)
    (on blue red)
    (on yellow blue)
    (ontable red)
    (ontable orange)
  )
  (:goal
    (and
      (on blue yellow)
      (on yellow orange)
    )
  )
)