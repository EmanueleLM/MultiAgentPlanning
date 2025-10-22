(define (domain blocks-sequence)
  (:requirements :typing :negative-preconditions)
  (:types block)
  (:constants A B C D E F G H I J K - block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (done0) (done1) (done2) (done3) (done4) (done5) (done6) (done7) (done8) (done9)
    (done10) (done11) (done12) (done13) (done14) (done15) (done16) (done17) (done18) (done19)
    (done20) (done21) (done22) (done23) (done24) (done25) (done26) (done27) (done28) (done29)
    (done30)
  )

  ;; Step 1: unstack(A, C)
  (:action step1-unstack-A-C
    :parameters ()
    :precondition (and (done0) (on A C) (clear A) (handempty))
    :effect (and
      (not (on A C))
      (holding A)
      (not (handempty))
      (clear C)
      (clear A)
      (not (done0)) (done1)
    )
  )

  ;; Step 2: putdown(A)
  (:action step2-putdown-A
    :parameters ()
    :precondition (and (done1) (holding A))
    :effect (and
      (ontable A)
      (not (holding A))
      (handempty)
      (clear A)
      (not (done1)) (done2)
    )
  )

  ;; Step 3: unstack(I, J)
  (:action step3-unstack-I-J
    :parameters ()
    :precondition (and (done2) (on I J) (clear I) (handempty))
    :effect (and
      (not (on I J))
      (holding I)
      (not (handempty))
      (clear J)
      (clear I)
      (not (done2)) (done3)
    )
  )

  ;; Step 4: putdown(I)
  (:action step4-putdown-I
    :parameters ()
    :precondition (and (done3) (holding I))
    :effect (and
      (ontable I)
      (not (holding I))
      (handempty)
      (clear I)
      (not (done3)) (done4)
    )
  )

  ;; Step 5: unstack(D, E)
  (:action step5-unstack-D-E
    :parameters ()
    :precondition (and (done4) (on D E) (clear D) (handempty))
    :effect (and
      (not (on D E))
      (holding D)
      (not (handempty))
      (clear E)
      (clear D)
      (not (done4)) (done5)
    )
  )

  ;; Step 6: stack(D, I)
  (:action step6-stack-D-I
    :parameters ()
    :precondition (and (done5) (holding D) (clear I))
    :effect (and
      (on D I)
      (not (clear I))
      (not (holding D))
      (handempty)
      (clear D)
      (not (ontable D))
      (not (done5)) (done6)
    )
  )

  ;; Step 7: pickup(A)
  (:action step7-pickup-A
    :parameters ()
    :precondition (and (done6) (ontable A) (clear A) (handempty))
    :effect (and
      (not (ontable A))
      (holding A)
      (not (handempty))
      (clear A)
      (not (done6)) (done7)
    )
  )

  ;; Step 8: stack(A, E)
  (:action step8-stack-A-E
    :parameters ()
    :precondition (and (done7) (holding A) (clear E))
    :effect (and
      (on A E)
      (not (clear E))
      (not (holding A))
      (handempty)
      (clear A)
      (not (ontable A))
      (not (done7)) (done8)
    )
  )

  ;; Step 9: unstack(J, F)
  (:action step9-unstack-J-F
    :parameters ()
    :precondition (and (done8) (on J F) (clear J) (handempty))
    :effect (and
      (not (on J F))
      (holding J)
      (not (handempty))
      (clear F)
      (clear J)
      (not (done8)) (done9)
    )
  )

  ;; Step 10: stack(J, A)
  (:action step10-stack-J-A
    :parameters ()
    :precondition (and (done9) (holding J) (clear A))
    :effect (and
      (on J A)
      (not (clear A))
      (not (holding J))
      (handempty)
      (clear J)
      (not (ontable J))
      (not (done9)) (done10)
    )
  )

  ;; Step 11: unstack(J, A)
  (:action step11-unstack-J-A
    :parameters ()
    :precondition (and (done10) (on J A) (clear J) (handempty))
    :effect (and
      (not (on J A))
      (holding J)
      (not (handempty))
      (clear A)
      (clear J)
      (not (done10)) (done11)
    )
  )

  ;; Step 12: putdown(J)
  (:action step12-putdown-J
    :parameters ()
    :precondition (and (done11) (holding J))
    :effect (and
      (ontable J)
      (not (holding J))
      (handempty)
      (clear J)
      (not (done11)) (done12)
    )
  )

  ;; Step 13: unstack(D, I)
  (:action step13-unstack-D-I
    :parameters ()
    :precondition (and (done12) (on D I) (clear D) (handempty))
    :effect (and
      (not (on D I))
      (holding D)
      (not (handempty))
      (clear I)
      (clear D)
      (not (done12)) (done13)
    )
  )

  ;; Step 14: stack(D, I)
  (:action step14-stack-D-I
    :parameters ()
    :precondition (and (done13) (holding D) (clear I))
    :effect (and
      (on D I)
      (not (clear I))
      (not (holding D))
      (handempty)
      (clear D)
      (not (ontable D))
      (not (done13)) (done14)
    )
  )

  ;; Step 15: pickup(F)
  (:action step15-pickup-F
    :parameters ()
    :precondition (and (done14) (ontable F) (clear F) (handempty))
    :effect (and
      (not (ontable F))
      (holding F)
      (not (handempty))
      (clear F)
      (not (done14)) (done15)
    )
  )

  ;; Step 16: stack(F, C)
  (:action step16-stack-F-C
    :parameters ()
    :precondition (and (done15) (holding F) (clear C))
    :effect (and
      (on F C)
      (not (clear C))
      (not (holding F))
      (handempty)
      (clear F)
      (not (ontable F))
      (not (done15)) (done16)
    )
  )

  ;; Step 17: pickup(J)
  (:action step17-pickup-J
    :parameters ()
    :precondition (and (done16) (ontable J) (clear J) (handempty))
    :effect (and
      (not (ontable J))
      (holding J)
      (not (handempty))
      (clear J)
      (not (done16)) (done17)
    )
  )

  ;; Step 18: stack(J, A)
  (:action step18-stack-J-A
    :parameters ()
    :precondition (and (done17) (holding J) (clear A))
    :effect (and
      (on J A)
      (not (clear A))
      (not (holding J))
      (handempty)
      (clear J)
      (not (ontable J))
      (not (done17)) (done18)
    )
  )

  ;; Step 19: unstack(D, I)
  (:action step19-unstack-D-I
    :parameters ()
    :precondition (and (done18) (on D I) (clear D) (handempty))
    :effect (and
      (not (on D I))
      (holding D)
      (not (handempty))
      (clear I)
      (clear D)
      (not (done18)) (done19)
    )
  )

  ;; Step 20: stack(D, H)
  (:action step20-stack-D-H
    :parameters ()
    :precondition (and (done19) (holding D) (clear H))
    :effect (and
      (on D H)
      (not (clear H))
      (not (holding D))
      (handempty)
      (clear D)
      (not (ontable D))
      (not (done19)) (done20)
    )
  )

  ;; Step 21: unstack(J, A)
  (:action step21-unstack-J-A
    :parameters ()
    :precondition (and (done20) (on J A) (clear J) (handempty))
    :effect (and
      (not (on J A))
      (holding J)
      (not (handempty))
      (clear A)
      (clear J)
      (not (done20)) (done21)
    )
  )

  ;; Step 22: putdown(J)
  (:action step22-putdown-J
    :parameters ()
    :precondition (and (done21) (holding J))
    :effect (and
      (ontable J)
      (not (holding J))
      (handempty)
      (clear J)
      (not (done21)) (done22)
    )
  )

  ;; Step 23: pickup(I)
  (:action step23-pickup-I
    :parameters ()
    :precondition (and (done22) (ontable I) (clear I) (handempty))
    :effect (and
      (not (ontable I))
      (holding I)
      (not (handempty))
      (clear I)
      (not (done22)) (done23)
    )
  )

  ;; Step 24: stack(I, D)
  (:action step24-stack-I-D
    :parameters ()
    :precondition (and (done23) (holding I) (clear D))
    :effect (and
      (on I D)
      (not (clear D))
      (not (holding I))
      (handempty)
      (clear I)
      (not (ontable I))
      (not (done23)) (done24)
    )
  )

  ;; Step 25: unstack(F, C)
  (:action step25-unstack-F-C
    :parameters ()
    :precondition (and (done24) (on F C) (clear F) (handempty))
    :effect (and
      (not (on F C))
      (holding F)
      (not (handempty))
      (clear C)
      (clear F)
      (not (done24)) (done25)
    )
  )

  ;; Step 26: stack(F, C)
  (:action step26-stack-F-C
    :parameters ()
    :precondition (and (done25) (holding F) (clear C))
    :effect (and
      (on F C)
      (not (clear C))
      (not (holding F))
      (handempty)
      (clear F)
      (not (ontable F))
      (not (done25)) (done26)
    )
  )

  ;; Step 27: unstack(I, D)
  (:action step27-unstack-I-D
    :parameters ()
    :precondition (and (done26) (on I D) (clear I) (handempty))
    :effect (and
      (not (on I D))
      (holding I)
      (not (handempty))
      (clear D)
      (clear I)
      (not (done26)) (done27)
    )
  )

  ;; Step 28: stack(I, J)
  (:action step28-stack-I-J
    :parameters ()
    :precondition (and (done27) (holding I) (clear J))
    :effect (and
      (on I J)
      (not (clear J))
      (not (holding I))
      (handempty)
      (clear I)
      (not (ontable I))
      (not (done27)) (done28)
    )
  )

  ;; Step 29: unstack(F, C)
  (:action step29-unstack-F-C
    :parameters ()
    :precondition (and (done28) (on F C) (clear F) (handempty))
    :effect (and
      (not (on F C))
      (holding F)
      (not (handempty))
      (clear C)
      (clear F)
      (not (done28)) (done29)
    )
  )

  ;; Step 30: stack(F, D)
  (:action step30-stack-F-D
    :parameters ()
    :precondition (and (done29) (holding F) (clear D))
    :effect (and
      (on F D)
      (not (clear D))
      (not (holding F))
      (handempty)
      (clear F)
      (not (ontable F))
      (not (done29)) (done30)
    )
  )
)