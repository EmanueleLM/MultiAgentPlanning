(define (problem hanoi_5_staged)
  (:domain hanoi_staged)
  (:objects
    d1 d2 d3 d4 d5 - disk
    b1 b2 b3 - base
    ;; stages: s0 .. s31 (31 moves required for 5 disks)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - stage
  )

  (:init
    ;; initial tower on b1: bottom d5, then d4, d3, d2, top d1
    (on d5 b1)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ;; clear predicates: only topmost disk and empty bases are clear initially
    (clear d1)
    (not (clear d2)) ;; these explicit 'not' are not required in PDDL init; omitted to keep standard init facts
    ;; In PDDL init, list only positive facts. So we provide positive clear facts only:
    (clear b2)
    (clear b3)
    ;; b1 is not clear (has d5), d2..d5 not clear (have disks on them) - these are left implicit by absence of clear facts.

    ;; stage successor chain
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
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5)
    (smaller d3 d4) (smaller d3 d5)
    (smaller d4 d5)

    ;; any disk is smaller than any base (allow placing on an empty peg)
    (smaller d1 b1) (smaller d1 b2) (smaller d1 b3)
    (smaller d2 b1) (smaller d2 b2) (smaller d2 b3)
    (smaller d3 b1) (smaller d3 b2) (smaller d3 b3)
    (smaller d4 b1) (smaller d4 b2) (smaller d4 b3)
    (smaller d5 b1) (smaller d5 b2) (smaller d5 b3)
  )

  (:goal (and
    ;; final tower on b3: bottom d5, then d4, d3, d2, top d1
    (on d5 b3)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ;; left and middle pegs (b1 and b2) must be empty (clear)
    (clear b1)
    (clear b2)

    ;; enforce that exactly 31 stage steps have been taken (sequence completion)
    (current-stage s31)
  ))
)