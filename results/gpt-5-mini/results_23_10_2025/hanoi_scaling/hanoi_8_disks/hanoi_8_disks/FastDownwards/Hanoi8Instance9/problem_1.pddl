(define (problem hanoi-8)
  (:domain hanoi)
  (:objects
    A B C D E F G H - disk
    left middle right - peg
    ;; declare disks and pegs also as places by listing them as place-typed objects in init via typing conventions
    ;; (The domain declared types place disk peg; objects above are typed as disk or peg and can be used where place is expected.)
  )

  (:init
    ;; Initial stacking on left peg, top -> bottom: A on B, B on C, C on D, D on E, E on F, F on G, G on H, H on left
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H left)

    ;; Clear: topmost disk A is clear; middle and right pegs are empty and therefore clear.
    (clear A)
    (clear middle)
    (clear right)

    ;; Size (smaller) relations: A < B < C < D < E < F < G < H
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