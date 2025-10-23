(define (problem hanoi-problem)
  (:domain hanoi)
  (:objects) ; constants are declared in the domain
  (:init
    ;; Initial stacking on left peg: bottom F, then E, D, C, B, top A
    (on F left)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; Clear facts: only top disk A is clear; middle and right pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; Size order (smaller relation). A is smallest, F largest.
    ;; Include all pairs where first is smaller than second (transitive closure).
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  (:goal (and
    ;; Final stacking on right peg: bottom F, then E, D, C, B, top A
    (on F right)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
  ))
)