(define (problem hanoi-5-problem)
  (:domain hanoi-5-domain)

  (:objects
    ;; places: five disks and three pegs
    dA dB dC dD dE left middle right - place

    ;; agents (kept as parameters but not semantically required)
    mover1 mover2 - agent

    ;; explicit discrete stages (bound chosen to allow the minimal solution length)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - step
  )

  (:init
    ;; identify disks and pegs
    (disk dA) (disk dB) (disk dC) (disk dD) (disk dE)
    (peg left) (peg middle) (peg right)

    ;; initial stack on the middle peg:
    ;; bottom: dE on middle, then dD on dE, dC on dD, dB on dC, dA on dB (dA is top)
    (on dE middle)
    (on dD dE)
    (on dC dD)
    (on dB dC)
    (on dA dB)

    ;; clear = true only for top-of-stack places and empty pegs:
    (clear dA)     ;; top disk of initial stack
    (clear left)   ;; left peg empty
    (clear right)  ;; right peg empty

    ;; static size ordering (smaller means strictly smaller)
    (smaller dA dB) (smaller dA dC) (smaller dA dD) (smaller dA dE)
    (smaller dB dC) (smaller dB dD) (smaller dB dE)
    (smaller dC dD) (smaller dC dE)
    (smaller dD dE)

    ;; explicit discrete stage successor relation (static)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6)
    (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15) (next s15 s16) (next s16 s17)
    (next s17 s18) (next s18 s19) (next s19 s20) (next s20 s21) (next s21 s22)
    (next s22 s23) (next s23 s24) (next s24 s25) (next s25 s26) (next s26 s27)
    (next s27 s28) (next s28 s29) (next s29 s30) (next s30 s31)

    ;; initial global stage marker
    (at-step s0)
  )

  (:goal
    (and
      ;; final stack on the right peg must be, from bottom to top: dE on right, dD on dE, dC on dD, dB on dC, dA on dB
      (on dE right)
      (on dD dE)
      (on dC dD)
      (on dB dC)
      (on dA dB)

      ;; both middle and left pegs must be empty in the terminal state
      (clear middle)
      (clear left)

      ;; top disk remains clear as the canonical top condition
      (clear dA)
    )
  )
)