(define (problem blocksworld-prob2)
  (:domain blocksworld)
  (:objects red blue yellow orange - block)
  (:init
    (clear red)
    (clear blue)
    (handempty)
    (on red orange)
    (on blue yellow)
    (ontable orange)
    (ontable yellow)
  )
  (:goal
    (and
      (on red orange)
      (on blue red)
    )
  )
)