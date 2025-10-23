(define (problem hanoi-8)
  (:domain hanoi)
  (:objects
    A B C D E F G H left middle right - obj
  )
  (:init
    ;; object types
    (disk A) (disk B) (disk C) (disk D) (disk E) (disk F) (disk G) (disk H)
    (peg left) (peg middle) (peg right)

    ;; initial stack on left peg (H bottom ... A top)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H left)

    ;; clear objects: top disk A and the two empty pegs
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering: smaller X Y means X is strictly smaller than Y
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    (smaller E F) (smaller E G) (smaller E H)
    (smaller F G) (smaller F H)
    (smaller G H)
  )

  ;; Goal: replicate the complete stack on the right peg (same order)
  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H right)
  ))
)