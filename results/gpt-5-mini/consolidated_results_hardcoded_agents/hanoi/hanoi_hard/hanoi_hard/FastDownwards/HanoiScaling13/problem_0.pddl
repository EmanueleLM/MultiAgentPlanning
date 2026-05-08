; Problem: Tower of Hanoi, 6 disks
; Name: hanoi6-right-to-middle
; Author: orchestrator
;
; Assumptions and decisions (conservative resolution of missing/partial input):
; - Disks are named d1..d6 with d1 the smallest and d6 the largest.
; - Pegs are named peg-left, peg-middle, peg-right.
; - Initial configuration: all six disks stacked on peg-right with d6 at bottom, then d5, ..., d1 at top.
; - Goal: reproduce the exact stack (same order) on peg-middle (d6 at bottom ... d1 at top).
; - No additional ordering beyond the legal Tower-of-Hanoi constraints is enforced.
; - Preferences expressed in natural language are treated as hard constraints (i.e., we require exact final stacking on peg-middle).
; - We do NOT introduce bookkeeping tokens, penalties, or post-hoc repair actions.
; - Two action types (move-to-disk and move-to-peg) are used so the planner cannot reorder alternative precondition branches.
; - All size relations (smaller) are fully expanded as static facts.
; - Terminal conditions (all on-relations and peg emptiness where mandated) are fixed in the goal.
;
; If an operator or auditor had provided a move sequence, it is not present here. No additional sequence constraints are imposed beyond legality.
; If a strict move sequence was required externally, it must be provided; otherwise the planner will produce any legal plan achieving the goal.

(:domain hanoi-domain)

(:objects
    d1 d2 d3 d4 d5 d6 - disk
    peg-left peg-middle peg-right - peg
)

(:init
    ; Type assertions (explicit)
    (disk? d1) (disk? d2) (disk? d3) (disk? d4) (disk? d5) (disk? d6)
    (peg? peg-left) (peg? peg-middle) (peg? peg-right)

    ; Initial stacking (right peg holds the full stack; bottom is d6)
    (on d6 peg-right)
    (on d5 d6)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ; Clear predicates: only top disk (d1) is clear; pegs left and middle are empty (clear), right is not clear
    (clear d1)
    (not (clear d2))
    (not (clear d3))
    (not (clear d4))
    (not (clear d5))
    (not (clear d6))

    (clear peg-left)
    (clear peg-middle)
    (not (clear peg-right))

    ; Static size relations: smaller di dj iff i < j
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6)
    (smaller d4 d5) (smaller d4 d6)
    (smaller d5 d6)
)

; Goal: all disks moved from peg-right to peg-middle in the same size order (d6 bottom ... d1 top)
(:goal
  (and
    ; final stacking on peg-middle
    (on d6 peg-middle)
    (on d5 d6)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ; enforce peg-left and peg-right are empty at termination, and peg-middle is occupied
    (clear peg-left)
    (clear peg-right)
    (not (clear peg-middle))

    ; top disk clear
    (clear d1)
    ; ensure lower disks are not clear (consistency with stacking)
    (not (clear d2))
    (not (clear d3))
    (not (clear d4))
    (not (clear d5))
    (not (clear d6))
  )
)