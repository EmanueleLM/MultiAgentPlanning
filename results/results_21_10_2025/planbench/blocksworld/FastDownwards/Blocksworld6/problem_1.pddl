(define (problem bw-player2-goal)
  (:domain blocks-world)
  (:objects
    red blue yellow orange - block
  )
  (:init
    ;; Player2's initial state
    (on blue orange)
    (ontable red)
    (ontable yellow)
    (ontable orange)
    (clear red)
    (clear blue)
    (clear yellow)
    (handempty)
  )
  (:goal (and
    (on red blue)
    (on blue yellow)
    (on yellow orange)
  ))
)