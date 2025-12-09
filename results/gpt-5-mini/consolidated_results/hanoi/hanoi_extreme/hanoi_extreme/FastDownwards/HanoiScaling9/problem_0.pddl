(define (problem hanoi-7-problem)
  (:domain tower-of-hanoi-7)
  (:objects
    mover_agent - agent
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ;; Agent present
    (agent mover_agent)

    ;; Initial stack on middle peg (top -> bottom: A, B, C, D, E, F, G)
    ;; Representation: A is immediately on B, B on C, ..., F on G, G on middle.
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G middle)

    ;; Clear places: top-most objects and empty pegs only
    (clear A)        ;; A is top of the stack, nothing on A
    (clear left)     ;; left peg is empty
    (clear right)    ;; right peg is empty

    ;; Size ordering: smaller disk relations (strict)
    ;; A is smallest, G is largest. We enumerate all ordered pairs i < j as (smaller i j).
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal
    (and
      ;; Final stack on right peg (top -> bottom: A, B, C, D, E, F, G)
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E F)
      (on F G)
      (on G right)

      ;; Enforce pegs left and middle empty in the terminal condition
      (clear left)
      (clear middle)
    )
  )
)