(define (problem bw-player2-goal)
  (:domain blocks-world)
  (:objects
    red blue yellow orange - block
  )
  (:init
    ;; Initial configuration (from player2's given state)
    (on red yellow)
    (on yellow blue)
    (on blue orange)
    (ontable orange)
    (clear red)
    (handempty)
  )
  (:goal (and
    (on red blue)
    (on blue yellow)
    (on yellow orange)
  ))
)