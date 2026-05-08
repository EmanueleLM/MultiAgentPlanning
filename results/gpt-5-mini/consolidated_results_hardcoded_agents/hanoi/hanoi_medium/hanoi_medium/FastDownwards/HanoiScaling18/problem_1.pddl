(define (problem hanoi-5-staged)
  (:domain tower-of-hanoi-staged)

  (:objects
    d1 d2 d3 d4 d5 - disk
    p1 p2 p3 - peg
    ; 32 stages to force exactly 31 discrete moves (stage0 -> stage31)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - stage
  )

  (:init
    ; initial stack on left peg p1: bottom d5 on peg p1, then d4 on d5, d3 on d4, d2 on d3, d1 on d2
    (on-peg d5 p1)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ; clear markers: only the topmost disk and empty pegs are clear
    (clear-disk d1)
    (clear-peg p2)
    (clear-peg p3)
    ; p1 is not clear because d5 is directly on it

    ; static size ordering (smaller relations): d1 is smallest, d5 largest
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5)
    (smaller d3 d4) (smaller d3 d5)
    (smaller d4 d5)

    ; stage ordering chain: contiguous progression required
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)
    (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20)
    (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24) (next s24 s25)
    (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29) (next s29 s30)
    (next s30 s31)

    ; start at stage s0
    (current s0)
  )

  (:goal
    (and
      ; final stack on middle peg p2: bottom d5 on peg p2, then d4 on d5, d3 on d4, d2 on d3, d1 on d2
      (on-peg d5 p2)
      (on d4 d5)
      (on d3 d4)
      (on d2 d3)
      (on d1 d2)
      ; require having reached the terminal stage exactly (ensures exactly 31 moves)
      (current s31)
    )
  )
)