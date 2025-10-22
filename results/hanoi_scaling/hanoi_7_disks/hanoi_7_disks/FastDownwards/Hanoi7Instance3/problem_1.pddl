(define (problem Hanoi7Instance3-problem)
  (:domain hanoi7instance3)
  (:objects
    A B C D E F G - disk
    left middle right - peg
    left_peg middle_peg right_peg orchestrator - agent
  )
  (:init
    ;; initial stack on left: top A, then B, C, D, E, F, bottom G on peg left
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-peg  G left)

    ;; top/clear facts: A is top of its peg (nothing on A)
    (clear-disk A)
    ;; other disks are not asserted as clear (by omission)
    ;; peg occupancy: middle and right are empty initially
    (clear-peg middle)
    (clear-peg right)
    ;; left peg is not asserted clear (it has disks)

    ;; agent controls as required by the JSON specification
    (controls left_peg left)
    (controls middle_peg middle)
    (controls right_peg right)
    ;; orchestrator is present as an agent but controls no peg (no controls fact for it)

    ;; size (static) relations: smaller(X,Y) for every strictly smaller disk X than Y
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  ;; Goal: same stacked relations but with the bottom disk G on the right peg.
  ;; Note: we assert the stack structure (A on B, B on C, ..., F on G) and that G is on-peg right.
  ;; The explicit ordering (top→bottom A..G) is encoded by the on-disk chain plus on-peg for G.
  (:goal (and
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-peg  G right)
  ))
)