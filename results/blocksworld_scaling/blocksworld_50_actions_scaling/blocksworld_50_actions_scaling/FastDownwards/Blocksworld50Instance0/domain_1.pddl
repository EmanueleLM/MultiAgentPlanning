(define (domain multi-agent-blocks-sequenced)
  (:requirements :strips :typing :negative-preconditions)
  (:types block robot)

  (:predicates
    (on ?x - block ?y - block)        ; ?x is immediately on ?y
    (ontable ?x - block)              ; ?x is on the table
    (clear ?x - block)                ; nothing on ?x
    (holding ?r - robot ?x - block)   ; robot r holds block x
    (handempty ?r - robot)            ; robot r holds nothing

    ;; Step predicates to force the given ordered sequence of 50 actions.
    (step0) (step1) (step2) (step3) (step4) (step5) (step6) (step7) (step8) (step9)
    (step10) (step11) (step12) (step13) (step14) (step15) (step16) (step17) (step18) (step19)
    (step20) (step21) (step22) (step23) (step24) (step25) (step26) (step27) (step28) (step29)
    (step30) (step31) (step32) (step33) (step34) (step35) (step36) (step37) (step38) (step39)
    (step40) (step41) (step42) (step43) (step44) (step45) (step46) (step47) (step48) (step49)
    (step50)
  )

  ;; The plan enforces the exact supplied 50-step move sequence. Each action
  ;; consumes the current step predicate and produces the next one. Actions
  ;; refer to concrete blocks so that any deviation from the sequence is impossible.

  ;; 1. unstack(I, C)
  (:action step-1-unstack-I-C
    :precondition (and (step0) (on I C) (clear I) (handempty robot1))
    :effect (and
      (not (on I C))
      (clear C)
      (not (clear I))
      (not (handempty robot1))
      (holding robot1 I)
      (not (step0))
      (step1)
    )
  )

  ;; 2. putdown(I)
  (:action step-2-putdown-I
    :precondition (and (step1) (holding robot1 I))
    :effect (and
      (ontable I)
      (clear I)
      (handempty robot1)
      (not (holding robot1 I))
      (not (step1))
      (step2)
    )
  )

  ;; 3. unstack(C, J)
  (:action step-3-unstack-C-J
    :precondition (and (step2) (on C J) (clear C) (handempty robot1))
    :effect (and
      (not (on C J))
      (clear J)
      (not (clear C))
      (not (handempty robot1))
      (holding robot1 C)
      (not (step2))
      (step3)
    )
  )

  ;; 4. putdown(C)
  (:action step-4-putdown-C
    :precondition (and (step3) (holding robot1 C))
    :effect (and
      (ontable C)
      (clear C)
      (handempty robot1)
      (not (holding robot1 C))
      (not (step3))
      (step4)
    )
  )

  ;; 5. pickup(C)
  (:action step-5-pickup-C
    :precondition (and (step4) (ontable C) (clear C) (handempty robot1))
    :effect (and
      (not (ontable C))
      (not (clear C))
      (not (handempty robot1))
      (holding robot1 C)
      (not (step4))
      (step5)
    )
  )

  ;; 6. stack(C, I)
  (:action step-6-stack-C-I
    :precondition (and (step5) (holding robot1 C) (clear I))
    :effect (and
      (on C I)
      (clear C)
      (not (clear I))
      (handempty robot1)
      (not (holding robot1 C))
      (not (step5))
      (step6)
    )
  )

  ;; 7. unstack(B, E)
  (:action step-7-unstack-B-E
    :precondition (and (step6) (on B E) (clear B) (handempty robot1))
    :effect (and
      (not (on B E))
      (clear E)
      (not (clear B))
      (not (handempty robot1))
      (holding robot1 B)
      (not (step6))
      (step7)
    )
  )

  ;; 8. putdown(B)
  (:action step-8-putdown-B
    :precondition (and (step7) (holding robot1 B))
    :effect (and
      (ontable B)
      (clear B)
      (handempty robot1)
      (not (holding robot1 B))
      (not (step7))
      (step8)
    )
  )

  ;; 9. unstack(C, I)
  (:action step-9-unstack-C-I
    :precondition (and (step8) (on C I) (clear C) (handempty robot1))
    :effect (and
      (not (on C I))
      (clear I)
      (not (clear C))
      (not (handempty robot1))
      (holding robot1 C)
      (not (step8))
      (step9)
    )
  )

  ;; 10. stack(C, J)
  (:action step-10-stack-C-J
    :precondition (and (step9) (holding robot1 C) (clear J))
    :effect (and
      (on C J)
      (clear C)
      (not (clear J))
      (handempty robot1)
      (not (holding robot1 C))
      (not (step9))
      (step10)
    )
  )

  ;; 11. unstack(E, L)
  (:action step-11-unstack-E-L
    :precondition (and (step10) (on E L) (clear E) (handempty robot1))
    :effect (and
      (not (on E L))
      (clear L)
      (not (clear E))
      (not (handempty robot1))
      (holding robot1 E)
      (not (step10))
      (step11)
    )
  )

  ;; 12. stack(E, L)
  (:action step-12-stack-E-L
    :precondition (and (step11) (holding robot1 E) (clear L))
    :effect (and
      (on E L)
      (clear E)
      (not (clear L))
      (handempty robot1)
      (not (holding robot1 E))
      (not (step11))
      (step12)
    )
  )

  ;; 13. unstack(E, L)
  (:action step-13-unstack-E-L
    :precondition (and (step12) (on E L) (clear E) (handempty robot1))
    :effect (and
      (not (on E L))
      (clear L)
      (not (clear E))
      (not (handempty robot1))
      (holding robot1 E)
      (not (step12))
      (step13)
    )
  )

  ;; 14. stack(E, B)
  (:action step-14-stack-E-B
    :precondition (and (step13) (holding robot1 E) (clear B))
    :effect (and
      (on E B)
      (clear E)
      (not (clear B))
      (handempty robot1)
      (not (holding robot1 E))
      (not (step13))
      (step14)
    )
  )

  ;; 15. unstack(E, B)
  (:action step-15-unstack-E-B
    :precondition (and (step14) (on E B) (clear E) (handempty robot1))
    :effect (and
      (not (on E B))
      (clear B)
      (not (clear E))
      (not (handempty robot1))
      (holding robot1 E)
      (not (step14))
      (step15)
    )
  )

  ;; 16. stack(E, L)
  (:action step-16-stack-E-L
    :precondition (and (step15) (holding robot1 E) (clear L))
    :effect (and
      (on E L)
      (clear E)
      (not (clear L))
      (handempty robot1)
      (not (holding robot1 E))
      (not (step15))
      (step16)
    )
  )

  ;; 17. pickup(I)
  (:action step-17-pickup-I
    :precondition (and (step16) (ontable I) (clear I) (handempty robot1))
    :effect (and
      (not (ontable I))
      (not (clear I))
      (not (handempty robot1))
      (holding robot1 I)
      (not (step16))
      (step17)
    )
  )

  ;; 18. putdown(I)
  (:action step-18-putdown-I
    :precondition (and (step17) (holding robot1 I))
    :effect (and
      (ontable I)
      (clear I)
      (handempty robot1)
      (not (holding robot1 I))
      (not (step17))
      (step18)
    )
  )

  ;; 19. pickup(I)
  (:action step-19-pickup-I
    :precondition (and (step18) (ontable I) (clear I) (handempty robot1))
    :effect (and
      (not (ontable I))
      (not (clear I))
      (not (handempty robot1))
      (holding robot1 I)
      (not (step18))
      (step19)
    )
  )

  ;; 20. stack(I, E)
  (:action step-20-stack-I-E
    :precondition (and (step19) (holding robot1 I) (clear E))
    :effect (and
      (on I E)
      (clear I)
      (not (clear E))
      (handempty robot1)
      (not (holding robot1 I))
      (not (step19))
      (step20)
    )
  )

  ;; 21. unstack(I, E)
  (:action step-21-unstack-I-E
    :precondition (and (step20) (on I E) (clear I) (handempty robot1))
    :effect (and
      (not (on I E))
      (clear E)
      (not (clear I))
      (not (handempty robot1))
      (holding robot1 I)
      (not (step20))
      (step21)
    )
  )

  ;; 22. stack(I, C)
  (:action step-22-stack-I-C
    :precondition (and (step21) (holding robot1 I) (clear C))
    :effect (and
      (on I C)
      (clear I)
      (not (clear C))
      (handempty robot1)
      (not (holding robot1 I))
      (not (step21))
      (step22)
    )
  )

  ;; 23. unstack(E, L)
  (:action step-23-unstack-E-L
    :precondition (and (step22) (on E L) (clear E) (handempty robot1))
    :effect (and
      (not (on E L))
      (clear L)
      (not (clear E))
      (not (handempty robot1))
      (holding robot1 E)
      (not (step22))
      (step23)
    )
  )

  ;; 24. stack(E, L)
  (:action step-24-stack-E-L
    :precondition (and (step23) (holding robot1 E) (clear L))
    :effect (and
      (on E L)
      (clear E)
      (not (clear L))
      (handempty robot1)
      (not (holding robot1 E))
      (not (step23))
      (step24)
    )
  )

  ;; 25. pickup(B)
  (:action step-25-pickup-B
    :precondition (and (step24) (ontable B) (clear B) (handempty robot1))
    :effect (and
      (not (ontable B))
      (not (clear B))
      (not (handempty robot1))
      (holding robot1 B)
      (not (step24))
      (step25)
    )
  )

  ;; 26. stack(B, E)
  (:action step-26-stack-B-E
    :precondition (and (step25) (holding robot1 B) (clear E))
    :effect (and
      (on B E)
      (clear B)
      (not (clear E))
      (handempty robot1)
      (not (holding robot1 B))
      (not (step25))
      (step26)
    )
  )

  ;; 27. unstack(B, E)
  (:action step-27-unstack-B-E
    :precondition (and (step26) (on B E) (clear B) (handempty robot1))
    :effect (and
      (not (on B E))
      (clear E)
      (not (clear B))
      (not (handempty robot1))
      (holding robot1 B)
      (not (step26))
      (step27)
    )
  )

  ;; 28. stack(B, I)
  (:action step-28-stack-B-I
    :precondition (and (step27) (holding robot1 B) (clear I))
    :effect (and
      (on B I)
      (clear B)
      (not (clear I))
      (handempty robot1)
      (not (holding robot1 B))
      (not (step27))
      (step28)
    )
  )

  ;; 29. unstack(B, I)
  (:action step-29-unstack-B-I
    :precondition (and (step28) (on B I) (clear B) (handempty robot1))
    :effect (and
      (not (on B I))
      (clear I)
      (not (clear B))
      (not (handempty robot1))
      (holding robot1 B)
      (not (step28))
      (step29)
    )
  )

  ;; 30. stack(B, E)
  (:action step-30-stack-B-E
    :precondition (and (step29) (holding robot1 B) (clear E))
    :effect (and
      (on B E)
      (clear B)
      (not (clear E))
      (handempty robot1)
      (not (holding robot1 B))
      (not (step29))
      (step30)
    )
  )

  ;; 31. unstack(I, C)
  (:action step-31-unstack-I-C
    :precondition (and (step30) (on I C) (clear I) (handempty robot1))
    :effect (and
      (not (on I C))
      (clear C)
      (not (clear I))
      (not (handempty robot1))
      (holding robot1 I)
      (not (step30))
      (step31)
    )
  )

  ;; 32. putdown(I)
  (:action step-32-putdown-I
    :precondition (and (step31) (holding robot1 I))
    :effect (and
      (ontable I)
      (clear I)
      (handempty robot1)
      (not (holding robot1 I))
      (not (step31))
      (step32)
    )
  )

  ;; 33. unstack(C, J)
  (:action step-33-unstack-C-J
    :precondition (and (step32) (on C J) (clear C) (handempty robot1))
    :effect (and
      (not (on C J))
      (clear J)
      (not (clear C))
      (not (handempty robot1))
      (holding robot1 C)
      (not (step32))
      (step33)
    )
  )

  ;; 34. stack(C, I)
  (:action step-34-stack-C-I
    :precondition (and (step33) (holding robot1 C) (clear I))
    :effect (and
      (on C I)
      (clear C)
      (not (clear I))
      (handempty robot1)
      (not (holding robot1 C))
      (not (step33))
      (step34)
    )
  )

  ;; 35. unstack(B, E)
  (:action step-35-unstack-B-E
    :precondition (and (step34) (on B E) (clear B) (handempty robot1))
    :effect (and
      (not (on B E))
      (clear E)
      (not (clear B))
      (not (handempty robot1))
      (holding robot1 B)
      (not (step34))
      (step35)
    )
  )

  ;; 36. putdown(B)
  (:action step-36-putdown-B
    :precondition (and (step35) (holding robot1 B))
    :effect (and
      (ontable B)
      (clear B)
      (handempty robot1)
      (not (holding robot1 B))
      (not (step35))
      (step36)
    )
  )

  ;; 37. unstack(C, I)
  (:action step-37-unstack-C-I
    :precondition (and (step36) (on C I) (clear C) (handempty robot1))
    :effect (and
      (not (on C I))
      (clear I)
      (not (clear C))
      (not (handempty robot1))
      (holding robot1 C)
      (not (step36))
      (step37)
    )
  )

  ;; 38. stack(C, B)
  (:action step-38-stack-C-B
    :precondition (and (step37) (holding robot1 C) (clear B))
    :effect (and
      (on C B)
      (clear C)
      (not (clear B))
      (handempty robot1)
      (not (holding robot1 C))
      (not (step37))
      (step38)
    )
  )

  ;; 39. unstack(E, L)
  (:action step-39-unstack-E-L
    :precondition (and (step38) (on E L) (clear E) (handempty robot1))
    :effect (and
      (not (on E L))
      (clear L)
      (not (clear E))
      (not (handempty robot1))
      (holding robot1 E)
      (not (step38))
      (step39)
    )
  )

  ;; 40. putdown(E)
  (:action step-40-putdown-E
    :precondition (and (step39) (holding robot1 E))
    :effect (and
      (ontable E)
      (clear E)
      (handempty robot1)
      (not (holding robot1 E))
      (not (step39))
      (step40)
    )
  )

  ;; 41. unstack(C, B)
  (:action step-41-unstack-C-B
    :precondition (and (step40) (on C B) (clear C) (handempty robot1))
    :effect (and
      (not (on C B))
      (clear B)
      (not (clear C))
      (not (handempty robot1))
      (holding robot1 C)
      (not (step40))
      (step41)
    )
  )

  ;; 42. stack(C, I)
  (:action step-42-stack-C-I
    :precondition (and (step41) (holding robot1 C) (clear I))
    :effect (and
      (on C I)
      (clear C)
      (not (clear I))
      (handempty robot1)
      (not (holding robot1 C))
      (not (step41))
      (step42)
    )
  )

  ;; 43. unstack(L, A)
  (:action step-43-unstack-L-A
    :precondition (and (step42) (on L A) (clear L) (handempty robot1))
    :effect (and
      (not (on L A))
      (clear A)
      (not (clear L))
      (not (handempty robot1))
      (holding robot1 L)
      (not (step42))
      (step43)
    )
  )

  ;; 44. stack(L, C)
  (:action step-44-stack-L-C
    :precondition (and (step43) (holding robot1 L) (clear C))
    :effect (and
      (on L C)
      (clear L)
      (not (clear C))
      (handempty robot1)
      (not (holding robot1 L))
      (not (step43))
      (step44)
    )
  )

  ;; 45. pickup(B)
  (:action step-45-pickup-B
    :precondition (and (step44) (ontable B) (clear B) (handempty robot1))
    :effect (and
      (not (ontable B))
      (not (clear B))
      (not (handempty robot1))
      (holding robot1 B)
      (not (step44))
      (step45)
    )
  )

  ;; 46. stack(B, A)
  (:action step-46-stack-B-A
    :precondition (and (step45) (holding robot1 B) (clear A))
    :effect (and
      (on B A)
      (clear B)
      (not (clear A))
      (handempty robot1)
      (not (holding robot1 B))
      (not (step45))
      (step46)
    )
  )

  ;; 47. unstack(L, C)
  (:action step-47-unstack-L-C
    :precondition (and (step46) (on L C) (clear L) (handempty robot1))
    :effect (and
      (not (on L C))
      (clear C)
      (not (clear L))
      (not (handempty robot1))
      (holding robot1 L)
      (not (step46))
      (step47)
    )
  )

  ;; 48. stack(L, J)
  (:action step-48-stack-L-J
    :precondition (and (step47) (holding robot1 L) (clear J))
    :effect (and
      (on L J)
      (clear L)
      (not (clear J))
      (handempty robot1)
      (not (holding robot1 L))
      (not (step47))
      (step48)
    )
  )

  ;; 49. unstack(B, A)
  (:action step-49-unstack-B-A
    :precondition (and (step48) (on B A) (clear B) (handempty robot1))
    :effect (and
      (not (on B A))
      (clear A)
      (not (clear B))
      (not (handempty robot1))
      (holding robot1 B)
      (not (step48))
      (step49)
    )
  )

  ;; 50. stack(B, C)
  (:action step-50-stack-B-C
    :precondition (and (step49) (holding robot1 B) (clear C))
    :effect (and
      (on B C)
      (clear B)
      (not (clear C))
      (handempty robot1)
      (not (holding robot1 B))
      (not (step49))
      (step50)
    )
  )

)