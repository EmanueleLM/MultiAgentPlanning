(define (domain blocksworld_sequence)
  (:requirements :strips :negative-preconditions)
  (:constants
    a b c d e f g h i j
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9 step10
    step11 step12 step13 step14 step15 step16 step17 step18 step19 step20
    step21 step22 step23 step24 step25 step26 step27 step28 step29 step30
  )
  (:predicates
    (on ?x ?y)         ; ?x on ?y (both blocks)
    (ontable ?x)       ; ?x directly on the table
    (clear ?x)         ; nothing on ?x
    (holding ?x)       ; the gripper holds ?x
    (handempty)        ; gripper is empty
    (current-step ?s)  ; sequencing token: which step is current
  )

  ;; 1. pickup(i)
  (:action step1-pickup-i
    :parameters ()
    :precondition (and (ontable i) (clear i) (handempty) (current-step step0))
    :effect (and
      (not (ontable i))
      (not (clear i))
      (not (handempty))
      (holding i)
      (not (current-step step0))
      (current-step step1)
    )
  )

  ;; 2. putdown(i)
  (:action step2-putdown-i
    :parameters ()
    :precondition (and (holding i) (current-step step1))
    :effect (and
      (ontable i)
      (clear i)
      (handempty)
      (not (holding i))
      (not (current-step step1))
      (current-step step2)
    )
  )

  ;; 3. unstack(d h)
  (:action step3-unstack-d-h
    :parameters ()
    :precondition (and (on d h) (clear d) (handempty) (current-step step2))
    :effect (and
      (holding d)
      (not (on d h))
      (clear h)
      (not (handempty))
      (not (clear d))
      (not (current-step step2))
      (current-step step3)
    )
  )

  ;; 4. stack(d c)
  (:action step4-stack-d-c
    :parameters ()
    :precondition (and (holding d) (clear c) (current-step step3))
    :effect (and
      (on d c)
      (clear d)
      (handempty)
      (not (holding d))
      (not (clear c))
      (not (current-step step3))
      (current-step step4)
    )
  )

  ;; 5. pickup(i)
  (:action step5-pickup-i
    :parameters ()
    :precondition (and (ontable i) (clear i) (handempty) (current-step step4))
    :effect (and
      (not (ontable i))
      (not (clear i))
      (not (handempty))
      (holding i)
      (not (current-step step4))
      (current-step step5)
    )
  )

  ;; 6. stack(i b)
  (:action step6-stack-i-b
    :parameters ()
    :precondition (and (holding i) (clear b) (current-step step5))
    :effect (and
      (on i b)
      (clear i)
      (handempty)
      (not (holding i))
      (not (clear b))
      (not (current-step step5))
      (current-step step6)
    )
  )

  ;; 7. unstack(d c)
  (:action step7-unstack-d-c
    :parameters ()
    :precondition (and (on d c) (clear d) (handempty) (current-step step6))
    :effect (and
      (holding d)
      (not (on d c))
      (clear c)
      (not (handempty))
      (not (clear d))
      (not (current-step step6))
      (current-step step7)
    )
  )

  ;; 8. stack(d i)
  (:action step8-stack-d-i
    :parameters ()
    :precondition (and (holding d) (clear i) (current-step step7))
    :effect (and
      (on d i)
      (clear d)
      (handempty)
      (not (holding d))
      (not (clear i))
      (not (current-step step7))
      (current-step step8)
    )
  )

  ;; 9. unstack(d i)
  (:action step9-unstack-d-i
    :parameters ()
    :precondition (and (on d i) (clear d) (handempty) (current-step step8))
    :effect (and
      (holding d)
      (not (on d i))
      (clear i)
      (not (handempty))
      (not (clear d))
      (not (current-step step8))
      (current-step step9)
    )
  )

  ;; 10. stack(d h)
  (:action step10-stack-d-h
    :parameters ()
    :precondition (and (holding d) (clear h) (current-step step9))
    :effect (and
      (on d h)
      (clear d)
      (handempty)
      (not (holding d))
      (not (clear h))
      (not (current-step step9))
      (current-step step10)
    )
  )

  ;; 11. pickup(c)
  (:action step11-pickup-c
    :parameters ()
    :precondition (and (ontable c) (clear c) (handempty) (current-step step10))
    :effect (and
      (not (ontable c))
      (not (clear c))
      (not (handempty))
      (holding c)
      (not (current-step step10))
      (current-step step11)
    )
  )

  ;; 12. stack(c i)
  (:action step12-stack-c-i
    :parameters ()
    :precondition (and (holding c) (clear i) (current-step step11))
    :effect (and
      (on c i)
      (clear c)
      (handempty)
      (not (holding c))
      (not (clear i))
      (not (current-step step11))
      (current-step step12)
    )
  )

  ;; 13. unstack(c i)
  (:action step13-unstack-c-i
    :parameters ()
    :precondition (and (on c i) (clear c) (handempty) (current-step step12))
    :effect (and
      (holding c)
      (not (on c i))
      (clear i)
      (not (handempty))
      (not (clear c))
      (not (current-step step12))
      (current-step step13)
    )
  )

  ;; 14. stack(c i)
  (:action step14-stack-c-i
    :parameters ()
    :precondition (and (holding c) (clear i) (current-step step13))
    :effect (and
      (on c i)
      (clear c)
      (handempty)
      (not (holding c))
      (not (clear i))
      (not (current-step step13))
      (current-step step14)
    )
  )

  ;; 15. unstack(d h)
  (:action step15-unstack-d-h
    :parameters ()
    :precondition (and (on d h) (clear d) (handempty) (current-step step14))
    :effect (and
      (holding d)
      (not (on d h))
      (clear h)
      (not (handempty))
      (not (clear d))
      (not (current-step step14))
      (current-step step15)
    )
  )

  ;; 16. stack(d c)
  (:action step16-stack-d-c
    :parameters ()
    :precondition (and (holding d) (clear c) (current-step step15))
    :effect (and
      (on d c)
      (clear d)
      (handempty)
      (not (holding d))
      (not (clear c))
      (not (current-step step15))
      (current-step step16)
    )
  )

  ;; 17. unstack(d c)
  (:action step17-unstack-d-c
    :parameters ()
    :precondition (and (on d c) (clear d) (handempty) (current-step step16))
    :effect (and
      (holding d)
      (not (on d c))
      (clear c)
      (not (handempty))
      (not (clear d))
      (not (current-step step16))
      (current-step step17)
    )
  )

  ;; 18. putdown(d)
  (:action step18-putdown-d
    :parameters ()
    :precondition (and (holding d) (current-step step17))
    :effect (and
      (ontable d)
      (clear d)
      (handempty)
      (not (holding d))
      (not (current-step step17))
      (current-step step18)
    )
  )

  ;; 19. unstack(c i)
  (:action step19-unstack-c-i
    :parameters ()
    :precondition (and (on c i) (clear c) (handempty) (current-step step18))
    :effect (and
      (holding c)
      (not (on c i))
      (clear i)
      (not (handempty))
      (not (clear c))
      (not (current-step step18))
      (current-step step19)
    )
  )

  ;; 20. stack(c h)
  (:action step20-stack-c-h
    :parameters ()
    :precondition (and (holding c) (clear h) (current-step step19))
    :effect (and
      (on c h)
      (clear c)
      (handempty)
      (not (clear h))
      (not (current-step step19))
      (current-step step20)
    )
  )

  ;; 21. pickup(d)
  (:action step21-pickup-d
    :parameters ()
    :precondition (and (ontable d) (clear d) (handempty) (current-step step20))
    :effect (and
      (not (ontable d))
      (not (clear d))
      (not (handempty))
      (holding d)
      (not (current-step step20))
      (current-step step21)
    )
  )

  ;; 22. stack(d c)
  (:action step22-stack-d-c
    :parameters ()
    :precondition (and (holding d) (clear c) (current-step step21))
    :effect (and
      (on d c)
      (clear d)
      (handempty)
      (not (holding d))
      (not (clear c))
      (not (current-step step21))
      (current-step step22)
    )
  )

  ;; 23. unstack(d c)
  (:action step23-unstack-d-c
    :parameters ()
    :precondition (and (on d c) (clear d) (handempty) (current-step step22))
    :effect (and
      (holding d)
      (not (on d c))
      (clear c)
      (not (handempty))
      (not (clear d))
      (not (current-step step22))
      (current-step step23)
    )
  )

  ;; 24. putdown(d)
  (:action step24-putdown-d
    :parameters ()
    :precondition (and (holding d) (current-step step23))
    :effect (and
      (ontable d)
      (clear d)
      (handempty)
      (not (holding d))
      (not (current-step step23))
      (current-step step24)
    )
  )

  ;; 25. unstack(i b)
  (:action step25-unstack-i-b
    :parameters ()
    :precondition (and (on i b) (clear i) (handempty) (current-step step24))
    :effect (and
      (holding i)
      (not (on i b))
      (clear b)
      (not (handempty))
      (not (clear i))
      (not (current-step step24))
      (current-step step25)
    )
  )

  ;; 26. stack(i d)
  (:action step26-stack-i-d
    :parameters ()
    :precondition (and (holding i) (clear d) (current-step step25))
    :effect (and
      (on i d)
      (clear i)
      (handempty)
      (not (holding i))
      (not (clear d))
      (not (current-step step25))
      (current-step step26)
    )
  )

  ;; 27. unstack(i d)
  (:action step27-unstack-i-d
    :parameters ()
    :precondition (and (on i d) (clear i) (handempty) (current-step step26))
    :effect (and
      (holding i)
      (not (on i d))
      (clear d)
      (not (handempty))
      (not (clear i))
      (not (current-step step26))
      (current-step step27)
    )
  )

  ;; 28. stack(i c)
  (:action step28-stack-i-c
    :parameters ()
    :precondition (and (holding i) (clear c) (current-step step27))
    :effect (and
      (on i c)
      (clear i)
      (handempty)
      (not (holding i))
      (not (clear c))
      (not (current-step step27))
      (current-step step28)
    )
  )

  ;; 29. pickup(d)
  (:action step29-pickup-d
    :parameters ()
    :precondition (and (ontable d) (clear d) (handempty) (current-step step28))
    :effect (and
      (not (ontable d))
      (not (clear d))
      (not (handempty))
      (holding d)
      (not (current-step step28))
      (current-step step29)
    )
  )

  ;; 30. stack(d i)
  (:action step30-stack-d-i
    :parameters ()
    :precondition (and (holding d) (clear i) (current-step step29))
    :effect (and
      (on d i)
      (clear d)
      (handempty)
      (not (holding d))
      (not (clear i))
      (not (current-step step29))
      (current-step step30)
    )
  )
)