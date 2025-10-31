(define (problem blocksworld7_scenario1)
  (:domain blocksworld7)
  (:objects red blue yellow orange - block)
  (:init
    ; initial positions
    (on blue orange)
    (ontable orange)
    (ontable red)
    (ontable yellow)

    ; clear & hand state as provided
    (clear blue)
    (clear red)
    (clear yellow)
    (handempty)
  )
  (:goal (and
    (on red blue)
    (on blue yellow)
    (on yellow orange)
  ))
)