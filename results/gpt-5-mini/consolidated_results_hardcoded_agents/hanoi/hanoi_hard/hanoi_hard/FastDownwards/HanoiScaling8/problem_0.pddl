; Problem: six-disk Tower of Hanoi, all disks start on the middle peg.
; Comment: The user specification required six disks all stacked on the middle peg (peg-middle) with left and right empty,
; and the goal of all disks stacked on the right peg (peg-right) in correct order. All natural-language preferences were
; treated as hard constraints; no penalty or bookkeeping shortcuts were added.

(define (problem pddl_orchestrator-problem)
  (:domain pddl_orchestrator)

  (:objects
    d1 d2 d3 d4 d5 d6 - disk
    peg-left peg-middle peg-right - peg
  )

  (:init
    ; typing facts (optional but explicit)
    (disk d1) (disk d2) (disk d3) (disk d4) (disk d5) (disk d6)
    (peg peg-left) (peg peg-middle) (peg peg-right)

    ; initial stack: all six disks on the middle peg in order (d6 bottom ... d1 top)
    (on-peg d6 peg-middle)
    (on-disk d5 d6)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ; top-of-peg facts: top disk on the middle peg is d1; left and right are empty
    (top d1 peg-middle)
    (empty peg-left)
    (empty peg-right)
    ; peg-middle is not marked empty (no empty predicate for it)

    ; size ordering: smaller relations (strict). d1 < d2 < ... < d6
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6)
    (smaller d4 d5) (smaller d4 d6)
    (smaller d5 d6)
  )

  (:goal (and
    ; all six disks stacked on the right peg in correct order (d6 bottom, then d5, ..., d1 top)
    (on-peg d6 peg-right)
    (on-disk d5 d6)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ; explicitly enforce the top-of-peg fact for the final stack
    (top d1 peg-right)

    ; explicitly enforce that the left and middle pegs are empty in the terminal condition
    (empty peg-left)
    (empty peg-middle)
  ))
)