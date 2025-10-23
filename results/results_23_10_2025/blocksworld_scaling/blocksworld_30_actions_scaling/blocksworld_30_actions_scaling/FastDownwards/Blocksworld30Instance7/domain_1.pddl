(define (domain blocksworld_sequence)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (on ?x ?y)         ; ?x on ?y (both blocks)
    (ontable ?x)       ; ?x directly on the table
    (clear ?x)         ; nothing on ?x
    (holding ?x)       ; the gripper holds ?x
    (handempty)        ; gripper is empty
    (current-step ?s)  ; sequencing token: which step is current
  )

  ;; 1. pickup(I)
  (:action step1-pickup-I
    :precondition (and (ontable I) (clear I) (handempty) (current-step step0))
    :effect (and
      (not (ontable I))
      (not (clear I))
      (not (handempty))
      (holding I)
      (not (current-step step0))
      (current-step step1)
    )
  )

  ;; 2. putdown(I)
  (:action step2-putdown-I
    :precondition (and (holding I) (current-step step1))
    :effect (and
      (ontable I)
      (clear I)
      (handempty)
      (not (holding I))
      (not (current-step step1))
      (current-step step2)
    )
  )

  ;; 3. unstack(D,H)
  (:action step3-unstack-D-H
    :precondition (and (on D H) (clear D) (handempty) (current-step step2))
    :effect (and
      (holding D)
      (not (on D H))
      (clear H)
      (not (handempty))
      (not (clear D))
      (not (current-step step2))
      (current-step step3)
    )
  )

  ;; 4. stack(D,C)
  (:action step4-stack-D-C
    :precondition (and (holding D) (clear C) (current-step step3))
    :effect (and
      (on D C)
      (clear D)
      (handempty)
      (not (holding D))
      (not (clear C))
      (not (current-step step3))
      (current-step step4)
    )
  )

  ;; 5. pickup(I)
  (:action step5-pickup-I
    :precondition (and (ontable I) (clear I) (handempty) (current-step step4))
    :effect (and
      (not (ontable I))
      (not (clear I))
      (not (handempty))
      (holding I)
      (not (current-step step4))
      (current-step step5)
    )
  )

  ;; 6. stack(I,B)
  (:action step6-stack-I-B
    :precondition (and (holding I) (clear B) (current-step step5))
    :effect (and
      (on I B)
      (clear I)
      (handempty)
      (not (holding I))
      (not (clear B))
      (not (current-step step5))
      (current-step step6)
    )
  )

  ;; 7. unstack(D,C)
  (:action step7-unstack-D-C
    :precondition (and (on D C) (clear D) (handempty) (current-step step6))
    :effect (and
      (holding D)
      (not (on D C))
      (clear C)
      (not (handempty))
      (not (clear D))
      (not (current-step step6))
      (current-step step7)
    )
  )

  ;; 8. stack(D,I)
  (:action step8-stack-D-I
    :precondition (and (holding D) (clear I) (current-step step7))
    :effect (and
      (on D I)
      (clear D)
      (handempty)
      (not (holding D))
      (not (clear I))
      (not (current-step step7))
      (current-step step8)
    )
  )

  ;; 9. unstack(D,I)
  (:action step9-unstack-D-I
    :precondition (and (on D I) (clear D) (handempty) (current-step step8))
    :effect (and
      (holding D)
      (not (on D I))
      (clear I)
      (not (handempty))
      (not (clear D))
      (not (current-step step8))
      (current-step step9)
    )
  )

  ;; 10. stack(D,H)
  (:action step10-stack-D-H
    :precondition (and (holding D) (clear H) (current-step step9))
    :effect (and
      (on D H)
      (clear D)
      (handempty)
      (not (holding D))
      (not (clear H))
      (not (current-step step9))
      (current-step step10)
    )
  )

  ;; 11. pickup(C)
  (:action step11-pickup-C
    :precondition (and (ontable C) (clear C) (handempty) (current-step step10))
    :effect (and
      (not (ontable C))
      (not (clear C))
      (not (handempty))
      (holding C)
      (not (current-step step10))
      (current-step step11)
    )
  )

  ;; 12. stack(C,I)
  (:action step12-stack-C-I
    :precondition (and (holding C) (clear I) (current-step step11))
    :effect (and
      (on C I)
      (clear C)
      (handempty)
      (not (holding C))
      (not (clear I))
      (not (current-step step11))
      (current-step step12)
    )
  )

  ;; 13. unstack(C,I)
  (:action step13-unstack-C-I
    :precondition (and (on C I) (clear C) (handempty) (current-step step12))
    :effect (and
      (holding C)
      (not (on C I))
      (clear I)
      (not (handempty))
      (not (clear C))
      (not (current-step step12))
      (current-step step13)
    )
  )

  ;; 14. stack(C,I)
  (:action step14-stack-C-I
    :precondition (and (holding C) (clear I) (current-step step13))
    :effect (and
      (on C I)
      (clear C)
      (handempty)
      (not (holding C))
      (not (clear I))
      (not (current-step step13))
      (current-step step14)
    )
  )

  ;; 15. unstack(D,H)
  (:action step15-unstack-D-H
    :precondition (and (on D H) (clear D) (handempty) (current-step step14))
    :effect (and
      (holding D)
      (not (on D H))
      (clear H)
      (not (handempty))
      (not (clear D))
      (not (current-step step14))
      (current-step step15)
    )
  )

  ;; 16. stack(D,C)
  (:action step16-stack-D-C
    :precondition (and (holding D) (clear C) (current-step step15))
    :effect (and
      (on D C)
      (clear D)
      (handempty)
      (not (holding D))
      (not (clear C))
      (not (current-step step15))
      (current-step step16)
    )
  )

  ;; 17. unstack(D,C)
  (:action step17-unstack-D-C
    :precondition (and (on D C) (clear D) (handempty) (current-step step16))
    :effect (and
      (holding D)
      (not (on D C))
      (clear C)
      (not (handempty))
      (not (clear D))
      (not (current-step step16))
      (current-step step17)
    )
  )

  ;; 18. putdown(D)
  (:action step18-putdown-D
    :precondition (and (holding D) (current-step step17))
    :effect (and
      (ontable D)
      (clear D)
      (handempty)
      (not (holding D))
      (not (current-step step17))
      (current-step step18)
    )
  )

  ;; 19. unstack(C,I)
  (:action step19-unstack-C-I
    :precondition (and (on C I) (clear C) (handempty) (current-step step18))
    :effect (and
      (holding C)
      (not (on C I))
      (clear I)
      (not (handempty))
      (not (clear C))
      (not (current-step step18))
      (current-step step19)
    )
  )

  ;; 20. stack(C,H)
  (:action step20-stack-C-H
    :precondition (and (holding C) (clear H) (current-step step19))
    :effect (and
      (on C H)
      (clear C)
      (handempty)
      (not (clear H))
      (not (current-step step19))
      (current-step step20)
    )
  )

  ;; 21. pickup(D)
  (:action step21-pickup-D
    :precondition (and (ontable D) (clear D) (handempty) (current-step step20))
    :effect (and
      (not (ontable D))
      (not (clear D))
      (not (handempty))
      (holding D)
      (not (current-step step20))
      (current-step step21)
    )
  )

  ;; 22. stack(D,C)
  (:action step22-stack-D-C
    :precondition (and (holding D) (clear C) (current-step step21))
    :effect (and
      (on D C)
      (clear D)
      (handempty)
      (not (holding D))
      (not (clear C))
      (not (current-step step21))
      (current-step step22)
    )
  )

  ;; 23. unstack(D,C)
  (:action step23-unstack-D-C
    :precondition (and (on D C) (clear D) (handempty) (current-step step22))
    :effect (and
      (holding D)
      (not (on D C))
      (clear C)
      (not (handempty))
      (not (clear D))
      (not (current-step step22))
      (current-step step23)
    )
  )

  ;; 24. putdown(D)
  (:action step24-putdown-D
    :precondition (and (holding D) (current-step step23))
    :effect (and
      (ontable D)
      (clear D)
      (handempty)
      (not (holding D))
      (not (current-step step23))
      (current-step step24)
    )
  )

  ;; 25. unstack(I,B)
  (:action step25-unstack-I-B
    :precondition (and (on I B) (clear I) (handempty) (current-step step24))
    :effect (and
      (holding I)
      (not (on I B))
      (clear B)
      (not (handempty))
      (not (clear I))
      (not (current-step step24))
      (current-step step25)
    )
  )

  ;; 26. stack(I,D)
  (:action step26-stack-I-D
    :precondition (and (holding I) (clear D) (current-step step25))
    :effect (and
      (on I D)
      (clear I)
      (handempty)
      (not (holding I))
      (not (clear D))
      (not (current-step step25))
      (current-step step26)
    )
  )

  ;; 27. unstack(I,D)
  (:action step27-unstack-I-D
    :precondition (and (on I D) (clear I) (handempty) (current-step step26))
    :effect (and
      (holding I)
      (not (on I D))
      (clear D)
      (not (handempty))
      (not (clear I))
      (not (current-step step26))
      (current-step step27)
    )
  )

  ;; 28. stack(I,C)
  (:action step28-stack-I-C
    :precondition (and (holding I) (clear C) (current-step step27))
    :effect (and
      (on I C)
      (clear I)
      (handempty)
      (not (holding I))
      (not (clear C))
      (not (current-step step27))
      (current-step step28)
    )
  )

  ;; 29. pickup(D)
  (:action step29-pickup-D
    :precondition (and (ontable D) (clear D) (handempty) (current-step step28))
    :effect (and
      (not (ontable D))
      (not (clear D))
      (not (handempty))
      (holding D)
      (not (current-step step28))
      (current-step step29)
    )
  )

  ;; 30. stack(D,I)
  (:action step30-stack-D-I
    :precondition (and (holding D) (clear I) (current-step step29))
    :effect (and
      (on D I)
      (clear D)
      (handempty)
      (not (holding D))
      (not (clear I))
      (not (current-step step29))
      (current-step step30)
    )
  )
)