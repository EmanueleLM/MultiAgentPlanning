(define (problem hanoi6)
  (:domain hanoi)
  (:objects
    A B C D E F - disk
    left middle right - peg
  )

  (:init
    ;; Initial tower on left, largest at bottom (F) up to smallest (A)
    (on F left)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; Clear supports: only the top disk (A) and the empty pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; Size relations: strictly smaller relations (A smallest, F largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  (:goal (and
    ;; Entire tower reassembled on right with same ordering: F bottom ... A top
    (on F right)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; Left and middle pegs empty (middle must be empty per specification)
    (clear left)
    (clear middle)
  ))
)