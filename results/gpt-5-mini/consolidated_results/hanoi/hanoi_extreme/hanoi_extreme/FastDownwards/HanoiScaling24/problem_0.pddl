(define (problem hanoi-7)
  (:domain tower-of-hanoi-7)
  (:objects
    ;; disks (A smallest ... G largest)
    A B C D E F G - disk
    ;; pegs
    left middle right - peg
    ;; note: peg and disk are subtypes of place (declared in domain typing)
  )

  (:init
    ;; initial direct-support relations (topmost A down to bottom G on peg middle)
    ;; representation: support ?d ?s where ?s is the object directly under ?d
    (support A B)
    (support B C)
    (support C D)
    (support D E)
    (support E F)
    (support F G)
    (support G middle)

    ;; on-peg membership: every disk initially belongs to the middle peg's stack
    (on-peg A middle)
    (on-peg B middle)
    (on-peg C middle)
    (on-peg D middle)
    (on-peg E middle)
    (on-peg F middle)
    (on-peg G middle)

    ;; only the topmost disk is clear at the start
    (clear A)

    ;; left and right pegs are empty initially, middle is not empty (not asserted)
    (empty left)
    (empty right)

    ;; size ordering: smaller facts derived from sizes A=1..G=7 (explicit ground facts)
    ;; all pairs (X,Y) with size(X) < size(Y)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal (and
    ;; final stack: all disks on right peg with the same support chain orientation
    ;; A on B, B on C, ..., F on G, G on right
    (support A B)
    (support B C)
    (support C D)
    (support D E)
    (support E F)
    (support F G)
    (support G right)

    ;; all disks belong to the right peg's stack
    (on-peg A right)
    (on-peg B right)
    (on-peg C right)
    (on-peg D right)
    (on-peg E right)
    (on-peg F right)
    (on-peg G right)

    ;; auxiliary pegs must be empty at the end
    (empty left)
    (empty middle)
  ))
)