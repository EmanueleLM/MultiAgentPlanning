(define (domain blocksworld-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (step ?s - step)
  )

  ;; 1. unstack(G, J)
  (:action a1-unstack-G-J
    :precondition (and (step step0) (on G J) (clear G) (handempty))
    :effect (and
      (not (on G J))
      (clear J)
      (holding G)
      (not (clear G))
      (not (handempty))
      (not (step step0))
      (step step1)
    )
  )

  ;; 2. putdown(G)
  (:action a2-putdown-G
    :precondition (and (step step1) (holding G))
    :effect (and
      (ontable G)
      (clear G)
      (not (holding G))
      (handempty)
      (not (step step1))
      (step step2)
    )
  )

  ;; 3. pickup(E)
  (:action a3-pickup-E
    :precondition (and (step step2) (ontable E) (clear E) (handempty))
    :effect (and
      (not (ontable E))
      (not (clear E))
      (holding E)
      (not (handempty))
      (not (step step2))
      (step step3)
    )
  )

  ;; 4. stack(E, A)
  (:action a4-stack-E-A
    :precondition (and (step step3) (holding E) (clear A))
    :effect (and
      (on E A)
      (clear E)
      (not (clear A))
      (not (holding E))
      (handempty)
      (not (step step3))
      (step step4)
    )
  )

  ;; 5. unstack(J, C)
  (:action a5-unstack-J-C
    :precondition (and (step step4) (on J C) (clear J) (handempty))
    :effect (and
      (not (on J C))
      (clear C)
      (holding J)
      (not (clear J))
      (not (handempty))
      (not (step step4))
      (step step5)
    )
  )

  ;; 6. stack(J, D)
  (:action a6-stack-J-D
    :precondition (and (step step5) (holding J) (clear D))
    :effect (and
      (on J D)
      (clear J)
      (not (clear D))
      (not (holding J))
      (handempty)
      (not (step step5))
      (step step6)
    )
  )

  ;; 7. pickup(B)
  (:action a7-pickup-B
    :precondition (and (step step6) (ontable B) (clear B) (handempty))
    :effect (and
      (not (ontable B))
      (not (clear B))
      (holding B)
      (not (handempty))
      (not (step step6))
      (step step7)
    )
  )

  ;; 8. stack(B, E)
  (:action a8-stack-B-E
    :precondition (and (step step7) (holding B) (clear E))
    :effect (and
      (on B E)
      (clear B)
      (not (clear E))
      (not (holding B))
      (handempty)
      (not (step step7))
      (step step8)
    )
  )

  ;; 9. unstack(C, F)
  (:action a9-unstack-C-F
    :precondition (and (step step8) (on C F) (clear C) (handempty))
    :effect (and
      (not (on C F))
      (clear F)
      (holding C)
      (not (clear C))
      (not (handempty))
      (not (step step8))
      (step step9)
    )
  )

  ;; 10. stack(C, F)
  (:action a10-stack-C-F
    :precondition (and (step step9) (holding C) (clear F))
    :effect (and
      (on C F)
      (clear C)
      (not (clear F))
      (not (holding C))
      (handempty)
      (not (step step9))
      (step step10)
    )
  )

  ;; 11. unstack(J, D)
  (:action a11-unstack-J-D
    :precondition (and (step step10) (on J D) (clear J) (handempty))
    :effect (and
      (not (on J D))
      (clear D)
      (holding J)
      (not (clear J))
      (not (handempty))
      (not (step step10))
      (step step11)
    )
  )

  ;; 12. stack(J, B)
  (:action a12-stack-J-B
    :precondition (and (step step11) (holding J) (clear B))
    :effect (and
      (on J B)
      (clear J)
      (not (clear B))
      (not (holding J))
      (handempty)
      (not (step step11))
      (step step12)
    )
  )

  ;; 13. pickup(D)
  (:action a13-pickup-D
    :precondition (and (step step12) (ontable D) (clear D) (handempty))
    :effect (and
      (not (ontable D))
      (not (clear D))
      (holding D)
      (not (handempty))
      (not (step step12))
      (step step13)
    )
  )

  ;; 14. putdown(D)
  (:action a14-putdown-D
    :precondition (and (step step13) (holding D))
    :effect (and
      (ontable D)
      (clear D)
      (not (holding D))
      (handempty)
      (not (step step13))
      (step step14)
    )
  )

  ;; 15. unstack(C, F)
  (:action a15-unstack-C-F
    :precondition (and (step step14) (on C F) (clear C) (handempty))
    :effect (and
      (not (on C F))
      (clear F)
      (holding C)
      (not (clear C))
      (not (handempty))
      (not (step step14))
      (step step15)
    )
  )

  ;; 16. stack(C, F)
  (:action a16-stack-C-F
    :precondition (and (step step15) (holding C) (clear F))
    :effect (and
      (on C F)
      (clear C)
      (not (clear F))
      (not (holding C))
      (handempty)
      (not (step step15))
      (step step16)
    )
  )

  ;; 17. unstack(J, B)
  (:action a17-unstack-J-B
    :precondition (and (step step16) (on J B) (clear J) (handempty))
    :effect (and
      (not (on J B))
      (clear B)
      (holding J)
      (not (clear J))
      (not (handempty))
      (not (step step16))
      (step step17)
    )
  )

  ;; 18. stack(J, C)
  (:action a18-stack-J-C
    :precondition (and (step step17) (holding J) (clear C))
    :effect (and
      (on J C)
      (clear J)
      (not (clear C))
      (not (holding J))
      (handempty)
      (not (step step17))
      (step step18)
    )
  )

  ;; 19. pickup(G)
  (:action a19-pickup-G
    :precondition (and (step step18) (ontable G) (clear G) (handempty))
    :effect (and
      (not (ontable G))
      (not (clear G))
      (holding G)
      (not (handempty))
      (not (step step18))
      (step step19)
    )
  )

  ;; 20. stack(G, D)
  (:action a20-stack-G-D
    :precondition (and (step step19) (holding G) (clear D))
    :effect (and
      (on G D)
      (clear G)
      (not (clear D))
      (not (holding G))
      (handempty)
      (not (step step19))
      (step step20)
    )
  )

)