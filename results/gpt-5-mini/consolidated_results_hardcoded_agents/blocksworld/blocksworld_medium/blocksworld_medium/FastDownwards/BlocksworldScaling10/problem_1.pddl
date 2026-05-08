(define (problem blocksworld-scaling10-problem)
  (:domain blocksworld-scaling10-domain)
  (:objects
    red blue yellow orange - block
  )
  (:init
    (on red blue)
    (on blue yellow)
    (on yellow orange)
    (ontable orange)
    (clear red)
    (handempty)
  )
  (:goal
    (and
      (on yellow red)
    )
  )
)