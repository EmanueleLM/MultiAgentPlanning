(define (domain blocksworld_observed)
  (:requirements :typing :negative-preconditions)
  (:types block)
  (:constants A B C D E F G H I J K - block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (done1)
    (done2)
    (done3)
    (done4)
    (done5)
    (done6)
    (done7)
    (done8)
    (done9)
    (done10)
    (done11)
    (done12)
    (done13)
    (done14)
    (done15)
    (done16)
    (done17)
    (done18)
    (done19)
    (done20)
    (done21)
    (done22)
    (done23)
    (done24)
    (done25)
    (done26)
    (done27)
    (done28)
    (done29)
    (done30)
  )

  ;; Step 1: pickup(H) from table
  (:action step1
    :parameters ()
    :precondition (and (ontable H) (clear H) (handempty))
    :effect (and
      (not (ontable H))
      (not (clear H))
      (not (handempty))
      (holding H)
      (done1)
    )
  )

  ;; Step 2: stack(H, F)
  (:action step2
    :parameters ()
    :precondition (and (done1) (holding H) (clear F))
    :effect (and
      (not (holding H))
      (handempty)
      (on H F)
      (not (clear F))
      (clear H)
      (done2)
    )
  )

  ;; Step 3: unstack(H, F)
  (:action step3
    :parameters ()
    :precondition (and (done2) (on H F) (clear H) (handempty))
    :effect (and
      (not (on H F))
      (clear F)
      (not (clear H))
      (not (handempty))
      (holding H)
      (done3)
    )
  )

  ;; Step 4: stack(H, I)
  (:action step4
    :parameters ()
    :precondition (and (done3) (holding H) (clear I))
    :effect (and
      (not (holding H))
      (handempty)
      (on H I)
      (not (clear I))
      (clear H)
      (done4)
    )
  )

  ;; Step 5: unstack(H, I)
  (:action step5
    :parameters ()
    :precondition (and (done4) (on H I) (clear H) (handempty))
    :effect (and
      (not (on H I))
      (clear I)
      (not (clear H))
      (not (handempty))
      (holding H)
      (done5)
    )
  )

  ;; Step 6: stack(H, I)
  (:action step6
    :parameters ()
    :precondition (and (done5) (holding H) (clear I))
    :effect (and
      (not (holding H))
      (handempty)
      (on H I)
      (not (clear I))
      (clear H)
      (done6)
    )
  )

  ;; Step 7: unstack(H, I)
  (:action step7
    :parameters ()
    :precondition (and (done6) (on H I) (clear H) (handempty))
    :effect (and
      (not (on H I))
      (clear I)
      (not (clear H))
      (not (handempty))
      (holding H)
      (done7)
    )
  )

  ;; Step 8: stack(H, I)
  (:action step8
    :parameters ()
    :precondition (and (done7) (holding H) (clear I))
    :effect (and
      (not (holding H))
      (handempty)
      (on H I)
      (not (clear I))
      (clear H)
      (done8)
    )
  )

  ;; Step 9: unstack(H, I)
  (:action step9
    :parameters ()
    :precondition (and (done8) (on H I) (clear H) (handempty))
    :effect (and
      (not (on H I))
      (clear I)
      (not (clear H))
      (not (handempty))
      (holding H)
      (done9)
    )
  )

  ;; Step 10: putdown(H)
  (:action step10
    :parameters ()
    :precondition (and (done9) (holding H))
    :effect (and
      (ontable H)
      (not (holding H))
      (handempty)
      (clear H)
      (done10)
    )
  )

  ;; Step 11: unstack(I, C)
  (:action step11
    :parameters ()
    :precondition (and (done10) (on I C) (clear I) (handempty))
    :effect (and
      (not (on I C))
      (clear C)
      (not (clear I))
      (not (handempty))
      (holding I)
      (done11)
    )
  )

  ;; Step 12: putdown(I)
  (:action step12
    :parameters ()
    :precondition (and (done11) (holding I))
    :effect (and
      (ontable I)
      (not (holding I))
      (handempty)
      (clear I)
      (done12)
    )
  )

  ;; Step 13: unstack(C, J)
  (:action step13
    :parameters ()
    :precondition (and (done12) (on C J) (clear C) (handempty))
    :effect (and
      (not (on C J))
      (clear J)
      (not (clear C))
      (not (handempty))
      (holding C)
      (done13)
    )
  )

  ;; Step 14: stack(C, F)
  (:action step14
    :parameters ()
    :precondition (and (done13) (holding C) (clear F))
    :effect (and
      (not (holding C))
      (handempty)
      (on C F)
      (not (clear F))
      (clear C)
      (done14)
    )
  )

  ;; Step 15: unstack(J, E)
  (:action step15
    :parameters ()
    :precondition (and (done14) (on J E) (clear J) (handempty))
    :effect (and
      (not (on J E))
      (clear E)
      (not (clear J))
      (not (handempty))
      (holding J)
      (done15)
    )
  )

  ;; Step 16: stack(J, H)
  (:action step16
    :parameters ()
    :precondition (and (done15) (holding J) (clear H))
    :effect (and
      (not (holding J))
      (handempty)
      (on J H)
      (not (clear H))
      (clear J)
      (done16)
    )
  )

  ;; Step 17: pickup(I) from table
  (:action step17
    :parameters ()
    :precondition (and (done16) (ontable I) (clear I) (handempty))
    :effect (and
      (not (ontable I))
      (not (clear I))
      (not (handempty))
      (holding I)
      (done17)
    )
  )

  ;; Step 18: stack(I, C)
  (:action step18
    :parameters ()
    :precondition (and (done17) (holding I) (clear C))
    :effect (and
      (not (holding I))
      (handempty)
      (on I C)
      (not (clear C))
      (clear I)
      (done18)
    )
  )

  ;; Step 19: pickup(E) from table
  (:action step19
    :parameters ()
    :precondition (and (done18) (ontable E) (clear E) (handempty))
    :effect (and
      (not (ontable E))
      (not (clear E))
      (not (handempty))
      (holding E)
      (done19)
    )
  )

  ;; Step 20: stack(E, J)
  (:action step20
    :parameters ()
    :precondition (and (done19) (holding E) (clear J))
    :effect (and
      (not (holding E))
      (handempty)
      (on E J)
      (not (clear J))
      (clear E)
      (done20)
    )
  )

  ;; Step 21: unstack(E, J)
  (:action step21
    :parameters ()
    :precondition (and (done20) (on E J) (clear E) (handempty))
    :effect (and
      (not (on E J))
      (clear J)
      (not (clear E))
      (not (handempty))
      (holding E)
      (done21)
    )
  )

  ;; Step 22: stack(E, I)
  (:action step22
    :parameters ()
    :precondition (and (done21) (holding E) (clear I))
    :effect (and
      (not (holding E))
      (handempty)
      (on E I)
      (not (clear I))
      (clear E)
      (done22)
    )
  )

  ;; Step 23: unstack(E, I)
  (:action step23
    :parameters ()
    :precondition (and (done22) (on E I) (clear E) (handempty))
    :effect (and
      (not (on E I))
      (clear I)
      (not (clear E))
      (not (handempty))
      (holding E)
      (done23)
    )
  )

  ;; Step 24: putdown(E)
  (:action step24
    :parameters ()
    :precondition (and (done23) (holding E))
    :effect (and
      (ontable E)
      (not (holding E))
      (handempty)
      (clear E)
      (done24)
    )
  )

  ;; Step 25: unstack(I, C)
  (:action step25
    :parameters ()
    :precondition (and (done24) (on I C) (clear I) (handempty))
    :effect (and
      (not (on I C))
      (clear C)
      (not (clear I))
      (not (handempty))
      (holding I)
      (done25)
    )
  )

  ;; Step 26: stack(I, E)
  (:action step26
    :parameters ()
    :precondition (and (done25) (holding I) (clear E))
    :effect (and
      (not (holding I))
      (handempty)
      (on I E)
      (not (clear E))
      (clear I)
      (done26)
    )
  )

  ;; Step 27: unstack(J, H)
  (:action step27
    :parameters ()
    :precondition (and (done26) (on J H) (clear J) (handempty))
    :effect (and
      (not (on J H))
      (clear H)
      (not (clear J))
      (not (handempty))
      (holding J)
      (done27)
    )
  )

  ;; Step 28: stack(J, H)
  (:action step28
    :parameters ()
    :precondition (and (done27) (holding J) (clear H))
    :effect (and
      (not (holding J))
      (handempty)
      (on J H)
      (not (clear H))
      (clear J)
      (done28)
    )
  )

  ;; Step 29: unstack(J, H)
  (:action step29
    :parameters ()
    :precondition (and (done28) (on J H) (clear J) (handempty))
    :effect (and
      (not (on J H))
      (clear H)
      (not (clear J))
      (not (handempty))
      (holding J)
      (done29)
    )
  )

  ;; Step 30: stack(J, C)
  (:action step30
    :parameters ()
    :precondition (and (done29) (holding J) (clear C))
    :effect (and
      (not (holding J))
      (handempty)
      (on J C)
      (not (clear C))
      (clear J)
      (done30)
    )
  )
)