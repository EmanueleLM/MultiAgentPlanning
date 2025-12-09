(define (problem hanoi-6)
  (:domain tower-of-hanoi)

  (:objects
    A B C D E F - disk
    left middle right - peg
  )

  (:init
    ;; type predicates (explicit for verifier clarity)
    (disk A) (disk B) (disk C) (disk D) (disk E) (disk F)
    (peg left) (peg middle) (peg right)

    ;; initial stack on the left peg (F bottom ... A top)
    (on F left)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; top-of-object facts
    (clear A)        ;; top disk is A
    ;; left peg is not clear because it has F at bottom; do NOT include (clear left)
    (clear middle)   ;; middle peg empty
    (clear right)    ;; right peg empty

    ;; size ordering: A smallest, F largest
    ;; A smaller than B..F
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    ;; B smaller than C..F
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    ;; C smaller than D..F
    (smaller C D) (smaller C E) (smaller C F)
    ;; D smaller than E..F
    (smaller D E) (smaller D F)
    ;; E smaller than F
    (smaller E F)
  )

  (:goal (and
    ;; final stack must be entirely on left in correct order (F bottom -> A top)
    (on F left)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; middle and right pegs must be empty (enforced by their clear facts)
    (clear middle)
    (clear right)

    ;; top disk clearly must be A
    (clear A)
  ))
)