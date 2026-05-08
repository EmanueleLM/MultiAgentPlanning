(define (problem hanoi5-instance)
  (:domain hanoi5)
  (:objects
    A B C D E - disk
    L M R - peg
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10
    step11 step12 step13 step14 step15 step16 step17 step18 step19 step20
    step21 step22 step23 step24 step25 step26 step27 step28 step29 step30
    step31 step32 - step
  )

  (:init
    ;; stack on Middle peg M from top to bottom: A on B on C on D on E on M
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E M)

    ;; top and empty facts
    (top M A)
    (empty L)
    (empty R)

    ;; size relations
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)

    ;; step control: start at step1
    (cur step1)

    ;; successor links
    (succ step1 step2)   (succ step2 step3)   (succ step3 step4)   (succ step4 step5)
    (succ step5 step6)   (succ step6 step7)   (succ step7 step8)   (succ step8 step9)
    (succ step9 step10)  (succ step10 step11) (succ step11 step12) (succ step12 step13)
    (succ step13 step14) (succ step14 step15) (succ step15 step16) (succ step16 step17)
    (succ step17 step18) (succ step18 step19) (succ step19 step20) (succ step20 step21)
    (succ step21 step22) (succ step22 step23) (succ step23 step24) (succ step24 step25)
    (succ step25 step26) (succ step26 step27) (succ step27 step28) (succ step28 step29)
    (succ step29 step30) (succ step30 step31) (succ step31 step32)

    ;; allowed-move facts encoding the required 31-step sequence: (allowed-move stepN Disk FromPeg ToPeg)
    (allowed-move step1  A M R)
    (allowed-move step2  B M L)
    (allowed-move step3  A R L)
    (allowed-move step4  C M R)
    (allowed-move step5  A L M)
    (allowed-move step6  B L R)
    (allowed-move step7  A M R)
    (allowed-move step8  D M L)
    (allowed-move step9  A R L)
    (allowed-move step10 B R M)
    (allowed-move step11 A L M)
    (allowed-move step12 C R L)
    (allowed-move step13 A M R)
    (allowed-move step14 B M L)
    (allowed-move step15 A R L)
    (allowed-move step16 E M R)
    (allowed-move step17 A L M)
    (allowed-move step18 B L R)
    (allowed-move step19 A M R)
    (allowed-move step20 C L M)
    (allowed-move step21 A R L)
    (allowed-move step22 B R M)
    (allowed-move step23 A L M)
    (allowed-move step24 D L R)
    (allowed-move step25 A M R)
    (allowed-move step26 B M L)
    (allowed-move step27 A R L)
    (allowed-move step28 C M R)
    (allowed-move step29 A L M)
    (allowed-move step30 B L R)
    (allowed-move step31 A M R)
  )

  (:goal
    (and
      ;; final stack on Right peg R from top to bottom: A on B on C on D on E on R
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E R)
      ;; left and middle pegs empty
      (empty L)
      (empty M)
      ;; sequence completed
      (cur step32)
    )
  )
)