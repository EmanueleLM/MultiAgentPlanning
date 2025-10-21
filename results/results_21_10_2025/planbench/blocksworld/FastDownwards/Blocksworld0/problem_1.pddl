; Scenario: block_player1 initial state and goal (from first agent)
(define (problem bw-p1)
  (:domain blocksworld-multiagent)
  (:objects
    red blue yellow orange - block
  )
  (:init
    ; initial configuration as provided by block_player1
    (on blue orange)
    (ontable red)
    (ontable orange)
    (ontable yellow)
    (clear red)
    (clear blue)
    (clear yellow)
    (handempty)
  )
  (:goal (and
    (on orange blue)
  ))
)