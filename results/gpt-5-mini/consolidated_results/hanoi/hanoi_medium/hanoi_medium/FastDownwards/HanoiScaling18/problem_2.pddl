(define (problem hanoi-5-staged)
  (:domain tower-of-hanoi-staged)

  (:objects
    A B C D E - disk
    left middle right - peg
    ; 32 stages to force exactly 31 discrete moves (s0 -> s31)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - stage
  )

  (:init
    ; initial stack on left peg: bottom E on peg left, then D on E, C on D, B on C, A on B
    (on-peg E left)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ; clear markers: only the topmost disk and empty pegs are clear
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ; static size ordering (smaller relations): A smallest, E largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)

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
      ; final stack on middle peg: bottom E on peg middle, then D on E, C on D, B on C, A on B
      (on-peg E middle)
      (on D E)
      (on C D)
      (on B C)
      (on A B)
      ; require both other pegs empty explicitly
      (clear-peg left)
      (clear-peg right)
      ; require having reached the terminal stage exactly (ensures exactly 31 moves)
      (current s31)
    )
  )
)