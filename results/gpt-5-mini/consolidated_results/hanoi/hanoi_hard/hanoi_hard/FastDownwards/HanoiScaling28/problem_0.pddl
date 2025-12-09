(define (problem hanoi-6-problem)
  (:domain hanoi-6)

  (:objects
    A B C D E F - disk
    left middle right - peg
  )

  (:init
    ;; size ordering (A smallest, F largest) -- static facts
    ;; A smaller than B,C,D,E,F
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    ;; B smaller than C,D,E,F
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    ;; C smaller than D,E,F
    (smaller C D) (smaller C E) (smaller C F)
    ;; D smaller than E,F
    (smaller D E) (smaller D F)
    ;; E smaller than F
    (smaller E F)

    ;; initial stack on the right peg top->bottom: A on B on C on D on E on F on right
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-peg F right)

    ;; top and clear facts consistent with the above stacking
    (clear A)
    (not-initial-fact-will-be-false B) ; placeholder comment — PDDL does not allow negative facts; absence implies false

    ;; topmost disk on right peg is A
    (top A right)

    ;; pegs left and middle are empty initially
    (peg-empty left)
    (peg-empty middle)

    ;; right peg is not empty (absence of peg-empty right)
    ;; sequencing/coordination flags
    (state-reported)
    (audited)

    ;; At start there is no active suggestion; suggestion-active is false by absence.
    ;; There are no suggested(...) facts.
  )

  ;; The goal: all disks transferred to middle peg preserving order A (top) -> ... -> F (bottom),
  ;; and left and right pegs empty. The goal fixes the final immediate-support relations and top.
  (:goal (and
    ;; stack structure on middle peg: A on B, B on C, C on D, D on E, E on F, F on-peg middle
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-peg F middle)

    ;; top-of-middle is A
    (top A middle)

    ;; left and right pegs empty
    (peg-empty left)
    (peg-empty right)
  ))

  (:metric minimize 0)
)