(define (problem stack-red-on-orange)
  (:domain blocks-world-agent)
  (:objects
    agent1 - agent
    red orange blue - block
  )
  (:init
    ;; initial block placements
    (on-table red)
    (on-table orange)
    (on-table blue)

    ;; initial clear status
    (clear red)
    (clear orange)
    (clear blue)

    ;; initial hand status
    (handempty agent1)
  )
  (:goal (and
           ;; mandated terminal conditions:
           ;; red must be on orange, the agent's hand must be empty,
           ;; and red must be clear (no block on top of red)
           (on red orange)
           (handempty agent1)
           (clear red)
         )
  )
)