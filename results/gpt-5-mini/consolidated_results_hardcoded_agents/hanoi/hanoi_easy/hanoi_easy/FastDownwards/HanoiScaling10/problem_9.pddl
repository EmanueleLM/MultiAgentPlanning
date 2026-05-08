(define (problem hanoi-4-staged)
  (:domain hanoi)
  (:objects
    left middle right - object
    a b c d - object
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - step
  )

  (:init
    ;; declare disks and pegs
    (disk a) (disk b) (disk c) (disk d)
    (peg left) (peg middle) (peg right)

    ;; initial stack on middle peg: bottom d, then c, then b, then a (a is top)
    (on d middle)
    (on c d)
    (on b c)
    (on a b)

    ;; clear facts initially: topmost disk and empty pegs are clear
    (clear a)
    (clear left)
    (clear right)

    ;; static size ordering (a smallest, d largest)
    (smaller a b)
    (smaller a c)
    (smaller a d)
    (smaller b c)
    (smaller b d)
    (smaller c d)

    ;; stage token starts at s0
    (stage s0)

    ;; explicit successor chain for exactly 15 single-disk moves (2^4 - 1 = 15)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)
  )

  (:goal (and
    ;; final stack on right peg: bottom d, then c, then b, then a (a is top)
    (on d right)
    (on c d)
    (on b c)
    (on a b)

    ;; left and middle pegs must be empty at the end
    (clear left)
    (clear middle)

    ;; require exact staged progression to stage s15 (enforces exactly 15 single-disk moves)
    (stage s15)
  ))