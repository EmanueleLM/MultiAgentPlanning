(define (problem hanoi-two-agents)
  (:domain hanoi-multiagent)
  (:objects
    agent_1 agent_2 - agent
    d1 d2 d3       - disk
    pegA pegB pegC - peg
  )
  (:init
    ;; initial stacking: all disks on pegA (d3 bottom, d2 middle, d1 top)
    (on d3 pegA)
    (on d2 d3)
    (on d1 d2)

    ;; clear places: top disk and empty pegs
    (clear d1)
    (clear pegB)
    (clear pegC)

    ;; size ordering (smallest -> largest)
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d2 d3)

    ;; agent private capabilities (only facts provided about who may move which disk)
    ;; Agent 1 may move the two smaller disks
    (can-move agent_1 d1)
    (can-move agent_1 d2)
    ;; Agent 2 may move the largest disk
    (can-move agent_2 d3)
  )
  (:goal (and
    ;; goal: entire tower moved to pegC with correct ordering
    (on d3 pegC)
    (on d2 d3)
    (on d1 d2)
  ))
)