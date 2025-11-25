(define (problem hanoi-4-disks-left-to-right)
  (:domain hanoi)

  (:objects
    A B C D left middle right
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15
    - obj
  )

  (:init
    ;; object kinds
    (disk A) (disk B) (disk C) (disk D)
    (peg left) (peg middle) (peg right)

    ;; Stage/time structure: explicit ordered stages s0 -> s1 -> ... -> s15
    (stage s0) (stage s1) (stage s2) (stage s3) (stage s4)
    (stage s5) (stage s6) (stage s7) (stage s8) (stage s9)
    (stage s10) (stage s11) (stage s12) (stage s13) (stage s14) (stage s15)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)
    (current s0)

    ;; Initial stack on left peg: bottom D on left, then C on D, then B on C, then A on B
    (on D left)
    (on C D)
    (on B C)
    (on A B)

    ;; Clear/top facts: A is top of the left stack; middle and right pegs empty
    (clear A)
    (clear middle)
    (clear right)

    ;; Size ordering (explicit)
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)
  )

  (:goal (and
    ;; All disks stacked on the right peg (from bottom to top: D, C, B, A)
    (on D right)
    (on C D)
    (on B C)
    (on A B)

    ;; Hard constraint: left and middle pegs must be empty (pegs must be clear)
    (clear left)
    (clear middle)

    ;; Terminal stage must be reached exactly (ensures plan occupies contiguous stages)
    (current s15)
  ))
)