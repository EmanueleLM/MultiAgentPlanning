(define (problem hanoi-6-orchestrated)
  (:domain tower-of-hanoi-orchestrated)

  (:objects
    a b c d e f - disk
    left mid right - peg

    l1 l2 l3 l4 l5 l6 - slot
    m1 m2 m3 m4 m5 m6 - slot
    r1 r2 r3 r4 r5 r6 - slot

    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15
    s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30
    s31 s32 s33 s34 s35 s36 s37 s38 s39 s40 s41 s42 s43 s44 s45 s46
    s47 s48 s49 s50 s51 s52 s53 s54 s55 s56 s57 s58 s59 s60 s61 s62 s63 - stage
  )

  (:init
    ;; slot-of relations
    (slot-of l1 left) (slot-of l2 left) (slot-of l3 left) (slot-of l4 left) (slot-of l5 left) (slot-of l6 left)
    (slot-of m1 mid)  (slot-of m2 mid)  (slot-of m3 mid)  (slot-of m4 mid)  (slot-of m5 mid)  (slot-of m6 mid)
    (slot-of r1 right) (slot-of r2 right) (slot-of r3 right) (slot-of r4 right) (slot-of r5 right) (slot-of r6 right)

    ;; above relations (immediate above)
    (above l1 l2) (above l2 l3) (above l3 l4) (above l4 l5) (above l5 l6)
    (above m1 m2) (above m2 m3) (above m3 m4) (above m4 m5) (above m5 m6)
    (above r1 r2) (above r2 r3) (above r3 r4) (above r4 r5) (above r5 r6)

    ;; bottom slots
    (bottom l6 left) (bottom m6 mid) (bottom r6 right)

    ;; initial disk placement on right peg, top at r1
    (in a r1) (occupied r1)
    (in b r2) (occupied r2)
    (in c r3) (occupied r3)
    (in d r4) (occupied r4)
    (in e r5) (occupied r5)
    (in f r6) (occupied r6)

    (top r1)

    ;; empty pegs
    (peg-empty left)
    (peg-empty mid)

    ;; size ordering (static)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f)
    (smaller c d) (smaller c e) (smaller c f)
    (smaller d e) (smaller d f)
    (smaller e f)

    ;; same facts for peg equality checks
    (same left left) (same mid mid) (same right right)

    ;; stage chain: s0 -> s1 -> ... -> s63 (63 moves required for 6 disks)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15) (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19) (succ s19 s20)
    (succ s20 s21) (succ s21 s22) (succ s22 s23) (succ s23 s24) (succ s24 s25) (succ s25 s26) (succ s26 s27) (succ s27 s28) (succ s28 s29) (succ s29 s30)
    (succ s30 s31) (succ s31 s32) (succ s32 s33) (succ s33 s34) (succ s34 s35) (succ s35 s36) (succ s36 s37) (succ s37 s38) (succ s38 s39) (succ s39 s40)
    (succ s40 s41) (succ s41 s42) (succ s42 s43) (succ s43 s44) (succ s44 s45) (succ s45 s46) (succ s46 s47) (succ s47 s48) (succ s48 s49) (succ s49 s50)
    (succ s50 s51) (succ s51 s52) (succ s52 s53) (succ s53 s54) (succ s54 s55) (succ s55 s56) (succ s56 s57) (succ s57 s58) (succ s58 s59) (succ s59 s60)
    (succ s60 s61) (succ s61 s62) (succ s62 s63)

    (cur-stage s0)
  )

  (:goal (and
    ;; all disks on left peg in correct order (top l1 ... bottom l6)
    (in a l1)
    (in b l2)
    (in c l3)
    (in d l4)
    (in e l5)
    (in f l6)

    (top l1)

    ;; middle and right pegs empty at goal
    (peg-empty mid)
    (peg-empty right)

    ;; final stage reached (forces exactly 63 moves)
    (cur-stage s63)
  ))