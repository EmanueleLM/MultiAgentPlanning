(define (problem multiagent-collect-problem)
  (:domain multiagent_collect)
  (:objects
    player1 player2
    vase1 spring1
    s0 s1 s2 s3
    room
    empty holding-vase1 holding-spring1
    smooth unknown
  )

  (:init
    ;; world objects
    (vase vase1)
    (spring spring1)

    ;; hand states: both hands start empty
    (hand player1 empty)
    (hand player2 empty)

    ;; cats are present in the room (enables sneeze action precondition)
    (cats room)

    ;; texture initially unknown
    (texture vase1 unknown)

    ;; timeline pointer: earliest available slot is s0 -> s1
    (next s0 s1)
  )

  ;; Goals: achieve the agents' stated objectives:
  ;; - player1 should have collected the vase1
  ;; - the vase1 should be made stupendous (player2's pressing of the spring)
  (:goal (and
    (collect player1 vase1)
    (stupendous vase1)
  ))
)