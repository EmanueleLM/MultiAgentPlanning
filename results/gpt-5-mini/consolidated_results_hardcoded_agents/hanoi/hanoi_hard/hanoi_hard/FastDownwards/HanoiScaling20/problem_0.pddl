(define (problem hanoi-6)
  (:domain hanoi)
  (:objects
    A B C D E F - disk
    left middle right - peg
  )
  (:init
    ; immediate support chain (top-to-bottom on right: A,B,C,D,E,F)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F right)

    ; top disks and peg emptiness
    (top right A)
    (empty left)
    (empty middle)

    ; belonging: all disks initially belong to the right peg
    (belongs A right)
    (belongs B right)
    (belongs C right)
    (belongs D right)
    (belongs E right)
    (belongs F right)

    ; size ordering: strictly smaller relations (A < B < C < D < E < F)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)

    ; hand resource to serialize moves (optional; required by actions)
    (hand_free)
  )

  (:goal (and
    ; final immediate support chain on middle peg: A on B, B on C, ..., F on middle
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F middle)

    ; final pegs empty as required
    (empty left)
    (empty right)

    ; ensure the top of middle is A (explicitly)
    (top middle A)
  ))
)