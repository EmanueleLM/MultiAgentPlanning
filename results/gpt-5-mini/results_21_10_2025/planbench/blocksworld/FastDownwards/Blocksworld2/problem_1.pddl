(define (problem bw-integrated-problem)
  (:domain blocksworld-integrated)
  (:objects
    blue orange yellow red - block
    player1 - agent
  )

  (:init
    ;; Initial stacking chosen to represent player1's described scenario:
    (On blue orange)
    (On orange yellow)
    (On yellow red)
    (OnTable red)
    (Clear blue)
    (HandEmpty player1)
  )

  (:goal (and
    ;; Goals selected to verify player1's requested target configuration
    (On red orange)
    (On yellow red)
  ))
)