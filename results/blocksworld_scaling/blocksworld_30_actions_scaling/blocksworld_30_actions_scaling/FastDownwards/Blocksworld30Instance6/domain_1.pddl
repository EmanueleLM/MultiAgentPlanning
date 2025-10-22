(define (domain blocks-world-seq)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    ;; step markers to enforce the exact action sequence
    (done0) (done1) (done2) (done3) (done4) (done5) (done6) (done7) (done8) (done9)
    (done10) (done11) (done12) (done13) (done14) (done15) (done16) (done17) (done18) (done19)
    (done20) (done21) (done22) (done23) (done24) (done25) (done26) (done27) (done28) (done29) (done30)
  )

  ;; 1. unstack(H, G)
  (:action step1_unstack_H_G
    :precondition (and (on H G) (clear H) (handempty) (done0) (not (done1)))
    :effect (and
      (holding H)
      (clear G)
      (not (on H G))
      (not (clear H))
      (not (handempty))
      (done1)
      (not (done0))
    )
  )

  ;; 2. stack(H, G)
  (:action step2_stack_H_G
    :precondition (and (holding H) (clear G) (done1) (not (done2)))
    :effect (and
      (on H G)
      (clear H)
      (not (clear G))
      (handempty)
      (not (holding H))
      (done2)
      (not (done1))
    )
  )

  ;; 3. unstack(E, F)
  (:action step3_unstack_E_F
    :precondition (and (on E F) (clear E) (handempty) (done2) (not (done3)))
    :effect (and
      (holding E)
      (clear F)
      (not (on E F))
      (not (clear E))
      (not (handempty))
      (done3)
      (not (done2))
    )
  )

  ;; 4. stack(E, F)
  (:action step4_stack_E_F
    :precondition (and (holding E) (clear F) (done3) (not (done4)))
    :effect (and
      (on E F)
      (clear E)
      (not (clear F))
      (handempty)
      (not (holding E))
      (done4)
      (not (done3))
    )
  )

  ;; 5. unstack(H, G)
  (:action step5_unstack_H_G
    :precondition (and (on H G) (clear H) (handempty) (done4) (not (done5)))
    :effect (and
      (holding H)
      (clear G)
      (not (on H G))
      (not (clear H))
      (not (handempty))
      (done5)
      (not (done4))
    )
  )

  ;; 6. stack(H, E)
  (:action step6_stack_H_E
    :precondition (and (holding H) (clear E) (done5) (not (done6)))
    :effect (and
      (on H E)
      (clear H)
      (not (clear E))
      (handempty)
      (not (holding H))
      (done6)
      (not (done5))
    )
  )

  ;; 7. unstack(H, E)
  (:action step7_unstack_H_E
    :precondition (and (on H E) (clear H) (handempty) (done6) (not (done7)))
    :effect (and
      (holding H)
      (clear E)
      (not (on H E))
      (not (clear H))
      (not (handempty))
      (done7)
      (not (done6))
    )
  )

  ;; 8. stack(H, G)
  (:action step8_stack_H_G
    :precondition (and (holding H) (clear G) (done7) (not (done8)))
    :effect (and
      (on H G)
      (clear H)
      (not (clear G))
      (handempty)
      (not (holding H))
      (done8)
      (not (done7))
    )
  )

  ;; 9. unstack(E, F)
  (:action step9_unstack_E_F
    :precondition (and (on E F) (clear E) (handempty) (done8) (not (done9)))
    :effect (and
      (holding E)
      (clear F)
      (not (on E F))
      (not (clear E))
      (not (handempty))
      (done9)
      (not (done8))
    )
  )

  ;; 10. stack(E, H)
  (:action step10_stack_E_H
    :precondition (and (holding E) (clear H) (done9) (not (done10)))
    :effect (and
      (on E H)
      (clear E)
      (not (clear H))
      (handempty)
      (not (holding E))
      (done10)
      (not (done9))
    )
  )

  ;; 11. unstack(E, H)
  (:action step11_unstack_E_H
    :precondition (and (on E H) (clear E) (handempty) (done10) (not (done11)))
    :effect (and
      (holding E)
      (clear H)
      (not (on E H))
      (not (clear E))
      (not (handempty))
      (done11)
      (not (done10))
    )
  )

  ;; 12. stack(E, H)
  (:action step12_stack_E_H
    :precondition (and (holding E) (clear H) (done11) (not (done12)))
    :effect (and
      (on E H)
      (clear E)
      (not (clear H))
      (handempty)
      (not (holding E))
      (done12)
      (not (done11))
    )
  )

  ;; 13. unstack(E, H)
  (:action step13_unstack_E_H
    :precondition (and (on E H) (clear E) (handempty) (done12) (not (done13)))
    :effect (and
      (holding E)
      (clear H)
      (not (on E H))
      (not (clear E))
      (not (handempty))
      (done13)
      (not (done12))
    )
  )

  ;; 14. putdown(E)
  (:action step14_putdown_E
    :precondition (and (holding E) (done13) (not (done14)))
    :effect (and
      (ontable E)
      (clear E)
      (handempty)
      (not (holding E))
      (done14)
      (not (done13))
    )
  )

  ;; 15. pickup(E)
  (:action step15_pickup_E
    :precondition (and (ontable E) (clear E) (handempty) (done14) (not (done15)))
    :effect (and
      (holding E)
      (not (ontable E))
      (not (clear E))
      (not (handempty))
      (done15)
      (not (done14))
    )
  )

  ;; 16. stack(E, F)
  (:action step16_stack_E_F
    :precondition (and (holding E) (clear F) (done15) (not (done16)))
    :effect (and
      (on E F)
      (clear E)
      (not (clear F))
      (handempty)
      (not (holding E))
      (done16)
      (not (done15))
    )
  )

  ;; 17. unstack(H, G)
  (:action step17_unstack_H_G
    :precondition (and (on H G) (clear H) (handempty) (done16) (not (done17)))
    :effect (and
      (holding H)
      (clear G)
      (not (on H G))
      (not (clear H))
      (not (handempty))
      (done17)
      (not (done16))
    )
  )

  ;; 18. putdown(H)
  (:action step18_putdown_H
    :precondition (and (holding H) (done17) (not (done18)))
    :effect (and
      (ontable H)
      (clear H)
      (handempty)
      (not (holding H))
      (done18)
      (not (done17))
    )
  )

  ;; 19. pickup(H)
  (:action step19_pickup_H
    :precondition (and (ontable H) (clear H) (handempty) (done18) (not (done19)))
    :effect (and
      (holding H)
      (not (ontable H))
      (not (clear H))
      (not (handempty))
      (done19)
      (not (done18))
    )
  )

  ;; 20. stack(H, E)
  (:action step20_stack_H_E
    :precondition (and (holding H) (clear E) (done19) (not (done20)))
    :effect (and
      (on H E)
      (clear H)
      (not (clear E))
      (handempty)
      (not (holding H))
      (done20)
      (not (done19))
    )
  )

  ;; 21. unstack(H, E)
  (:action step21_unstack_H_E
    :precondition (and (on H E) (clear H) (handempty) (done20) (not (done21)))
    :effect (and
      (holding H)
      (clear E)
      (not (on H E))
      (not (clear H))
      (not (handempty))
      (done21)
      (not (done20))
    )
  )

  ;; 22. stack(H, E)
  (:action step22_stack_H_E
    :precondition (and (holding H) (clear E) (done21) (not (done22)))
    :effect (and
      (on H E)
      (clear H)
      (not (clear E))
      (handempty)
      (not (holding H))
      (done22)
      (not (done21))
    )
  )

  ;; 23. unstack(G, D)
  (:action step23_unstack_G_D
    :precondition (and (on G D) (clear G) (handempty) (done22) (not (done23)))
    :effect (and
      (holding G)
      (clear D)
      (not (on G D))
      (not (clear G))
      (not (handempty))
      (done23)
      (not (done22))
    )
  )

  ;; 24. stack(G, H)
  (:action step24_stack_G_H
    :precondition (and (holding G) (clear H) (done23) (not (done24)))
    :effect (and
      (on G H)
      (clear G)
      (not (clear H))
      (handempty)
      (not (holding G))
      (done24)
      (not (done23))
    )
  )

  ;; 25. unstack(D, J)
  (:action step25_unstack_D_J
    :precondition (and (on D J) (clear D) (handempty) (done24) (not (done25)))
    :effect (and
      (holding D)
      (clear J)
      (not (on D J))
      (not (clear D))
      (not (handempty))
      (done25)
      (not (done24))
    )
  )

  ;; 26. stack(D, J)
  (:action step26_stack_D_J
    :precondition (and (holding D) (clear J) (done25) (not (done26)))
    :effect (and
      (on D J)
      (clear D)
      (not (clear J))
      (handempty)
      (not (holding D))
      (done26)
      (not (done25))
    )
  )

  ;; 27. unstack(G, H)
  (:action step27_unstack_G_H
    :precondition (and (on G H) (clear G) (handempty) (done26) (not (done27)))
    :effect (and
      (holding G)
      (clear H)
      (not (on G H))
      (not (clear G))
      (not (handempty))
      (done27)
      (not (done26))
    )
  )

  ;; 28. stack(G, H)
  (:action step28_stack_G_H
    :precondition (and (holding G) (clear H) (done27) (not (done28)))
    :effect (and
      (on G H)
      (clear G)
      (not (clear H))
      (handempty)
      (not (holding G))
      (done28)
      (not (done27))
    )
  )

  ;; 29. unstack(G, H)
  (:action step29_unstack_G_H
    :precondition (and (on G H) (clear G) (handempty) (done28) (not (done29)))
    :effect (and
      (holding G)
      (clear H)
      (not (on G H))
      (not (clear G))
      (not (handempty))
      (done29)
      (not (done28))
    )
  )

  ;; 30. stack(G, D)
  (:action step30_stack_G_D
    :precondition (and (holding G) (clear D) (done29) (not (done30)))
    :effect (and
      (on G D)
      (clear G)
      (not (clear D))
      (handempty)
      (not (holding G))
      (done30)
      (not (done29))
    )
  )
)