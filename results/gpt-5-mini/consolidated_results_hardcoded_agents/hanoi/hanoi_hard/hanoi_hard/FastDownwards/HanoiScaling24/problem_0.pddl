(define (problem hanoi-6-orchestrated-problem)
  (:domain hanoi-orchestrated)
  (:objects
    ;; Disks: disk1 is smallest, disk6 largest
    disk1 disk2 disk3 disk4 disk5 disk6 - disk

    ;; Pegs
    pegA pegB pegC - peg

    ;; Steps: s0 initial, s63 final after 63 moves (2^6 - 1 = 63)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9
    s10 s11 s12 s13 s14 s15 s16 s17 s18 s19
    s20 s21 s22 s23 s24 s25 s26 s27 s28 s29
    s30 s31 s32 s33 s34 s35 s36 s37 s38 s39
    s40 s41 s42 s43 s44 s45 s46 s47 s48 s49
    s50 s51 s52 s53 s54 s55 s56 s57 s58 s59
    s60 s61 s62 s63 - step

    ;; Agents
    move_sequence legal_checks audit_report - agent
  )

  (:init
    ;; Initial tower on pegA: largest (disk6) on pegA, then disk5 on disk6, ..., disk1 on disk2
    (on disk6 pegA)
    (on disk5 disk6)
    (on disk4 disk5)
    (on disk3 disk4)
    (on disk2 disk3)
    (on disk1 disk2)

    ;; Clear predicates: only the topmost disk of a stack and empty pegs are clear
    (clear disk1)
    (clear pegB)
    (clear pegC)

    ;; Smaller relations (disk i smaller than disk j for i < j)
    (smaller disk1 disk2) (smaller disk1 disk3) (smaller disk1 disk4) (smaller disk1 disk5) (smaller disk1 disk6)
    (smaller disk2 disk3) (smaller disk2 disk4) (smaller disk2 disk5) (smaller disk2 disk6)
    (smaller disk3 disk4) (smaller disk3 disk5) (smaller disk3 disk6)
    (smaller disk4 disk5) (smaller disk4 disk6)
    (smaller disk5 disk6)

    ;; Explicit "different" facts for all ordered pairs of distinct places (disks + pegs)
    ;; Places: disk1 disk2 disk3 disk4 disk5 disk6 pegA pegB pegC
    ;; We enumerate all pairs p1 != p2
    (different disk1 disk2) (different disk1 disk3) (different disk1 disk4) (different disk1 disk5) (different disk1 disk6) (different disk1 pegA) (different disk1 pegB) (different disk1 pegC)
    (different disk2 disk1) (different disk2 disk3) (different disk2 disk4) (different disk2 disk5) (different disk2 disk6) (different disk2 pegA) (different disk2 pegB) (different disk2 pegC)
    (different disk3 disk1) (different disk3 disk2) (different disk3 disk4) (different disk3 disk5) (different disk3 disk6) (different disk3 pegA) (different disk3 pegB) (different disk3 pegC)
    (different disk4 disk1) (different disk4 disk2) (different disk4 disk3) (different disk4 disk5) (different disk4 disk6) (different disk4 pegA) (different disk4 pegB) (different disk4 pegC)
    (different disk5 disk1) (different disk5 disk2) (different disk5 disk3) (different disk5 disk4) (different disk5 disk6) (different disk5 pegA) (different disk5 pegB) (different disk5 pegC)
    (different disk6 disk1) (different disk6 disk2) (different disk6 disk3) (different disk6 disk4) (different disk6 disk5) (different disk6 pegA) (different disk6 pegB) (different disk6 pegC)

    (different pegA disk1) (different pegA disk2) (different pegA disk3) (different pegA disk4) (different pegA disk5) (different pegA disk6) (different pegA pegB) (different pegA pegC)
    (different pegB disk1) (different pegB disk2) (different pegB disk3) (different pegB disk4) (different pegB disk5) (different pegB disk6) (different pegB pegA) (different pegB pegC)
    (different pegC disk1) (different pegC disk2) (different pegC disk3) (different pegC disk4) (different pegC disk5) (different pegC disk6) (different pegC pegA) (different pegC pegB)

    ;; Step successor (contiguity enforced). s0 -> s1 -> ... -> s63
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9)
    (next s9 s10) (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15) (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19)
    (next s19 s20) (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24) (next s24 s25) (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29)
    (next s29 s30) (next s30 s31) (next s31 s32) (next s32 s33) (next s33 s34) (next s34 s35) (next s35 s36) (next s36 s37) (next s37 s38) (next s38 s39)
    (next s39 s40) (next s40 s41) (next s41 s42) (next s42 s43) (next s43 s44) (next s44 s45) (next s45 s46) (next s46 s47) (next s47 s48) (next s48 s49)
    (next s49 s50) (next s50 s51) (next s51 s52) (next s52 s53) (next s53 s54) (next s54 s55) (next s55 s56) (next s56 s57) (next s57 s58) (next s58 s59)
    (next s59 s60) (next s60 s61) (next s61 s62) (next s62 s63)

    ;; Initial step marker
    (at-step s0)

    ;; Agent contributions are explicit and must all be present for move actions to be legal
    (provides-move-sequence move_sequence)
    (provides-legal-checks legal_checks)
    (provides-audit-report audit_report)
  )

  (:goal (and
    ;; Final tower on pegC: disk6 on pegC, disk5 on disk6, ..., disk1 on disk2
    (on disk6 pegC)
    (on disk5 disk6)
    (on disk4 disk5)
    (on disk3 disk4)
    (on disk2 disk3)
    (on disk1 disk2)

    ;; Final step must be s63 (requires exactly 63 moves)
    (at-step s63)

    ;; Pegs A and B must be empty in the final configuration
    (clear pegA)
    (clear pegB)

    ;; Smallest disk must be clear on top
    (clear disk1)
  ))
)