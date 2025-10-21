(define (problem bw-integrated-problem)
  (:domain blocksworld-integrated)
  (:objects
    blue orange yellow red - block
    player1 - agent
  )

  (:init
    ; Initial stacking as provided by player1
    (On blue orange)
    (On orange yellow)
    (On yellow red)
    (OnTable red)
    (Clear blue)
    (HandEmpty player1)
    ; No Holding(player1, ·) predicates are present in the initial state (closed world)
  )

  (:goal (and
    ; Goals reconciled to a consistent, solvable set (matches player1's requested goals)
    (On red orange)
    (On yellow red)
  ))
)