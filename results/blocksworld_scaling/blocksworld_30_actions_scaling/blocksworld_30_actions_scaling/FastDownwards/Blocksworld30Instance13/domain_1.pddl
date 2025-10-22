(define (domain blocksworld_seq)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (allow1) (allow2) (allow3) (allow4) (allow5) (allow6) (allow7) (allow8) (allow9) (allow10)
    (allow11) (allow12) (allow13) (allow14) (allow15) (allow16) (allow17) (allow18) (allow19) (allow20)
    (allow21) (allow22) (allow23) (allow24) (allow25) (allow26) (allow27) (allow28) (allow29) (allow30)
    (allow31)
  )

  ;; 1. unstack(F, H)
  (:action step1-unstack-F-H
    :precondition (and (allow1) (on F H) (clear F) (handempty))
    :effect (and (not (on F H)) (not (handempty)) (holding F) (clear H) (not (clear F))
                 (not (allow1)) (allow2))
  )

  ;; 2. stack(F, A)
  (:action step2-stack-F-A
    :precondition (and (allow2) (holding F) (clear A))
    :effect (and (on F A) (clear F) (not (clear A)) (handempty) (not (holding F))
                 (not (allow2)) (allow3))
  )

  ;; 3. unstack(J, E)
  (:action step3-unstack-J-E
    :precondition (and (allow3) (on J E) (clear J) (handempty))
    :effect (and (not (on J E)) (not (handempty)) (holding J) (clear E) (not (clear J))
                 (not (allow3)) (allow4))
  )

  ;; 4. stack(J, F)
  (:action step4-stack-J-F
    :precondition (and (allow4) (holding J) (clear F))
    :effect (and (on J F) (clear J) (not (clear F)) (handempty) (not (holding J))
                 (not (allow4)) (allow5))
  )

  ;; 5. unstack(E, I)
  (:action step5-unstack-E-I
    :precondition (and (allow5) (on E I) (clear E) (handempty))
    :effect (and (not (on E I)) (not (handempty)) (holding E) (clear I) (not (clear E))
                 (not (allow5)) (allow6))
  )

  ;; 6. stack(E, I)
  (:action step6-stack-E-I
    :precondition (and (allow6) (holding E) (clear I))
    :effect (and (on E I) (clear E) (not (clear I)) (handempty) (not (holding E))
                 (not (allow6)) (allow7))
  )

  ;; 7. pickup(H)
  (:action step7-pickup-H
    :precondition (and (allow7) (ontable H) (clear H) (handempty))
    :effect (and (not (ontable H)) (not (handempty)) (holding H) (not (clear H))
                 (not (allow7)) (allow8))
  )

  ;; 8. stack(H, J)
  (:action step8-stack-H-J
    :precondition (and (allow8) (holding H) (clear J))
    :effect (and (on H J) (clear H) (not (clear J)) (handempty) (not (holding H))
                 (not (allow8)) (allow9))
  )

  ;; 9. unstack(G, D)
  (:action step9-unstack-G-D
    :precondition (and (allow9) (on G D) (clear G) (handempty))
    :effect (and (not (on G D)) (not (handempty)) (holding G) (clear D) (not (clear G))
                 (not (allow9)) (allow10))
  )

  ;; 10. stack(G, E)
  (:action step10-stack-G-E
    :precondition (and (allow10) (holding G) (clear E))
    :effect (and (on G E) (clear G) (not (clear E)) (handempty) (not (holding G))
                 (not (allow10)) (allow11))
  )

  ;; 11. unstack(G, E)
  (:action step11-unstack-G-E
    :precondition (and (allow11) (on G E) (clear G) (handempty))
    :effect (and (not (on G E)) (not (handempty)) (holding G) (clear E) (not (clear G))
                 (not (allow11)) (allow12))
  )

  ;; 12. putdown(G)
  (:action step12-putdown-G
    :precondition (and (allow12) (holding G))
    :effect (and (ontable G) (clear G) (handempty) (not (holding G))
                 (not (allow12)) (allow13))
  )

  ;; 13. pickup(G)
  (:action step13-pickup-G
    :precondition (and (allow13) (ontable G) (clear G) (handempty))
    :effect (and (not (ontable G)) (not (handempty)) (holding G) (not (clear G))
                 (not (allow13)) (allow14))
  )

  ;; 14. stack(G, E)
  (:action step14-stack-G-E
    :precondition (and (allow14) (holding G) (clear E))
    :effect (and (on G E) (clear G) (not (clear E)) (handempty) (not (holding G))
                 (not (allow14)) (allow15))
  )

  ;; 15. unstack(G, E)
  (:action step15-unstack-G-E
    :precondition (and (allow15) (on G E) (clear G) (handempty))
    :effect (and (not (on G E)) (not (handempty)) (holding G) (clear E) (not (clear G))
                 (not (allow15)) (allow16))
  )

  ;; 16. putdown(G)
  (:action step16-putdown-G
    :precondition (and (allow16) (holding G))
    :effect (and (ontable G) (clear G) (handempty) (not (holding G))
                 (not (allow16)) (allow17))
  )

  ;; 17. pickup(G)
  (:action step17-pickup-G
    :precondition (and (allow17) (ontable G) (clear G) (handempty))
    :effect (and (not (ontable G)) (not (handempty)) (holding G) (not (clear G))
                 (not (allow17)) (allow18))
  )

  ;; 18. stack(G, H)
  (:action step18-stack-G-H
    :precondition (and (allow18) (holding G) (clear H))
    :effect (and (on G H) (clear G) (not (clear H)) (handempty) (not (holding G))
                 (not (allow18)) (allow19))
  )

  ;; 19. unstack(D, B)
  (:action step19-unstack-D-B
    :precondition (and (allow19) (on D B) (clear D) (handempty))
    :effect (and (not (on D B)) (not (handempty)) (holding D) (clear B) (not (clear D))
                 (not (allow19)) (allow20))
  )

  ;; 20. putdown(D)
  (:action step20-putdown-D
    :precondition (and (allow20) (holding D))
    :effect (and (ontable D) (clear D) (handempty) (not (holding D))
                 (not (allow20)) (allow21))
  )

  ;; 21. pickup(B)
  (:action step21-pickup-B
    :precondition (and (allow21) (ontable B) (clear B) (handempty))
    :effect (and (not (ontable B)) (not (handempty)) (holding B) (not (clear B))
                 (not (allow21)) (allow22))
  )

  ;; 22. putdown(B)
  (:action step22-putdown-B
    :precondition (and (allow22) (holding B))
    :effect (and (ontable B) (clear B) (handempty) (not (holding B))
                 (not (allow22)) (allow23))
  )

  ;; 23. unstack(G, H)
  (:action step23-unstack-G-H
    :precondition (and (allow23) (on G H) (clear G) (handempty))
    :effect (and (not (on G H)) (not (handempty)) (holding G) (clear H) (not (clear G))
                 (not (allow23)) (allow24))
  )

  ;; 24. putdown(G)
  (:action step24-putdown-G
    :precondition (and (allow24) (holding G))
    :effect (and (ontable G) (clear G) (handempty) (not (holding G))
                 (not (allow24)) (allow25))
  )

  ;; 25. unstack(E, I)
  (:action step25-unstack-E-I
    :precondition (and (allow25) (on E I) (clear E) (handempty))
    :effect (and (not (on E I)) (not (handempty)) (holding E) (clear I) (not (clear E))
                 (not (allow25)) (allow26))
  )

  ;; 26. stack(E, G)
  (:action step26-stack-E-G
    :precondition (and (allow26) (holding E) (clear G))
    :effect (and (on E G) (clear E) (not (clear G)) (handempty) (not (holding E))
                 (not (allow26)) (allow27))
  )

  ;; 27. pickup(I)
  (:action step27-pickup-I
    :precondition (and (allow27) (ontable I) (clear I) (handempty))
    :effect (and (not (ontable I)) (not (handempty)) (holding I) (not (clear I))
                 (not (allow27)) (allow28))
  )

  ;; 28. stack(I, E)
  (:action step28-stack-I-E
    :precondition (and (allow28) (holding I) (clear E))
    :effect (and (on I E) (clear I) (not (clear E)) (handempty) (not (holding I))
                 (not (allow28)) (allow29))
  )

  ;; 29. unstack(H, J)
  (:action step29-unstack-H-J
    :precondition (and (allow29) (on H J) (clear H) (handempty))
    :effect (and (not (on H J)) (not (handempty)) (holding H) (clear J) (not (clear H))
                 (not (allow29)) (allow30))
  )

  ;; 30. stack(H, B)
  (:action step30-stack-H-B
    :precondition (and (allow30) (holding H) (clear B))
    :effect (and (on H B) (clear H) (not (clear B)) (handempty) (not (holding H))
                 (not (allow30)) (allow31))
  )

)