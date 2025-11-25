(define (problem hanoi-4-staged)
  (:domain hanoi)
  (:objects
    left middle right - peg
    A B C D - disk
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - step
  )

  (:init
    ;; initial stack on middle peg: bottom D, then C, then B, then A (A is smallest/top)
    (on D middle)
    (on C D)
    (on B C)
    (on A B)

    ;; clear facts at initial state: only topmost disk and empty pegs are clear
    (clear A)
    (clear left)
    (clear right)

    ;; size ordering (A smallest, D largest)
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)

    ;; stage token starts at s0
    (stage s0)

    ;; explicit successor chain for exactly 15 single-disk moves (2^4 - 1 = 15)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)
  )

  (:goal (and
    ;; all disks moved to right peg in the correct stack order: D bottom, C on D, B on C, A on B
    (on D right)
    (on C D)
    (on B C)
    (on A B)

    ;; left and middle pegs must be empty at the end
    (clear left)
    (clear middle)

    ;; require exact staged progression to stage s15 (enforces exactly 15 single-disk moves)
    (stage s15)
  ))