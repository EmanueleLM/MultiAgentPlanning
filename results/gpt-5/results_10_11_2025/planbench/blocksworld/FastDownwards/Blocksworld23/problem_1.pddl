(define (problem blocksworld-scn-A)
  (:domain blocksworld)
  (:objects red blue yellow orange - block)
  (:init
    (clear red)
    (handempty)
    (on red blue)
    (on blue yellow)
    (on yellow orange)
    (ontable orange)
  )
  (:goal
    (and
      (on orange red)
      (on yellow blue)
    )
  )
)