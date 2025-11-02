(define (problem hanoi-problem)
  (:domain hanoi)

  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ;; initial on relationships (top -> bottom)
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-peg  G left)

    ;; initial clear facts (only top disk and empty pegs are clear)
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ;; size ordering (A is smallest, G largest). All strict pairs.
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal
    (and
      ;; Goal: entire stack moved to right in same order top->bottom A..G
      (on-disk A B)
      (on-disk B C)
      (on-disk C D)
      (on-disk D E)
      (on-disk E F)
      (on-disk F G)
      (on-peg  G right)
    )
  )
)