(define (problem hanoi6-right-to-middle)
  (:domain hanoi-domain)

  (:objects
    d1 d2 d3 d4 d5 d6 - disk
    peg-left peg-middle peg-right - peg
    ; explicit discrete steps: step0 .. step63 (63 = 2^6 - 1, minimal number of moves)
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 step12 step13 step14 step15
    step16 step17 step18 step19 step20 step21 step22 step23 step24 step25 step26 step27 step28 step29 step30
    step31 step32 step33 step34 step35 step36 step37 step38 step39 step40 step41 step42 step43 step44 step45
    step46 step47 step48 step49 step50 step51 step52 step53 step54 step55 step56 step57 step58 step59 step60
    step61 step62 step63 - step
  )

  (:init
    ; initial stacking on peg-right (bottom d6 ... top d1)
    (on d6 peg-right)
    (on d5 d6)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ; initially only top disk and empty pegs are clear
    (clear d1)
    (clear peg-left)
    (clear peg-middle)
    ; peg-right is not clear (omitted)

    ; step progression: start at step0
    (at-step step0)

    ; successor chain step0 -> step1 -> ... -> step63
    (succ step0 step1) (succ step1 step2) (succ step2 step3) (succ step3 step4)
    (succ step4 step5) (succ step5 step6) (succ step6 step7) (succ step7 step8)
    (succ step8 step9) (succ step9 step10) (succ step10 step11) (succ step11 step12)
    (succ step12 step13) (succ step13 step14) (succ step14 step15) (succ step15 step16)
    (succ step16 step17) (succ step17 step18) (succ step18 step19) (succ step19 step20)
    (succ step20 step21) (succ step21 step22) (succ step22 step23) (succ step23 step24)
    (succ step24 step25) (succ step25 step26) (succ step26 step27) (succ step27 step28)
    (succ step28 step29) (succ step29 step30) (succ step30 step31) (succ step31 step32)
    (succ step32 step33) (succ step33 step34) (succ step34 step35) (succ step35 step36)
    (succ step36 step37) (succ step37 step38) (succ step38 step39) (succ step39 step40)
    (succ step40 step41) (succ step41 step42) (succ step42 step43) (succ step43 step44)
    (succ step44 step45) (succ step45 step46) (succ step46 step47) (succ step47 step48)
    (succ step48 step49) (succ step49 step50) (succ step50 step51) (succ step51 step52)
    (succ step52 step53) (succ step53 step54) (succ step54 step55) (succ step55 step56)
    (succ step56 step57) (succ step57 step58) (succ step58 step59) (succ step59 step60)
    (succ step60 step61) (succ step61 step62) (succ step62 step63)

    ; static size relations (smaller di dj iff i < j)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6)
    (smaller d4 d5) (smaller d4 d6)
    (smaller d5 d6)
  )

  (:goal
    (and
      ; final stacking on peg-middle (bottom d6 ... top d1)
      (on d6 peg-middle)
      (on d5 d6)
      (on d4 d5)
      (on d3 d4)
      (on d2 d3)
      (on d1 d2)

      ; left and right pegs empty at termination
      (clear peg-left)
      (clear peg-right)

      ; require final global step is step63 to enforce the exact ordered sequence length
      (at-step step63)

      ; enforce top/bottom clearness to match exact stacking
      (clear d1)
      (not (clear d2))
      (not (clear d3))
      (not (clear d4))
      (not (clear d5))
      (not (clear d6))
      (not (clear peg-middle))
    )
  )
)