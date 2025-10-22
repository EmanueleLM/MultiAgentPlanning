(define (problem hanoi-6)
  (:domain hanoi)
  (:objects
    A B C D E F - disk
    peg-left peg-mid peg-right - peg
  )
  (:init
    ;; place typing is implicit through use of pegs and disks in predicates

    ;; Size ordering: A smallest, F largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)

    ;; Initial stack on left peg: F bottom, then E, D, C, B, A top
    (on F peg-left)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; Clear status: only top disk A and empty pegs peg-mid and peg-right are clear
    (clear A)
    (clear peg-mid)
    (clear peg-right)

    ;; Peg-left is not clear initially (it has disks on it) — do not assert (clear peg-left)
    ;; Disks other than A are not clear (they have a disk on top) — do not assert clear for them
  )

  (:goal
    (and
      ;; All disks moved to right peg preserving ordering: F bottom ... A top
      (on F peg-right)
      (on E F)
      (on D E)
      (on C D)
      (on B C)
      (on A B)
    )
  )
)