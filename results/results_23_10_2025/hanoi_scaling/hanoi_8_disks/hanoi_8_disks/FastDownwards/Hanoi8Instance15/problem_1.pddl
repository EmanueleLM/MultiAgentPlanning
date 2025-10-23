(define (problem Hanoi8Instance15)
  (:domain hanoi)
  (:objects
    A B C D E F G H - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on left (top -> bottom): A B C D E F G H
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H left)

    ;; top disk A is clear; empty pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering (A < B < C < D < E < F < G < H)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    (smaller E F) (smaller E G) (smaller E H)
    (smaller F G) (smaller F H)
    (smaller G H)
  )

  (:goal
    (and
      ;; entire stack moved to right (top -> bottom): A B C D E F G H
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E F)
      (on F G)
      (on G H)
      (on H right)

      ;; left and middle must be empty (no disks directly on them)
      (clear left)
      (clear middle)
    )
  )
)