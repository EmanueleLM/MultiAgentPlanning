(define (domain blocks-multiagent-ordered-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)

    ;; step completion flags to enforce the exact given order
    (step0_done)
    (step1_done) (step2_done) (step3_done) (step4_done) (step5_done)
    (step6_done) (step7_done) (step8_done) (step9_done) (step10_done)
    (step11_done) (step12_done) (step13_done) (step14_done) (step15_done)
    (step16_done) (step17_done) (step18_done) (step19_done) (step20_done)
    (step21_done) (step22_done) (step23_done) (step24_done) (step25_done)
    (step26_done) (step27_done) (step28_done) (step29_done) (step30_done)
    (step31_done) (step32_done) (step33_done) (step34_done) (step35_done)
    (step36_done) (step37_done) (step38_done) (step39_done) (step40_done)
  )

  ;; Each domain action corresponds to one listed action in the exact sequence.
  ;; Each action requires the previous step flag to be true, and sets its step flag.
  ;; Actions manipulate the BlocksWorld predicates so the world evolves exactly.
  ;; The agent parameter ?a is the single worker executing the sequence.

  ;; 1. unstack(F, B)
  (:action step1-unstack-F-B
    :parameters (?a - agent)
    :precondition (and (step0_done) (on F B) (clear F) (handempty ?a))
    :effect (and
      (holding ?a F)
      (clear B)
      (not (on F B))
      (not (clear F))
      (not (handempty ?a))
      (step1_done)
    )
  )

  ;; 2. putdown(F)
  (:action step2-putdown-F
    :parameters (?a - agent)
    :precondition (and (step1_done) (holding ?a F))
    :effect (and
      (ontable F)
      (clear F)
      (handempty ?a)
      (not (holding ?a F))
      (step2_done)
    )
  )

  ;; 3. unstack(G, E)
  (:action step3-unstack-G-E
    :parameters (?a - agent)
    :precondition (and (step2_done) (on G E) (clear G) (handempty ?a))
    :effect (and
      (holding ?a G)
      (clear E)
      (not (on G E))
      (not (clear G))
      (not (handempty ?a))
      (step3_done)
    )
  )

  ;; 4. stack(G, F)
  (:action step4-stack-G-F
    :parameters (?a - agent)
    :precondition (and (step3_done) (holding ?a G) (clear F))
    :effect (and
      (on G F)
      (not (clear F))
      (clear G)
      (handempty ?a)
      (not (holding ?a G))
      (step4_done)
    )
  )

  ;; 5. pickup(E)
  (:action step5-pickup-E
    :parameters (?a - agent)
    :precondition (and (step4_done) (ontable E) (clear E) (handempty ?a))
    :effect (and
      (holding ?a E)
      (not (ontable E))
      (not (clear E))
      (not (handempty ?a))
      (step5_done)
    )
  )

  ;; 6. stack(E, D)
  (:action step6-stack-E-D
    :parameters (?a - agent)
    :precondition (and (step5_done) (holding ?a E) (clear D))
    :effect (and
      (on E D)
      (not (clear D))
      (clear E)
      (handempty ?a)
      (not (holding ?a E))
      (step6_done)
    )
  )

  ;; 7. unstack(G, F)
  (:action step7-unstack-G-F
    :parameters (?a - agent)
    :precondition (and (step6_done) (on G F) (clear G) (handempty ?a))
    :effect (and
      (holding ?a G)
      (clear F)
      (not (on G F))
      (not (clear G))
      (not (handempty ?a))
      (step7_done)
    )
  )

  ;; 8. putdown(G)
  (:action step8-putdown-G
    :parameters (?a - agent)
    :precondition (and (step7_done) (holding ?a G))
    :effect (and
      (ontable G)
      (clear G)
      (handempty ?a)
      (not (holding ?a G))
      (step8_done)
    )
  )

  ;; 9. pickup(G)
  (:action step9-pickup-G
    :parameters (?a - agent)
    :precondition (and (step8_done) (ontable G) (clear G) (handempty ?a))
    :effect (and
      (holding ?a G)
      (not (ontable G))
      (not (clear G))
      (not (handempty ?a))
      (step9_done)
    )
  )

  ;; 10. putdown(G)
  (:action step10-putdown-G
    :parameters (?a - agent)
    :precondition (and (step9_done) (holding ?a G))
    :effect (and
      (ontable G)
      (clear G)
      (handempty ?a)
      (not (holding ?a G))
      (step10_done)
    )
  )

  ;; 11. unstack(B, J)
  (:action step11-unstack-B-J
    :parameters (?a - agent)
    :precondition (and (step10_done) (on B J) (clear B) (handempty ?a))
    :effect (and
      (holding ?a B)
      (clear J)
      (not (on B J))
      (not (clear B))
      (not (handempty ?a))
      (step11_done)
    )
  )

  ;; 12. stack(B, E)
  (:action step12-stack-B-E
    :parameters (?a - agent)
    :precondition (and (step11_done) (holding ?a B) (clear E))
    :effect (and
      (on B E)
      (not (clear E))
      (clear B)
      (handempty ?a)
      (not (holding ?a B))
      (step12_done)
    )
  )

  ;; 13. pickup(F)
  (:action step13-pickup-F
    :parameters (?a - agent)
    :precondition (and (step12_done) (ontable F) (clear F) (handempty ?a))
    :effect (and
      (holding ?a F)
      (not (ontable F))
      (not (clear F))
      (not (handempty ?a))
      (step13_done)
    )
  )

  ;; 14. stack(F, B)
  (:action step14-stack-F-B
    :parameters (?a - agent)
    :precondition (and (step13_done) (holding ?a F) (clear B))
    :effect (and
      (on F B)
      (not (clear B))
      (clear F)
      (handempty ?a)
      (not (holding ?a F))
      (step14_done)
    )
  )

  ;; 15. unstack(F, B)
  (:action step15-unstack-F-B
    :parameters (?a - agent)
    :precondition (and (step14_done) (on F B) (clear F) (handempty ?a))
    :effect (and
      (holding ?a F)
      (clear B)
      (not (on F B))
      (not (clear F))
      (not (handempty ?a))
      (step15_done)
    )
  )

  ;; 16. stack(F, G)
  (:action step16-stack-F-G
    :parameters (?a - agent)
    :precondition (and (step15_done) (holding ?a F) (clear G))
    :effect (and
      (on F G)
      (not (clear G))
      (clear F)
      (handempty ?a)
      (not (holding ?a F))
      (step16_done)
    )
  )

  ;; 17. unstack(F, G)
  (:action step17-unstack-F-G
    :parameters (?a - agent)
    :precondition (and (step16_done) (on F G) (clear F) (handempty ?a))
    :effect (and
      (holding ?a F)
      (clear G)
      (not (on F G))
      (not (clear F))
      (not (handempty ?a))
      (step17_done)
    )
  )

  ;; 18. putdown(F)
  (:action step18-putdown-F
    :parameters (?a - agent)
    :precondition (and (step17_done) (holding ?a F))
    :effect (and
      (ontable F)
      (clear F)
      (handempty ?a)
      (not (holding ?a F))
      (step18_done)
    )
  )

  ;; 19. unstack(J, C)
  (:action step19-unstack-J-C
    :parameters (?a - agent)
    :precondition (and (step18_done) (on J C) (clear J) (handempty ?a))
    :effect (and
      (holding ?a J)
      (clear C)
      (not (on J C))
      (not (clear J))
      (not (handempty ?a))
      (step19_done)
    )
  )

  ;; 20. putdown(J)
  (:action step20-putdown-J
    :parameters (?a - agent)
    :precondition (and (step19_done) (holding ?a J))
    :effect (and
      (ontable J)
      (clear J)
      (handempty ?a)
      (not (holding ?a J))
      (step20_done)
    )
  )

  ;; 21. unstack(B, E)
  (:action step21-unstack-B-E
    :parameters (?a - agent)
    :precondition (and (step20_done) (on B E) (clear B) (handempty ?a))
    :effect (and
      (holding ?a B)
      (clear E)
      (not (on B E))
      (not (clear B))
      (not (handempty ?a))
      (step21_done)
    )
  )

  ;; 22. stack(B, F)
  (:action step22-stack-B-F
    :parameters (?a - agent)
    :precondition (and (step21_done) (holding ?a B) (clear F))
    :effect (and
      (on B F)
      (not (clear F))
      (clear B)
      (handempty ?a)
      (not (holding ?a B))
      (step22_done)
    )
  )

  ;; 23. unstack(E, D)
  (:action step23-unstack-E-D
    :parameters (?a - agent)
    :precondition (and (step22_done) (on E D) (clear E) (handempty ?a))
    :effect (and
      (holding ?a E)
      (clear D)
      (not (on E D))
      (not (clear E))
      (not (handempty ?a))
      (step23_done)
    )
  )

  ;; 24. putdown(E)
  (:action step24-putdown-E
    :parameters (?a - agent)
    :precondition (and (step23_done) (holding ?a E))
    :effect (and
      (ontable E)
      (clear E)
      (handempty ?a)
      (not (holding ?a E))
      (step24_done)
    )
  )

  ;; 25. unstack(B, F)
  (:action step25-unstack-B-F
    :parameters (?a - agent)
    :precondition (and (step24_done) (on B F) (clear B) (handempty ?a))
    :effect (and
      (holding ?a B)
      (clear F)
      (not (on B F))
      (not (clear B))
      (not (handempty ?a))
      (step25_done)
    )
  )

  ;; 26. stack(B, D)
  (:action step26-stack-B-D
    :parameters (?a - agent)
    :precondition (and (step25_done) (holding ?a B) (clear D))
    :effect (and
      (on B D)
      (not (clear D))
      (clear B)
      (handempty ?a)
      (not (holding ?a B))
      (step26_done)
    )
  )

  ;; 27. pickup(C)
  (:action step27-pickup-C
    :parameters (?a - agent)
    :precondition (and (step26_done) (ontable C) (clear C) (handempty ?a))
    :effect (and
      (holding ?a C)
      (not (ontable C))
      (not (clear C))
      (not (handempty ?a))
      (step27_done)
    )
  )

  ;; 28. stack(C, F)
  (:action step28-stack-C-F
    :parameters (?a - agent)
    :precondition (and (step27_done) (holding ?a C) (clear F))
    :effect (and
      (on C F)
      (not (clear F))
      (clear C)
      (handempty ?a)
      (not (holding ?a C))
      (step28_done)
    )
  )

  ;; 29. pickup(E)
  (:action step29-pickup-E
    :parameters (?a - agent)
    :precondition (and (step28_done) (ontable E) (clear E) (handempty ?a))
    :effect (and
      (holding ?a E)
      (not (ontable E))
      (not (clear E))
      (not (handempty ?a))
      (step29_done)
    )
  )

  ;; 30. putdown(E)
  (:action step30-putdown-E
    :parameters (?a - agent)
    :precondition (and (step29_done) (holding ?a E))
    :effect (and
      (ontable E)
      (clear E)
      (handempty ?a)
      (not (holding ?a E))
      (step30_done)
    )
  )

  ;; 31. unstack(B, D)
  (:action step31-unstack-B-D
    :parameters (?a - agent)
    :precondition (and (step30_done) (on B D) (clear B) (handempty ?a))
    :effect (and
      (holding ?a B)
      (clear D)
      (not (on B D))
      (not (clear B))
      (not (handempty ?a))
      (step31_done)
    )
  )

  ;; 32. stack(B, D)
  (:action step32-stack-B-D
    :parameters (?a - agent)
    :precondition (and (step31_done) (holding ?a B) (clear D))
    :effect (and
      (on B D)
      (not (clear D))
      (clear B)
      (handempty ?a)
      (not (holding ?a B))
      (step32_done)
    )
  )

  ;; 33. pickup(E)
  (:action step33-pickup-E
    :parameters (?a - agent)
    :precondition (and (step32_done) (ontable E) (clear E) (handempty ?a))
    :effect (and
      (holding ?a E)
      (not (ontable E))
      (not (clear E))
      (not (handempty ?a))
      (step33_done)
    )
  )

  ;; 34. stack(E, J)
  (:action step34-stack-E-J
    :parameters (?a - agent)
    :precondition (and (step33_done) (holding ?a E) (clear J))
    :effect (and
      (on E J)
      (not (clear J))
      (clear E)
      (handempty ?a)
      (not (holding ?a E))
      (step34_done)
    )
  )

  ;; 35. unstack(E, J)
  (:action step35-unstack-E-J
    :parameters (?a - agent)
    :precondition (and (step34_done) (on E J) (clear E) (handempty ?a))
    :effect (and
      (holding ?a E)
      (clear J)
      (not (on E J))
      (not (clear E))
      (not (handempty ?a))
      (step35_done)
    )
  )

  ;; 36. stack(E, B)
  (:action step36-stack-E-B
    :parameters (?a - agent)
    :precondition (and (step35_done) (holding ?a E) (clear B))
    :effect (and
      (on E B)
      (not (clear B))
      (clear E)
      (handempty ?a)
      (not (holding ?a E))
      (step36_done)
    )
  )

  ;; 37. unstack(E, B)
  (:action step37-unstack-E-B
    :parameters (?a - agent)
    :precondition (and (step36_done) (on E B) (clear E) (handempty ?a))
    :effect (and
      (holding ?a E)
      (clear B)
      (not (on E B))
      (not (clear E))
      (not (handempty ?a))
      (step37_done)
    )
  )

  ;; 38. stack(E, G)
  (:action step38-stack-E-G
    :parameters (?a - agent)
    :precondition (and (step37_done) (holding ?a E) (clear G))
    :effect (and
      (on E G)
      (not (clear G))
      (clear E)
      (handempty ?a)
      (not (holding ?a E))
      (step38_done)
    )
  )

  ;; 39. unstack(C, F)
  (:action step39-unstack-C-F
    :parameters (?a - agent)
    :precondition (and (step38_done) (on C F) (clear C) (handempty ?a))
    :effect (and
      (holding ?a C)
      (clear F)
      (not (on C F))
      (not (clear C))
      (not (handempty ?a))
      (step39_done)
    )
  )

  ;; 40. putdown(C)
  (:action step40-putdown-C
    :parameters (?a - agent)
    :precondition (and (step39_done) (holding ?a C))
    :effect (and
      (ontable C)
      (clear C)
      (handempty ?a)
      (not (holding ?a C))
      (step40_done)
    )
  )
)