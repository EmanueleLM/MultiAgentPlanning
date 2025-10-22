(define (domain blocksworld40-instance11)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)        ; x is on block y
    (on-table ?x - block)             ; x is on the table
    (clear ?x - block)                ; nothing on x
    (holding ?x - block)              ; hand holds x
    (handempty)                       ; hand is empty
    (ready1) (ready2) (ready3) (ready4) (ready5)
    (ready6) (ready7) (ready8) (ready9) (ready10)
    (ready11) (ready12) (ready13) (ready14) (ready15)
    (ready16) (ready17) (ready18) (ready19) (ready20)
    (ready21) (ready22) (ready23) (ready24) (ready25)
    (ready26) (ready27) (ready28) (ready29) (ready30)
    (ready31) (ready32) (ready33) (ready34) (ready35)
    (ready36) (ready37) (ready38) (ready39) (ready40)
    (done)
  )

  ;; Step 1: unstack(E, J)
  (:action step1-unstack-e-j
    :parameters ()
    :precondition (and (ready1) (handempty) (on E J) (clear E))
    :effect (and
      (not (on E J))
      (holding E)
      (not (clear E))
      (clear J)
      (not (handempty))
      (not (ready1))
      (ready2)
    )
  )

  ;; Step 2: putdown(E)
  (:action step2-putdown-e
    :parameters ()
    :precondition (and (ready2) (holding E))
    :effect (and
      (not (holding E))
      (on-table E)
      (clear E)
      (handempty)
      (not (ready2))
      (ready3)
    )
  )

  ;; Step 3: unstack(J, D)
  (:action step3-unstack-j-d
    :parameters ()
    :precondition (and (ready3) (handempty) (on J D) (clear J))
    :effect (and
      (not (on J D))
      (holding J)
      (not (clear J))
      (clear D)
      (not (handempty))
      (not (ready3))
      (ready4)
    )
  )

  ;; Step 4: stack(J, H)
  (:action step4-stack-j-h
    :parameters ()
    :precondition (and (ready4) (holding J) (clear H))
    :effect (and
      (not (holding J))
      (on J H)
      (not (clear H))
      (clear J)
      (handempty)
      (not (ready4))
      (ready5)
    )
  )

  ;; Step 5: unstack(J, H)
  (:action step5-unstack-j-h
    :parameters ()
    :precondition (and (ready5) (handempty) (on J H) (clear J))
    :effect (and
      (not (on J H))
      (holding J)
      (not (clear J))
      (clear H)
      (not (handempty))
      (not (ready5))
      (ready6)
    )
  )

  ;; Step 6: stack(J, F)
  (:action step6-stack-j-f
    :parameters ()
    :precondition (and (ready6) (holding J) (clear F))
    :effect (and
      (not (holding J))
      (on J F)
      (not (clear F))
      (clear J)
      (handempty)
      (not (ready6))
      (ready7)
    )
  )

  ;; Step 7: unstack(A, G)
  (:action step7-unstack-a-g
    :parameters ()
    :precondition (and (ready7) (handempty) (on A G) (clear A))
    :effect (and
      (not (on A G))
      (holding A)
      (not (clear A))
      (clear G)
      (not (handempty))
      (not (ready7))
      (ready8)
    )
  )

  ;; Step 8: stack(A, H)
  (:action step8-stack-a-h
    :parameters ()
    :precondition (and (ready8) (holding A) (clear H))
    :effect (and
      (not (holding A))
      (on A H)
      (not (clear H))
      (clear A)
      (handempty)
      (not (ready8))
      (ready9)
    )
  )

  ;; Step 9: pickup(D)
  (:action step9-pickup-d
    :parameters ()
    :precondition (and (ready9) (handempty) (on-table D) (clear D))
    :effect (and
      (not (on-table D))
      (holding D)
      (not (clear D))
      (not (handempty))
      (not (ready9))
      (ready10)
    )
  )

  ;; Step 10: stack(D, J)
  (:action step10-stack-d-j
    :parameters ()
    :precondition (and (ready10) (holding D) (clear J))
    :effect (and
      (not (holding D))
      (on D J)
      (not (clear J))
      (clear D)
      (handempty)
      (not (ready10))
      (ready11)
    )
  )

  ;; Step 11: unstack(A, H)
  (:action step11-unstack-a-h
    :parameters ()
    :precondition (and (ready11) (handempty) (on A H) (clear A))
    :effect (and
      (not (on A H))
      (holding A)
      (not (clear A))
      (clear H)
      (not (handempty))
      (not (ready11))
      (ready12)
    )
  )

  ;; Step 12: stack(A, G)
  (:action step12-stack-a-g
    :parameters ()
    :precondition (and (ready12) (holding A) (clear G))
    :effect (and
      (not (holding A))
      (on A G)
      (not (clear G))
      (clear A)
      (handempty)
      (not (ready12))
      (ready13)
    )
  )

  ;; Step 13: pickup(E)
  (:action step13-pickup-e
    :parameters ()
    :precondition (and (ready13) (handempty) (on-table E) (clear E))
    :effect (and
      (not (on-table E))
      (holding E)
      (not (clear E))
      (not (handempty))
      (not (ready13))
      (ready14)
    )
  )

  ;; Step 14: stack(E, D)
  (:action step14-stack-e-d
    :parameters ()
    :precondition (and (ready14) (holding E) (clear D))
    :effect (and
      (not (holding E))
      (on E D)
      (not (clear D))
      (clear E)
      (handempty)
      (not (ready14))
      (ready15)
    )
  )

  ;; Step 15: unstack(A, G)
  (:action step15-unstack-a-g
    :parameters ()
    :precondition (and (ready15) (handempty) (on A G) (clear A))
    :effect (and
      (not (on A G))
      (holding A)
      (not (clear A))
      (clear G)
      (not (handempty))
      (not (ready15))
      (ready16)
    )
  )

  ;; Step 16: stack(A, G)
  (:action step16-stack-a-g
    :parameters ()
    :precondition (and (ready16) (holding A) (clear G))
    :effect (and
      (not (holding A))
      (on A G)
      (not (clear G))
      (clear A)
      (handempty)
      (not (ready16))
      (ready17)
    )
  )

  ;; Step 17: unstack(A, G)
  (:action step17-unstack-a-g
    :parameters ()
    :precondition (and (ready17) (handempty) (on A G) (clear A))
    :effect (and
      (not (on A G))
      (holding A)
      (not (clear A))
      (clear G)
      (not (handempty))
      (not (ready17))
      (ready18)
    )
  )

  ;; Step 18: stack(A, G)
  (:action step18-stack-a-g
    :parameters ()
    :precondition (and (ready18) (holding A) (clear G))
    :effect (and
      (not (holding A))
      (on A G)
      (not (clear G))
      (clear A)
      (handempty)
      (not (ready18))
      (ready19)
    )
  )

  ;; Step 19: unstack(H, I)
  (:action step19-unstack-h-i
    :parameters ()
    :precondition (and (ready19) (handempty) (on H I) (clear H))
    :effect (and
      (not (on H I))
      (holding H)
      (not (clear H))
      (clear I)
      (not (handempty))
      (not (ready19))
      (ready20)
    )
  )

  ;; Step 20: stack(H, I)
  (:action step20-stack-h-i
    :parameters ()
    :precondition (and (ready20) (holding H) (clear I))
    :effect (and
      (not (holding H))
      (on H I)
      (not (clear I))
      (clear H)
      (handempty)
      (not (ready20))
      (ready21)
    )
  )

  ;; Step 21: unstack(H, I)
  (:action step21-unstack-h-i
    :parameters ()
    :precondition (and (ready21) (handempty) (on H I) (clear H))
    :effect (and
      (not (on H I))
      (holding H)
      (not (clear H))
      (clear I)
      (not (handempty))
      (not (ready21))
      (ready22)
    )
  )

  ;; Step 22: putdown(H)
  (:action step22-putdown-h
    :parameters ()
    :precondition (and (ready22) (holding H))
    :effect (and
      (not (holding H))
      (on-table H)
      (clear H)
      (handempty)
      (not (ready22))
      (ready23)
    )
  )

  ;; Step 23: unstack(E, D)
  (:action step23-unstack-e-d
    :parameters ()
    :precondition (and (ready23) (handempty) (on E D) (clear E))
    :effect (and
      (not (on E D))
      (holding E)
      (not (clear E))
      (clear D)
      (not (handempty))
      (not (ready23))
      (ready24)
    )
  )

  ;; Step 24: putdown(E)
  (:action step24-putdown-e
    :parameters ()
    :precondition (and (ready24) (holding E))
    :effect (and
      (not (holding E))
      (on-table E)
      (clear E)
      (handempty)
      (not (ready24))
      (ready25)
    )
  )

  ;; Step 25: unstack(A, G)
  (:action step25-unstack-a-g
    :parameters ()
    :precondition (and (ready25) (handempty) (on A G) (clear A))
    :effect (and
      (not (on A G))
      (holding A)
      (not (clear A))
      (clear G)
      (not (handempty))
      (not (ready25))
      (ready26)
    )
  )

  ;; Step 26: stack(A, E)
  (:action step26-stack-a-e
    :parameters ()
    :precondition (and (ready26) (holding A) (clear E))
    :effect (and
      (not (holding A))
      (on A E)
      (not (clear E))
      (clear A)
      (handempty)
      (not (ready26))
      (ready27)
    )
  )

  ;; Step 27: unstack(A, E)
  (:action step27-unstack-a-e
    :parameters ()
    :precondition (and (ready27) (handempty) (on A E) (clear A))
    :effect (and
      (not (on A E))
      (holding A)
      (not (clear A))
      (clear E)
      (not (handempty))
      (not (ready27))
      (ready28)
    )
  )

  ;; Step 28: putdown(A)
  (:action step28-putdown-a
    :parameters ()
    :precondition (and (ready28) (holding A))
    :effect (and
      (not (holding A))
      (on-table A)
      (clear A)
      (handempty)
      (not (ready28))
      (ready29)
    )
  )

  ;; Step 29: pickup(G)
  (:action step29-pickup-g
    :parameters ()
    :precondition (and (ready29) (handempty) (on-table G) (clear G))
    :effect (and
      (not (on-table G))
      (holding G)
      (not (clear G))
      (not (handempty))
      (not (ready29))
      (ready30)
    )
  )

  ;; Step 30: putdown(G)
  (:action step30-putdown-g
    :parameters ()
    :precondition (and (ready30) (holding G))
    :effect (and
      (not (holding G))
      (on-table G)
      (clear G)
      (handempty)
      (not (ready30))
      (ready31)
    )
  )

  ;; Step 31: pickup(A)
  (:action step31-pickup-a
    :parameters ()
    :precondition (and (ready31) (handempty) (on-table A) (clear A))
    :effect (and
      (not (on-table A))
      (holding A)
      (not (clear A))
      (not (handempty))
      (not (ready31))
      (ready32)
    )
  )

  ;; Step 32: stack(A, D)
  (:action step32-stack-a-d
    :parameters ()
    :precondition (and (ready32) (holding A) (clear D))
    :effect (and
      (not (holding A))
      (on A D)
      (not (clear D))
      (clear A)
      (handempty)
      (not (ready32))
      (ready33)
    )
  )

  ;; Step 33: pickup(H)
  (:action step33-pickup-h
    :parameters ()
    :precondition (and (ready33) (handempty) (on-table H) (clear H))
    :effect (and
      (not (on-table H))
      (holding H)
      (not (clear H))
      (not (handempty))
      (not (ready33))
      (ready34)
    )
  )

  ;; Step 34: stack(H, E)
  (:action step34-stack-h-e
    :parameters ()
    :precondition (and (ready34) (holding H) (clear E))
    :effect (and
      (not (holding H))
      (on H E)
      (not (clear E))
      (clear H)
      (handempty)
      (not (ready34))
      (ready35)
    )
  )

  ;; Step 35: unstack(A, D)
  (:action step35-unstack-a-d
    :parameters ()
    :precondition (and (ready35) (handempty) (on A D) (clear A))
    :effect (and
      (not (on A D))
      (holding A)
      (not (clear A))
      (clear D)
      (not (handempty))
      (not (ready35))
      (ready36)
    )
  )

  ;; Step 36: stack(A, G)
  (:action step36-stack-a-g
    :parameters ()
    :precondition (and (ready36) (holding A) (clear G))
    :effect (and
      (not (holding A))
      (on A G)
      (not (clear G))
      (clear A)
      (handempty)
      (not (ready36))
      (ready37)
    )
  )

  ;; Step 37: unstack(A, G)
  (:action step37-unstack-a-g
    :parameters ()
    :precondition (and (ready37) (handempty) (on A G) (clear A))
    :effect (and
      (not (on A G))
      (holding A)
      (not (clear A))
      (clear G)
      (not (handempty))
      (not (ready37))
      (ready38)
    )
  )

  ;; Step 38: stack(A, I)
  (:action step38-stack-a-i
    :parameters ()
    :precondition (and (ready38) (holding A) (clear I))
    :effect (and
      (not (holding A))
      (on A I)
      (not (clear I))
      (clear A)
      (handempty)
      (not (ready38))
      (ready39)
    )
  )

  ;; Step 39: unstack(A, I)
  (:action step39-unstack-a-i
    :parameters ()
    :precondition (and (ready39) (handempty) (on A I) (clear A))
    :effect (and
      (not (on A I))
      (holding A)
      (not (clear A))
      (clear I)
      (not (handempty))
      (not (ready39))
      (ready40)
    )
  )

  ;; Step 40: stack(A, D) -> final
  (:action step40-stack-a-d-final
    :parameters ()
    :precondition (and (ready40) (holding A) (clear D))
    :effect (and
      (not (holding A))
      (on A D)
      (not (clear D))
      (clear A)
      (handempty)
      (not (ready40))
      (done)
    )
  )
)