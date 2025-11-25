(define (problem hanoi-5disks)
  (:domain hanoi)
  (:objects
    a b c d e - disk
    left-peg mid-peg right-peg - peg
    p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 p31 - phase
  )

  (:init
    ;; Initial tower on right-peg: a (top) on b on c on d on e (bottom on peg)
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-peg e right-peg)

    ;; Top-of-stack / empty markers
    (clear-disk a)
    (clear-peg left-peg)
    (clear-peg mid-peg)

    ;; Static size ordering: a < b < c < d < e
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)

    ;; Phase sequencing: one move per phase transition; 31 moves required for 5 disks
    (current-phase p0)
    (next p0 p1) (next p1 p2) (next p2 p3) (next p3 p4) (next p4 p5) (next p5 p6) (next p6 p7) (next p7 p8) (next p8 p9) (next p9 p10)
    (next p10 p11) (next p11 p12) (next p12 p13) (next p13 p14) (next p14 p15) (next p15 p16) (next p16 p17) (next p17 p18) (next p18 p19) (next p19 p20)
    (next p20 p21) (next p21 p22) (next p22 p23) (next p23 p24) (next p24 p25) (next p25 p26) (next p26 p27) (next p27 p28) (next p28 p29) (next p29 p30)
    (next p30 p31)
  )

  (:goal (and
    ;; Final phase reached after 31 moves
    (current-phase p31)

    ;; All disks stacked on mid-peg in correct order: a top ... e bottom
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-peg e mid-peg)

    ;; Auxiliary pegs empty
    (clear-peg left-peg)
    (clear-peg right-peg)
  ))