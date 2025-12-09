(define (problem hanoi-5)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left-peg middle-peg right-peg - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - stage
  )

  (:init
    ; explicit stage ordering and initial active stage
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6)
    (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15) (next s15 s16) (next s16 s17) (next s17 s18)
    (next s18 s19) (next s19 s20) (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24)
    (next s24 s25) (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29) (next s29 s30)
    (next s30 s31)

    (current-stage s0)

    ; initial stack on right-peg: top A, then B, C, D, bottom E
    (on-peg A right-peg)
    (on-peg B right-peg)
    (on-peg C right-peg)
    (on-peg D right-peg)
    (on-peg E right-peg)

    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)

    ; has-support indicates a disk has a disk under it (directly)
    (has-support A) (has-support B) (has-support C) (has-support D)
    ; E has no disk under it initially -> no (has-support E)

    ; top facts for the initial configuration
    (top A right-peg)

    ; empty pegs at start
    (empty left-peg)
    (empty middle-peg)

    ; size ordering: A smallest, then B, C, D, E largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  (:goal (and
    ; all disks transferred to the left peg in the same stacking order:
    ; E bottom on left-peg, then D on E, C on D, B on C, A on B
    (on-peg A left-peg)
    (on-peg B left-peg)
    (on-peg C left-peg)
    (on-peg D left-peg)
    (on-peg E left-peg)

    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)

    ; top disk on left peg is A
    (top A left-peg)

    ; both other pegs must be empty
    (empty middle-peg)
    (empty right-peg)

    ; enforce progression reached final stage (ensures exactly 31 ordered moves)
    (current-stage s31)
  ))
)