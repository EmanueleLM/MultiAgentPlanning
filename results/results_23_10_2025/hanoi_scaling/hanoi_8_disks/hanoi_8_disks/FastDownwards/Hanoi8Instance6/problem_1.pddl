(define (problem hanoi8-problem)
  (:domain hanoi8)
  (:objects
    left middle right - peg
    A B C D E F G H - disk
  )

  (:init
    ;; initial emptiness: middle and right are empty; left is not empty (has disks)
    (empty middle)
    (empty right)

    ;; initial stack on left peg, bottom -> top:
    ;; bottom H is directly on the peg
    (on-peg H left)
    ;; above H: G on H, F on G, ..., A on B (A is top)
    (on-disk G H)
    (on-disk F G)
    (on-disk E F)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)
    ;; top marker
    (top-of-peg A left)

    ;; global, static size relations (A smallest, H largest)
    (smaller-than A B) (smaller-than A C) (smaller-than A D) (smaller-than A E)
    (smaller-than A F) (smaller-than A G) (smaller-than A H)

    (smaller-than B C) (smaller-than B D) (smaller-than B E)
    (smaller-than B F) (smaller-than B G) (smaller-than B H)

    (smaller-than C D) (smaller-than C E) (smaller-than C F)
    (smaller-than C G) (smaller-than C H)

    (smaller-than D E) (smaller-than D F) (smaller-than D G) (smaller-than D H)

    (smaller-than E F) (smaller-than E G) (smaller-than E H)

    (smaller-than F G) (smaller-than F H)

    (smaller-than G H)
  )

  (:goal
    (and
      ;; full stack on right: bottom H .. top A
      (on-peg H right)
      (on-disk G H)
      (on-disk F G)
      (on-disk E F)
      (on-disk D E)
      (on-disk C D)
      (on-disk B C)
      (on-disk A B)
      (top-of-peg A right)
    )
  )
)