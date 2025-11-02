(define (problem hanoi-6)
  (:domain hanoi-domain)
  (:objects
    A B C D E F - disk
    left middle right - peg
    left_agent middle_agent right_agent - agent
  )

  (:init
    ;; Initial stack on left: top -> bottom A, B, C, D, E, F
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F left)

    ;; Clear/top facts: A is top of stack; middle and right pegs are empty (clear).
    (clear A)
    (clear middle)
    (clear right)

    ;; Peg left is not clear initially because F is on it (so no (clear left) fact).

    ;; Size ordering (smaller)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)

    ;; Agent-to-peg representation (peg agents)
    (represents left_agent left)
    (represents middle_agent middle)
    (represents right_agent right)
  )

  (:goal (and
    ;; Goal: entire stack moved to right peg, top -> bottom A, B, C, D, E, F
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F right)
  ))
)