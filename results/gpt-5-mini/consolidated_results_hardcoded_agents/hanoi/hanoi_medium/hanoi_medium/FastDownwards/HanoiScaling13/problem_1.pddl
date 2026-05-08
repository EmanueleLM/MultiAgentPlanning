(define (problem hanoi5)
  (:domain hanoi)
  (:objects
    a b c d e - disk
    left middle right - peg

    ;; stages: s0 .. s31 to enforce an ordered sequence of exactly 31 moves
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - stage
  )

  (:init
    ;; initial stacking (top-to-bottom) on the right peg: a on b on c on d on e on right
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e right)

    ;; clear: only the top disk and empty pegs are clear initially
    (clear a)
    (clear left)
    (clear middle)
    ;; right is not clear because e is on it

    ;; size ordering (a smallest, e largest)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)

    ;; stage sequencing: start at s0 and provide next relations up to s31.
    (curr s0)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)
    (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20)
    (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24) (next s24 s25)
    (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29) (next s29 s30)
    (next s30 s31)
  )

  (:goal
    (and
      ;; final stacking: all disks on the middle peg in same top-to-bottom order a,b,c,d,e
      (on a b)
      (on b c)
      (on c d)
      (on d e)
      (on e middle)

      ;; both left and right pegs must be empty at the end
      (clear left)
      (clear right)

      ;; require that exactly 31 moves have been performed (curr progressed to s31)
      (curr s31)
    )
  )
)