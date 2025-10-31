(define (problem multiagent-collect-problem)
  (:domain multiagent_collect)
  (:objects
    player1 player2 - agent
    vase1 spring1 empty - object
    s0 s1 s2 s3 - slot
    room - location
    smooth unknown - texture
  )
  (:init
    (vase vase1)
    (spring spring1)
    (hand player1 empty)
    (hand player2 empty)
    (cats room)
    (texture vase1 unknown)
    (next s0 s1)
  )
  (:goal (and
    (collect player1 vase1)
    (stupendous vase1)
  ))
)