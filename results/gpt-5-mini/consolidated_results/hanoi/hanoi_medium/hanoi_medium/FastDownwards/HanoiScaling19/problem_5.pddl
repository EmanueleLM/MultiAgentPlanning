(define (problem hanoi-5-right-to-left)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9
    step10 step11 step12 step13 step14 step15 step16 step17 step18 step19
    step20 step21 step22 step23 step24 step25 step26 step27 step28 step29
    step30 step31 - step
  )

  (:init
    ;; size ordering (smaller -> larger)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)

    ;; step successor chain from step0 .. step31
    (next step0 step1) (next step1 step2) (next step2 step3) (next step3 step4)
    (next step4 step5) (next step5 step6) (next step6 step7) (next step7 step8)
    (next step8 step9) (next step9 step10) (next step10 step11) (next step11 step12)
    (next step12 step13) (next step13 step14) (next step14 step15) (next step15 step16)
    (next step16 step17) (next step17 step18) (next step18 step19) (next step19 step20)
    (next step20 step21) (next step21 step22) (next step22 step23) (next step23 step24)
    (next step24 step25) (next step25 step26) (next step26 step27) (next step27 step28)
    (next step28 step29) (next step29 step30) (next step30 step31)

    ;; initial stack on the right peg (top-to-bottom): A, B, C, D, E
    ;; representation: on Disk Support Step. The bottom disk E is on the peg 'right'.
    (on A B step0)
    (on B C step0)
    (on C D step0)
    (on D E step0)
    (on E right step0)
  )

  (:goal (and
    ;; final stack on the left peg at step31 (top-to-bottom): A, B, C, D, E
    (on A B step31)
    (on B C step31)
    (on C D step31)
    (on D E step31)
    (on E left step31)

    ;; middle and right pegs must be empty at the final step: no disk is on them at step31
    (not (on A middle step31)) (not (on B middle step31)) (not (on C middle step31))
    (not (on D middle step31)) (not (on E middle step31))

    (not (on A right step31)) (not (on B right step31)) (not (on C right step31))
    (not (on D right step31)) (not (on E right step31))

    ;; enforce that a move occurs for each transition step0..step30 (31 moves total)
    (moved step0) (moved step1) (moved step2) (moved step3) (moved step4)
    (moved step5) (moved step6) (moved step7) (moved step8) (moved step9)
    (moved step10) (moved step11) (moved step12) (moved step13) (moved step14)
    (moved step15) (moved step16) (moved step17) (moved step18) (moved step19)
    (moved step20) (moved step21) (moved step22) (moved step23) (moved step24)
    (moved step25) (moved step26) (moved step27) (moved step28) (moved step29)
    (moved step30)
  ))