(define (problem hanoi-2agent-4disks)
  (:domain hanoi-two-agent)

  (:objects
    ; disks (A smallest .. D largest)
    A B C D
    ; base tokens (one per peg) act as immovable largest support items
    base-left base-middle base-right
    ; pegs
    left middle right
    ; agents (kept in objects for completeness; actions are encoded with agent id in name)
    agent1 agent2
  )

  (:init
    ; All disks start on the left peg (their peg association)
    (at A left)
    (at B left)
    (at C left)
    (at D left)

    ; Base tokens are at their pegs
    (at base-left left)
    (at base-middle middle)
    (at base-right right)

    ; Immediate-support (direct "above" chain) for the starting stack on left:
    ; A is immediately above B, B above C, C above D, D above the base token of left peg.
    (above A B)
    (above B C)
    (above C D)
    (above D base-left)

    ; The top items on pegs:
    (top left A)
    (top middle base-middle)
    (top right base-right)

    ; Clear-on-top facts: only items with nothing above them are clear initially.
    (clear A)
    (clear base-middle)
    (clear base-right)

    ; Static size ordering (smaller relations).
    ; Disks: A < B < C < D
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)

    ; Disks are smaller than the base tokens (bases act as largest supports)
    (smaller A base-left) (smaller A base-middle) (smaller A base-right)
    (smaller B base-left) (smaller B base-middle) (smaller B base-right)
    (smaller C base-left) (smaller C base-middle) (smaller C base-right)
    (smaller D base-left) (smaller D base-middle) (smaller D base-right)
  )

  ;; Goal: all disks moved to the right peg with same stacking order (A on B on C on D on base-right)
  (:goal (and
    (at A right)
    (at B right)
    (at C right)
    (at D right)

    (above A B)
    (above B C)
    (above C D)
    (above D base-right)

    (top right A)
  ))