(define (problem hanoi6-problem)
  (:domain hanoi)
  (:objects) ; constants declared in domain

  (:init
    ;; Initial stack on left peg (top -> bottom): A B C D E F
    ;; Represented bottom-up as: F on left, E on F, D on E, C on D, B on C, A on B
    (on F left)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; Clear facts: top disk A is clear; middle and right pegs are empty (clear)
    (clear A)
    (clear middle)
    (clear right)

    ;; Size ordering (static): A is smallest, F largest.
    ;; Include all strict pairs (transitive closure).
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  (:goal (and
    ;; Goal stacking on right peg: top->bottom A B C D E F
    ;; Represented as bottom-up on relations:
    (on F right)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
  ))
)