(define (problem pddl_orchestrator-problem)
  (:domain pddl_orchestrator)

  (:objects
    d1 d2 d3 d4 d5 d6 - disk
    peg-left peg-middle peg-right - peg
  )

  (:init
    ; initial stack on peg-middle: bottom d6, then d5, d4, d3, d2, top d1
    (on-peg d6 peg-middle)
    (on-disk d5 d6)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ; top and emptiness facts for initial state
    (top d1 peg-middle)
    (empty peg-left)
    (empty peg-right)

    ; size ordering: d1 < d2 < ... < d6
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6)
    (smaller d4 d5) (smaller d4 d6)
    (smaller d5 d6)
  )

  (:goal (and
    ; all six disks stacked on the right peg in correct order (d6 bottom ... d1 top)
    (on-peg d6 peg-right)
    (on-disk d5 d6)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ; top-of-peg fact for the final stack and emptiness requirements
    (top d1 peg-right)
    (empty peg-left)
    (empty peg-middle)
  ))
)