(define (problem hanoi-3pegs-8disks)
  (:domain hanoi)
  (:objects
    A B C D E F G H - disk
  )

  (:init
    ;; stack top->bottom on left: A on B, B on C, ..., G on H, H on left
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H left)

    ;; top-of-stack markers
    (clear A)
    (clear middle)
    (clear right)

    ;; peg membership: all disks initially belong to left peg
    (at A left) (at B left) (at C left) (at D left)
    (at E left) (at F left) (at G left) (at H left)

    ;; size ordering: smaller X Y means X is smaller than Y
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    (smaller E F) (smaller E G) (smaller E H)
    (smaller F G) (smaller F H)
    (smaller G H)
  )

  (:goal (and
    ;; same stacked order on right (top->bottom A..H)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H right)

    ;; membership: all disks belong to right peg
    (at A right) (at B right) (at C right) (at D right)
    (at E right) (at F right) (at G right) (at H right)

    ;; other pegs empty (clear)
    (clear left)
    (clear middle)
  )))