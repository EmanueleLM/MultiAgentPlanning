(define (problem hanoi-five-instance)
  (:domain hanoi-five)
  (:objects
    A B C D E - disk
    left middle right - peg
  )

  (:init
    ; Initial stacking on left peg: bottom E, then D, then C, then B, then A (A is top)
    (on E left)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ; Clear facts: only the top disk (A) and empty pegs (middle, right) are clear initially
    (clear A)
    (clear middle)
    (clear right)

    ; Size ordering facts: A < B < C < D < E
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)

    ; allow-place is a static relation encoding: a disk may be placed on any peg,
    ; and a disk may be placed on another disk only if it is smaller than that disk.
    ; Disk -> peg (all allowed)
    (allow-place A left) (allow-place A middle) (allow-place A right)
    (allow-place B left) (allow-place B middle) (allow-place B right)
    (allow-place C left) (allow-place C middle) (allow-place C right)
    (allow-place D left) (allow-place D middle) (allow-place D right)
    (allow-place E left) (allow-place E middle) (allow-place E right)

    ; Disk -> disk allowed only when smaller relation holds
    (allow-place A B) (allow-place A C) (allow-place A D) (allow-place A E)
    (allow-place B C) (allow-place B D) (allow-place B E)
    (allow-place C D) (allow-place C E)
    (allow-place D E)
  )

  ; Goal: move the entire tower from left peg to right peg preserving order:
  ; bottom E on right, then D on E, then C on D, then B on C, then A on B.
  (:goal (and
    (on E right)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
  ))
)