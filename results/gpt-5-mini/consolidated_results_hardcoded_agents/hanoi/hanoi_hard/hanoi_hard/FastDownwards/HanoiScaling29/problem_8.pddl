(define (problem hanoi-6-orchestrated)
  (:domain tower-of-hanoi-orchestrated)

  (:objects
    a b c d e f - disk
    left middle right - peg

    l1 l2 l3 l4 l5 l6 - slot
    m1 m2 m3 m4 m5 m6 - slot
    r1 r2 r3 r4 r5 r6 - slot

    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15
    s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30
    s31 s32 s33 s34 s35 s36 s37 s38 s39 s40 s41 s42 s43 s44 s45 s46
    s47 s48 s49 s50 s51 s52 s53 s54 s55 s56 s57 s58 s59 s60 s61 s62 s63 - stage
  )

  (:init
    ;; slot-of relations (slot1 = bottom, slot6 = top for each peg)
    (slot-of l1 left) (slot-of l2 left) (slot-of l3 left) (slot-of l4 left) (slot-of l5 left) (slot-of l6 left)
    (slot-of m1 middle) (slot-of m2 middle) (slot-of m3 middle) (slot-of m4 middle) (slot-of m5 middle) (slot-of m6 middle)
    (slot-of r1 right) (slot-of r2 right) (slot-of r3 right) (slot-of r4 right) (slot-of r5 right) (slot-of r6 right)

    ;; immediate-above relations: above upper lower
    (above l2 l1) (above l3 l2) (above l4 l3) (above l5 l4) (above l6 l5)
    (above m2 m1) (above m3 m2) (above m4 m3) (above m5 m4) (above m6 m5)
    (above r2 r1) (above r3 r2) (above r4 r3) (above r5 r4) (above r6 r5)

    ;; bottom slots
    (bottom l1 left) (bottom m1 middle) (bottom r1 right)

    ;; initial disk placement on right peg, top at r6 (smallest a on top)
    (in a r6) (occupied r6)
    (in b r5) (occupied r5)
    (in c r4) (occupied r4)
    (in d r3) (occupied r3)
    (in e r2) (occupied r2)
    (in f r1) (occupied r1)

    (top r6)

    ;; left and middle pegs empty initially
    (peg-empty left)
    (peg-empty middle)

    ;; size ordering (static)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f)
    (smaller c d) (smaller c e) (smaller c f)
    (smaller d e) (smaller d f)
    (smaller e f)

    ;; identity facts for pegs
    (same left left) (same middle middle) (same right right)

    ;; stage chain s0 -> s1 -> ... -> s63 (63 moves required)
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
    ;; all disks on left peg in correct order (top l6 ... bottom l1)
    (in a l6)
    (in b l5)
    (in c l4)
    (in d l3)
    (in e l2)
    (in f l1)

    (top l6)

    ;; middle and right pegs empty at goal
    (peg-empty middle)
    (peg-empty right)

    ;; final stage reached (forces exactly 63 moves)
    (cur-stage s63)
  ))