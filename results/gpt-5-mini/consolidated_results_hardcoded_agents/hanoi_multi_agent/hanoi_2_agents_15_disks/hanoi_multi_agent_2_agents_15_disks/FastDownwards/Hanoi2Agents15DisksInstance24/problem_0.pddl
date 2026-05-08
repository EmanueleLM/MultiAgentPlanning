(define (problem hanoi_two_agent_p1)
  (:domain tower_hanoi_two_agent)
  (:objects
    A - disk
    peg1 peg2 peg3 - peg
    agent1 agent2 - agent
  )
  (:init
    ;; initial disk placement (the only disk)
    (on A peg1)
    (top peg1 A)

    ;; empty pegs
    (empty peg2)
    (empty peg3)

    ;; primitive move provided by agent1: move disk A from peg1 to peg3
    (allowed_move agent1 A peg1 peg3)

    ;; No allowed_move facts for agent2 (agent2 cannot move any disks)
    ;; No smaller relations are needed for a single-disk instance.
  )
  (:goal (and
    (on A peg3)
  ))
)