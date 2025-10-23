(define (problem bw-example)
  (:domain blocks-world-multiagent)
  (:objects
    a b c table - block
    agent1 - agent
  )
  (:init
    ;; initial placements (assumed)
    (on a table)
    (on b table)
    (on c a)

    ;; clear/top statuses
    (clear b)
    (clear c)
    ;; a is not clear initially because c is on a

    ;; agent initial state
    (handempty agent1)
  )
  (:goal (and
    ;; final arrangement after the assumed executed sequence: unstack c from a, then stack c on b
    (on c b)
    (on b table)
    (on a table)

    ;; resulting clear and agent states (hard constraints)
    (clear c)
    (clear a)
    (handempty agent1)
  ))
)