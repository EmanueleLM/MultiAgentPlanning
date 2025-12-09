(define (problem hanoi-5-right-to-left)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
    ;; steps 0 through 31 (31 moves required for 5 disks)
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9
    step10 step11 step12 step13 step14 step15 step16 step17 step18 step19
    step20 step21 step22 step23 step24 step25 step26 step27 step28 step29
    step30 step31 - step
  )

  (:init
    ;; size ordering: A < B < C < D < E
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)

    ;; successor chain for steps
    (next step0 step1) (next step1 step2) (next step2 step3) (next step3 step4)
    (next step4 step5) (next step5 step6) (next step6 step7) (next step7 step8)
    (next step8 step9) (next step9 step10) (next step10 step11) (next step11 step12)
    (next step12 step13) (next step13 step14) (next step14 step15) (next step15 step16)
    (next step16 step17) (next step17 step18) (next step18 step19) (next step19 step20)
    (next step20 step21) (next step21 step22) (next step22 step23) (next step23 step24)
    (next step24 step25) (next step25 step26) (next step26 step27) (next step27 step28)
    (next step28 step29) (next step29 step30) (next step30 step31)

    ;; Initial immediate-support chain on the right peg (top-to-bottom): A on B, B on C, C on D, D on E, E on right
    (at A B step0)
    (at B C step0)
    (at C D step0)
    (at D E step0)
    (at E right step0)

    ;; clear (nothing immediately on): top disk A, and empty pegs left and middle at step0
    (clear A step0)
    (clear left step0)
    (clear middle step0)

    ;; Note: other clear facts (e.g., clear B step0) are intentionally absent because
    ;; those supports have immediate disks on them at step0 (B,C,D,E and right peg are not clear).
    ;; No moved flags initially (no moves yet).
  )

  (:goal (and
    ;; final immediate-support chain on the left peg at step31: A on B, B on C, C on D, D on E, E on left
    (at A B step31)
    (at B C step31)
    (at C D step31)
    (at D E step31)
    (at E left step31)

    ;; middle and right must be empty (no disk immediately on them) at final step
    (clear middle step31)
    (clear right step31)

    ;; enforce that exactly one move occurs during each step from step0..step30
    ;; (this forces the plan to perform 31 moves, the minimal required)
    (moved step0) (moved step1) (moved step2) (moved step3) (moved step4)
    (moved step5) (moved step6) (moved step7) (moved step8) (moved step9)
    (moved step10) (moved step11) (moved step12) (moved step13) (moved step14)
    (moved step15) (moved step16) (moved step17) (moved step18) (moved step19)
    (moved step20) (moved step21) (moved step22) (moved step23) (moved step24)
    (moved step25) (moved step26) (moved step27) (moved step28) (moved step29)
    (moved step30)
  ))