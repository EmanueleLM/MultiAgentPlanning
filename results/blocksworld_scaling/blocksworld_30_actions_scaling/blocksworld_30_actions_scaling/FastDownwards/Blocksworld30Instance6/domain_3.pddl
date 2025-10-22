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

  ;; 1. unstack H from G
  (:action step1_unstack_h_g
    :parameters (?h - block ?g - block)
    :precondition (and (on ?h ?g) (clear ?h) (handempty) (done0) (not (done1)))
    :effect (and
      (holding ?h)
      (clear ?g)
      (not (on ?h ?g))
      (not (clear ?h))
      (not (handempty))
      (done1)
      (not (done0))
    )
  )

  ;; 2. stack H on G
  (:action step2_stack_h_g
    :parameters (?h - block ?g - block)
    :precondition (and (holding ?h) (clear ?g) (done1) (not (done2)))
    :effect (and
      (on ?h ?g)
      (clear ?h)
      (not (clear ?g))
      (handempty)
      (not (holding ?h))
      (done2)
      (not (done1))
    )
  )

  ;; 3. unstack E from F
  (:action step3_unstack_e_f
    :parameters (?e - block ?f - block)
    :precondition (and (on ?e ?f) (clear ?e) (handempty) (done2) (not (done3)))
    :effect (and
      (holding ?e)
      (clear ?f)
      (not (on ?e ?f))
      (not (clear ?e))
      (not (handempty))
      (done3)
      (not (done2))
    )
  )

  ;; 4. stack E on F
  (:action step4_stack_e_f
    :parameters (?e - block ?f - block)
    :precondition (and (holding ?e) (clear ?f) (done3) (not (done4)))
    :effect (and
      (on ?e ?f)
      (clear ?e)
      (not (clear ?f))
      (handempty)
      (not (holding ?e))
      (done4)
      (not (done3))
    )
  )

  ;; 5. unstack H from G
  (:action step5_unstack_h_g
    :parameters (?h - block ?g - block)
    :precondition (and (on ?h ?g) (clear ?h) (handempty) (done4) (not (done5)))
    :effect (and
      (holding ?h)
      (clear ?g)
      (not (on ?h ?g))
      (not (clear ?h))
      (not (handempty))
      (done5)
      (not (done4))
    )
  )

  ;; 6. stack H on E
  (:action step6_stack_h_e
    :parameters (?h - block ?e - block)
    :precondition (and (holding ?h) (clear ?e) (done5) (not (done6)))
    :effect (and
      (on ?h ?e)
      (clear ?h)
      (not (clear ?e))
      (handempty)
      (not (holding ?h))
      (done6)
      (not (done5))
    )
  )

  ;; 7. unstack H from E
  (:action step7_unstack_h_e
    :parameters (?h - block ?e - block)
    :precondition (and (on ?h ?e) (clear ?h) (handempty) (done6) (not (done7)))
    :effect (and
      (holding ?h)
      (clear ?e)
      (not (on ?h ?e))
      (not (clear ?h))
      (not (handempty))
      (done7)
      (not (done6))
    )
  )

  ;; 8. stack H on G
  (:action step8_stack_h_g
    :parameters (?h - block ?g - block)
    :precondition (and (holding ?h) (clear ?g) (done7) (not (done8)))
    :effect (and
      (on ?h ?g)
      (clear ?h)
      (not (clear ?g))
      (handempty)
      (not (holding ?h))
      (done8)
      (not (done7))
    )
  )

  ;; 9. unstack E from F
  (:action step9_unstack_e_f
    :parameters (?e - block ?f - block)
    :precondition (and (on ?e ?f) (clear ?e) (handempty) (done8) (not (done9)))
    :effect (and
      (holding ?e)
      (clear ?f)
      (not (on ?e ?f))
      (not (clear ?e))
      (not (handempty))
      (done9)
      (not (done8))
    )
  )

  ;; 10. stack E on H
  (:action step10_stack_e_h
    :parameters (?e - block ?h - block)
    :precondition (and (holding ?e) (clear ?h) (done9) (not (done10)))
    :effect (and
      (on ?e ?h)
      (clear ?e)
      (not (clear ?h))
      (handempty)
      (not (holding ?e))
      (done10)
      (not (done9))
    )
  )

  ;; 11. unstack E from H
  (:action step11_unstack_e_h
    :parameters (?e - block ?h - block)
    :precondition (and (on ?e ?h) (clear ?e) (handempty) (done10) (not (done11)))
    :effect (and
      (holding ?e)
      (clear ?h)
      (not (on ?e ?h))
      (not (clear ?e))
      (not (handempty))
      (done11)
      (not (done10))
    )
  )

  ;; 12. stack E on H
  (:action step12_stack_e_h
    :parameters (?e - block ?h - block)
    :precondition (and (holding ?e) (clear ?h) (done11) (not (done12)))
    :effect (and
      (on ?e ?h)
      (clear ?e)
      (not (clear ?h))
      (handempty)
      (not (holding ?e))
      (done12)
      (not (done11))
    )
  )

  ;; 13. unstack E from H
  (:action step13_unstack_e_h
    :parameters (?e - block ?h - block)
    :precondition (and (on ?e ?h) (clear ?e) (handempty) (done12) (not (done13)))
    :effect (and
      (holding ?e)
      (clear ?h)
      (not (on ?e ?h))
      (not (clear ?e))
      (not (handempty))
      (done13)
      (not (done12))
    )
  )

  ;; 14. putdown E
  (:action step14_putdown_e
    :parameters (?e - block)
    :precondition (and (holding ?e) (done13) (not (done14)))
    :effect (and
      (ontable ?e)
      (clear ?e)
      (handempty)
      (not (holding ?e))
      (done14)
      (not (done13))
    )
  )

  ;; 15. pickup E
  (:action step15_pickup_e
    :parameters (?e - block)
    :precondition (and (ontable ?e) (clear ?e) (handempty) (done14) (not (done15)))
    :effect (and
      (holding ?e)
      (not (ontable ?e))
      (not (clear ?e))
      (not (handempty))
      (done15)
      (not (done14))
    )
  )

  ;; 16. stack E on F
  (:action step16_stack_e_f
    :parameters (?e - block ?f - block)
    :precondition (and (holding ?e) (clear ?f) (done15) (not (done16)))
    :effect (and
      (on ?e ?f)
      (clear ?e)
      (not (clear ?f))
      (handempty)
      (not (holding ?e))
      (done16)
      (not (done15))
    )
  )

  ;; 17. unstack H from G
  (:action step17_unstack_h_g
    :parameters (?h - block ?g - block)
    :precondition (and (on ?h ?g) (clear ?h) (handempty) (done16) (not (done17)))
    :effect (and
      (holding ?h)
      (clear ?g)
      (not (on ?h ?g))
      (not (clear ?h))
      (not (handempty))
      (done17)
      (not (done16))
    )
  )

  ;; 18. putdown H
  (:action step18_putdown_h
    :parameters (?h - block)
    :precondition (and (holding ?h) (done17) (not (done18)))
    :effect (and
      (ontable ?h)
      (clear ?h)
      (handempty)
      (not (holding ?h))
      (done18)
      (not (done17))
    )
  )

  ;; 19. pickup H
  (:action step19_pickup_h
    :parameters (?h - block)
    :precondition (and (ontable ?h) (clear ?h) (handempty) (done18) (not (done19)))
    :effect (and
      (holding ?h)
      (not (ontable ?h))
      (not (clear ?h))
      (not (handempty))
      (done19)
      (not (done18))
    )
  )

  ;; 20. stack H on E
  (:action step20_stack_h_e
    :parameters (?h - block ?e - block)
    :precondition (and (holding ?h) (clear ?e) (done19) (not (done20)))
    :effect (and
      (on ?h ?e)
      (clear ?h)
      (not (clear ?e))
      (handempty)
      (not (holding ?h))
      (done20)
      (not (done19))
    )
  )

  ;; 21. unstack H from E
  (:action step21_unstack_h_e
    :parameters (?h - block ?e - block)
    :precondition (and (on ?h ?e) (clear ?h) (handempty) (done20) (not (done21)))
    :effect (and
      (holding ?h)
      (clear ?e)
      (not (on ?h ?e))
      (not (clear ?h))
      (not (handempty))
      (done21)
      (not (done20))
    )
  )

  ;; 22. stack H on E
  (:action step22_stack_h_e
    :parameters (?h - block ?e - block)
    :precondition (and (holding ?h) (clear ?e) (done21) (not (done22)))
    :effect (and
      (on ?h ?e)
      (clear ?h)
      (not (clear ?e))
      (handempty)
      (not (holding ?h))
      (done22)
      (not (done21))
    )
  )

  ;; 23. unstack G from D
  (:action step23_unstack_g_d
    :parameters (?g - block ?d - block)
    :precondition (and (on ?g ?d) (clear ?g) (handempty) (done22) (not (done23)))
    :effect (and
      (holding ?g)
      (clear ?d)
      (not (on ?g ?d))
      (not (clear ?g))
      (not (handempty))
      (done23)
      (not (done22))
    )
  )

  ;; 24. stack G on H
  (:action step24_stack_g_h
    :parameters (?g - block ?h - block)
    :precondition (and (holding ?g) (clear ?h) (done23) (not (done24)))
    :effect (and
      (on ?g ?h)
      (clear ?g)
      (not (clear ?h))
      (handempty)
      (not (holding ?g))
      (done24)
      (not (done23))
    )
  )

  ;; 25. unstack D from J
  (:action step25_unstack_d_j
    :parameters (?d - block ?j - block)
    :precondition (and (on ?d ?j) (clear ?d) (handempty) (done24) (not (done25)))
    :effect (and
      (holding ?d)
      (clear ?j)
      (not (on ?d ?j))
      (not (clear ?d))
      (not (handempty))
      (done25)
      (not (done24))
    )
  )

  ;; 26. stack D on J
  (:action step26_stack_d_j
    :parameters (?d - block ?j - block)
    :precondition (and (holding ?d) (clear ?j) (done25) (not (done26)))
    :effect (and
      (on ?d ?j)
      (clear ?d)
      (not (clear ?j))
      (handempty)
      (not (holding ?d))
      (done26)
      (not (done25))
    )
  )

  ;; 27. unstack G from H
  (:action step27_unstack_g_h
    :parameters (?g - block ?h - block)
    :precondition (and (on ?g ?h) (clear ?g) (handempty) (done26) (not (done27)))
    :effect (and
      (holding ?g)
      (clear ?h)
      (not (on ?g ?h))
      (not (clear ?g))
      (not (handempty))
      (done27)
      (not (done26))
    )
  )

  ;; 28. stack G on H
  (:action step28_stack_g_h
    :parameters (?g - block ?h - block)
    :precondition (and (holding ?g) (clear ?h) (done27) (not (done28)))
    :effect (and
      (on ?g ?h)
      (clear ?g)
      (not (clear ?h))
      (handempty)
      (not (holding ?g))
      (done28)
      (not (done27))
    )
  )

  ;; 29. unstack G from H
  (:action step29_unstack_g_h
    :parameters (?g - block ?h - block)
    :precondition (and (on ?g ?h) (clear ?g) (handempty) (done28) (not (done29)))
    :effect (and
      (holding ?g)
      (clear ?h)
      (not (on ?g ?h))
      (not (clear ?g))
      (not (handempty))
      (done29)
      (not (done28))
    )
  )

  ;; 30. stack G on D
  (:action step30_stack_g_d
    :parameters (?g - block ?d - block)
    :precondition (and (holding ?g) (clear ?d) (done29) (not (done30)))
    :effect (and
      (on ?g ?d)
      (clear ?g)
      (not (clear ?d))
      (handempty)
      (not (holding ?g))
      (done30)
      (not (done29))
    )
  )
)