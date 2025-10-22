(define (domain blocksworld_with_timed_sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent step)

  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
    (at-step ?s - step)
  )

  ;; Actions strictly follow the provided 30-step sequence.
  ;; Each action is only applicable at the specified step (at-step sN)
  ;; and advances (at-step sN)->(at-step sN+1). Agents are fixed per action
  ;; to keep actor roles distinct.

  ;; 1. unstack(H, G) by mover2
  (:action action1-unstack-h-g
    :parameters ()
    :precondition (and (on h g) (clear h) (handempty mover2) (at-step s0))
    :effect (and
      (not (on h g))
      (clear g)
      (holding mover2 h)
      (not (handempty mover2))
      (not (at-step s0)) (at-step s1)
    )
  )

  ;; 2. stack(H, G) by mover2
  (:action action2-stack-h-g
    :parameters ()
    :precondition (and (holding mover2 h) (clear g) (at-step s1))
    :effect (and
      (not (holding mover2 h))
      (handempty mover2)
      (on h g)
      (not (clear g))
      (clear h)
      (not (at-step s1)) (at-step s2)
    )
  )

  ;; 3. unstack(H, G) by mover2
  (:action action3-unstack-h-g
    :parameters ()
    :precondition (and (on h g) (clear h) (handempty mover2) (at-step s2))
    :effect (and
      (not (on h g))
      (clear g)
      (holding mover2 h)
      (not (handempty mover2))
      (not (at-step s2)) (at-step s3)
    )
  )

  ;; 4. stack(H, G) by mover2
  (:action action4-stack-h-g
    :parameters ()
    :precondition (and (holding mover2 h) (clear g) (at-step s3))
    :effect (and
      (not (holding mover2 h))
      (handempty mover2)
      (on h g)
      (not (clear g))
      (clear h)
      (not (at-step s3)) (at-step s4)
    )
  )

  ;; 5. pickup(F) by mover2
  (:action action5-pickup-f
    :parameters ()
    :precondition (and (on-table f) (clear f) (handempty mover2) (at-step s4))
    :effect (and
      (not (on-table f))
      (holding mover2 f)
      (not (handempty mover2))
      (not (at-step s4)) (at-step s5)
    )
  )

  ;; 6. putdown(F) by mover2
  (:action action6-putdown-f
    :parameters ()
    :precondition (and (holding mover2 f) (at-step s5))
    :effect (and
      (not (holding mover2 f))
      (handempty mover2)
      (on-table f)
      (clear f)
      (not (at-step s5)) (at-step s6)
    )
  )

  ;; 7. pickup(F) by mover2
  (:action action7-pickup-f
    :parameters ()
    :precondition (and (on-table f) (clear f) (handempty mover2) (at-step s6))
    :effect (and
      (not (on-table f))
      (holding mover2 f)
      (not (handempty mover2))
      (not (at-step s6)) (at-step s7)
    )
  )

  ;; 8. stack(F, H) by mover2
  (:action action8-stack-f-h
    :parameters ()
    :precondition (and (holding mover2 f) (clear h) (at-step s7))
    :effect (and
      (not (holding mover2 f))
      (handempty mover2)
      (on f h)
      (not (clear h))
      (clear f)
      (not (at-step s7)) (at-step s8)
    )
  )

  ;; 9. unstack(C, B) by mover1
  (:action action9-unstack-c-b
    :parameters ()
    :precondition (and (on c b) (clear c) (handempty mover1) (at-step s8))
    :effect (and
      (not (on c b))
      (clear b)
      (holding mover1 c)
      (not (handempty mover1))
      (not (at-step s8)) (at-step s9)
    )
  )

  ;; 10. putdown(C) by mover1
  (:action action10-putdown-c
    :parameters ()
    :precondition (and (holding mover1 c) (at-step s9))
    :effect (and
      (not (holding mover1 c))
      (handempty mover1)
      (on-table c)
      (clear c)
      (not (at-step s9)) (at-step s10)
    )
  )

  ;; 11. pickup(C) by mover1
  (:action action11-pickup-c
    :parameters ()
    :precondition (and (on-table c) (clear c) (handempty mover1) (at-step s10))
    :effect (and
      (not (on-table c))
      (holding mover1 c)
      (not (handempty mover1))
      (not (at-step s10)) (at-step s11)
    )
  )

  ;; 12. stack(C, F) by mover1
  (:action action12-stack-c-f
    :parameters ()
    :precondition (and (holding mover1 c) (clear f) (at-step s11))
    :effect (and
      (not (holding mover1 c))
      (handempty mover1)
      (on c f)
      (not (clear f))
      (clear c)
      (not (at-step s11)) (at-step s12)
    )
  )

  ;; 13. unstack(B, E) by mover1
  (:action action13-unstack-b-e
    :parameters ()
    :precondition (and (on b e) (clear b) (handempty mover1) (at-step s12))
    :effect (and
      (not (on b e))
      (clear e)
      (holding mover1 b)
      (not (handempty mover1))
      (not (at-step s12)) (at-step s13)
    )
  )

  ;; 14. putdown(B) by mover1
  (:action action14-putdown-b
    :parameters ()
    :precondition (and (holding mover1 b) (at-step s13))
    :effect (and
      (not (holding mover1 b))
      (handempty mover1)
      (on-table b)
      (clear b)
      (not (at-step s13)) (at-step s14)
    )
  )

  ;; 15. unstack(E, A) by mover1
  (:action action15-unstack-e-a
    :parameters ()
    :precondition (and (on e a) (clear e) (handempty mover1) (at-step s14))
    :effect (and
      (not (on e a))
      (clear a)
      (holding mover1 e)
      (not (handempty mover1))
      (not (at-step s14)) (at-step s15)
    )
  )

  ;; 16. stack(E, B) by mover1
  (:action action16-stack-e-b
    :parameters ()
    :precondition (and (holding mover1 e) (clear b) (at-step s15))
    :effect (and
      (not (holding mover1 e))
      (handempty mover1)
      (on e b)
      (not (clear b))
      (clear e)
      (not (at-step s15)) (at-step s16)
    )
  )

  ;; 17. unstack(A, D) by mover1
  (:action action17-unstack-a-d
    :parameters ()
    :precondition (and (on a d) (clear a) (handempty mover1) (at-step s16))
    :effect (and
      (not (on a d))
      (clear d)
      (holding mover1 a)
      (not (handempty mover1))
      (not (at-step s16)) (at-step s17)
    )
  )

  ;; 18. stack(A, E) by mover1
  (:action action18-stack-a-e
    :parameters ()
    :precondition (and (holding mover1 a) (clear e) (at-step s17))
    :effect (and
      (not (holding mover1 a))
      (handempty mover1)
      (on a e)
      (not (clear e))
      (clear a)
      (not (at-step s17)) (at-step s18)
    )
  )

  ;; 19. pickup(D) by mover1
  (:action action19-pickup-d
    :parameters ()
    :precondition (and (on-table d) (clear d) (handempty mover1) (at-step s18))
    :effect (and
      (not (on-table d))
      (holding mover1 d)
      (not (handempty mover1))
      (not (at-step s18)) (at-step s19)
    )
  )

  ;; 20. putdown(D) by mover1
  (:action action20-putdown-d
    :parameters ()
    :precondition (and (holding mover1 d) (at-step s19))
    :effect (and
      (not (holding mover1 d))
      (handempty mover1)
      (on-table d)
      (clear d)
      (not (at-step s19)) (at-step s20)
    )
  )

  ;; 21. unstack(C, F) by mover1
  (:action action21-unstack-c-f
    :parameters ()
    :precondition (and (on c f) (clear c) (handempty mover1) (at-step s20))
    :effect (and
      (not (on c f))
      (clear f)
      (holding mover1 c)
      (not (handempty mover1))
      (not (at-step s20)) (at-step s21)
    )
  )

  ;; 22. stack(C, F) by mover1
  (:action action22-stack-c-f
    :parameters ()
    :precondition (and (holding mover1 c) (clear f) (at-step s21))
    :effect (and
      (not (holding mover1 c))
      (handempty mover1)
      (on c f)
      (not (clear f))
      (clear c)
      (not (at-step s21)) (at-step s22)
    )
  )

  ;; 23. unstack(C, F) by mover1
  (:action action23-unstack-c-f
    :parameters ()
    :precondition (and (on c f) (clear c) (handempty mover1) (at-step s22))
    :effect (and
      (not (on c f))
      (clear f)
      (holding mover1 c)
      (not (handempty mover1))
      (not (at-step s22)) (at-step s23)
    )
  )

  ;; 24. stack(C, A) by mover1
  (:action action24-stack-c-a
    :parameters ()
    :precondition (and (holding mover1 c) (clear a) (at-step s23))
    :effect (and
      (not (holding mover1 c))
      (handempty mover1)
      (on c a)
      (not (clear a))
      (clear c)
      (not (at-step s23)) (at-step s24)
    )
  )

  ;; 25. unstack(C, A) by mover1
  (:action action25-unstack-c-a
    :parameters ()
    :precondition (and (on c a) (clear c) (handempty mover1) (at-step s24))
    :effect (and
      (not (on c a))
      (clear a)
      (holding mover1 c)
      (not (handempty mover1))
      (not (at-step s24)) (at-step s25)
    )
  )

  ;; 26. stack(C, D) by mover1
  (:action action26-stack-c-d
    :parameters ()
    :precondition (and (holding mover1 c) (clear d) (at-step s25))
    :effect (and
      (not (holding mover1 c))
      (handempty mover1)
      (on c d)
      (not (clear d))
      (clear c)
      (not (at-step s25)) (at-step s26)
    )
  )

  ;; 27. unstack(C, D) by mover1
  (:action action27-unstack-c-d
    :parameters ()
    :precondition (and (on c d) (clear c) (handempty mover1) (at-step s26))
    :effect (and
      (not (on c d))
      (clear d)
      (holding mover1 c)
      (not (handempty mover1))
      (not (at-step s26)) (at-step s27)
    )
  )

  ;; 28. stack(C, F) by mover1
  (:action action28-stack-c-f
    :parameters ()
    :precondition (and (holding mover1 c) (clear f) (at-step s27))
    :effect (and
      (not (holding mover1 c))
      (handempty mover1)
      (on c f)
      (not (clear f))
      (clear c)
      (not (at-step s27)) (at-step s28)
    )
  )

  ;; 29. pickup(D) by mover1
  (:action action29-pickup-d
    :parameters ()
    :precondition (and (on-table d) (clear d) (handempty mover1) (at-step s28))
    :effect (and
      (not (on-table d))
      (holding mover1 d)
      (not (handempty mover1))
      (not (at-step s28)) (at-step s29)
    )
  )

  ;; 30. stack(D, A) by mover1
  (:action action30-stack-d-a
    :parameters ()
    :precondition (and (holding mover1 d) (clear a) (at-step s29))
    :effect (and
      (not (holding mover1 d))
      (handempty mover1)
      (on d a)
      (not (clear a))
      (clear d)
      (not (at-step s29)) (at-step s30)
    )
  )

)