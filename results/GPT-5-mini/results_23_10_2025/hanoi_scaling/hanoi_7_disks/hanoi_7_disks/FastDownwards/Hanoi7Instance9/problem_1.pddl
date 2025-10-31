(define (problem hanoi7-instance9)
  (:domain hanoi)
  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ;; Initial stack on left: top-to-bottom A,B,C,D,E,F,G
    ;; We encode the direct support relation: each disk is directly on the place below it
    (on A left)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)
    (on G F)

    ;; Clear predicates: top disk A is clear (nothing on top), empty pegs are clear only if nothing is directly on them.
    (clear A)
    ;; middle and right pegs have no disks initially and are clear
    (clear middle)
    (clear right)

    ;; Size ordering (static): A is smallest, G largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal
    (and
      ;; Goal: entire stack top-to-bottom A,B,C,D,E,F,G on the right peg
      (on A right)
      (on B A)
      (on C B)
      (on D C)
      (on E D)
      (on F E)
      (on G F)

      ;; left and middle pegs empty (no disk directly on them)
      ;; These are entailed by the above stacking facts, but included explicitly for clarity.
      (not (on A left))
      (not (on B left))
      (not (on C left))
      (not (on D left))
      (not (on E left))
      (not (on F left))
      (not (on G left))

      (not (on A middle))
      (not (on B middle))
      (not (on C middle))
      (not (on D middle))
      (not (on E middle))
      (not (on F middle))
      (not (on G middle))
    )
  )
)