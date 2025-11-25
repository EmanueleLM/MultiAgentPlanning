(define (problem hanoi_5_staged)
  (:domain hanoi_staged)
  (:objects
    d1 d2 d3 d4 d5 - disk
    b1 b2 b3 - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - stage
  )

  (:init
    ;; initial stack on left peg b1: bottom d5, then d4, d3, d2, top d1
    (on-p d5 b1)
    (on-d d4 d5)
    (on-d d3 d4)
    (on-d d2 d3)
    (on-d d1 d2)

    ;; clear flags: only the topmost disk and empty pegs are clear initially
    (clear-d d1)
    (clear-p b2)
    (clear-p b3)

    ;; stage successor chain (31 moves => s0..s31)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)
    (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19) (succ s19 s20)
    (succ s20 s21) (succ s21 s22) (succ s22 s23) (succ s23 s24) (succ s24 s25)
    (succ s25 s26) (succ s26 s27) (succ s27 s28) (succ s28 s29) (succ s29 s30)
    (succ s30 s31)

    ;; initial current stage
    (current-stage s0)

    ;; size ordering between disks (d1 smallest ... d5 largest)
    (smaller-dd d1 d2) (smaller-dd d1 d3) (smaller-dd d1 d4) (smaller-dd d1 d5)
    (smaller-dd d2 d3) (smaller-dd d2 d4) (smaller-dd d2 d5)
    (smaller-dd d3 d4) (smaller-dd d3 d5)
    (smaller-dd d4 d5)

    ;; every disk is allowed on any empty peg (disk smaller than peg placeholder)
    (smaller-dp d1 b1) (smaller-dp d1 b2) (smaller-dp d1 b3)
    (smaller-dp d2 b1) (smaller-dp d2 b2) (smaller-dp d2 b3)
    (smaller-dp d3 b1) (smaller-dp d3 b2) (smaller-dp d3 b3)
    (smaller-dp d4 b1) (smaller-dp d4 b2) (smaller-dp d4 b3)
    (smaller-dp d5 b1) (smaller-dp d5 b2) (smaller-dp d5 b3)
  )

  (:goal (and
    ;; final stack on right peg b3: bottom d5, then d4, d3, d2, top d1
    (on-p d5 b3)
    (on-d d4 d5)
    (on-d d3 d4)
    (on-d d2 d3)
    (on-d d1 d2)

    ;; left and middle pegs must be empty
    (clear-p b1)
    (clear-p b2)

    ;; enforce completion of the exact sequence of 31 moves
    (current-stage s31)
  ))