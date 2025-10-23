(define (problem hanoi-8)
  (:domain hanoi)
  (:objects
    A B C D E F G H - disk
    left middle right - peg
  )

  (:init
    ;; Initial stacking on left peg, top -> bottom: A on B, B on C, ..., G on H, H on left
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H left)

    ;; Clear places: topmost disk A, and empty pegs middle and right
    (clear A)
    (clear middle)
    (clear right)

    ;; Size (smaller) relations: A < B < C < D < E < F < G < H
    ;; A is smaller than B..H
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H)
    ;; B is smaller than C..H
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H)
    ;; C is smaller than D..H
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    ;; D is smaller than E..H
    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    ;; E is smaller than F..H
    (smaller E F) (smaller E G) (smaller E H)
    ;; F is smaller than G,H
    (smaller F G) (smaller F H)
    ;; G is smaller than H
    (smaller G H)
  )

  (:goal
    (and
      ;; Goal: all disks stacked on right peg in same order (top->bottom: A,B,C,D,E,F,G,H)
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E F)
      (on F G)
      (on G H)
      (on H right)
    )
  )
)