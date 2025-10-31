(define (domain blocks-world-sequenced)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (at-step ?s - step)
  )

  ; Action 1: pickup(D)
  (:action a1_pickup_d
    :parameters ()
    :precondition (and (ontable d) (clear d) (handempty) (at-step s0))
    :effect (and
      (holding d)
      (not (ontable d))
      (not (clear d))
      (not (handempty))
      (not (at-step s0))
      (at-step s1)
    )
  )

  ; Action 2: putdown(D)
  (:action a2_putdown_d
    :parameters ()
    :precondition (and (holding d) (at-step s1))
    :effect (and
      (ontable d)
      (clear d)
      (handempty)
      (not (holding d))
      (not (at-step s1))
      (at-step s2)
    )
  )

  ; Action 3: unstack(B, H)
  (:action a3_unstack_b_h
    :parameters ()
    :precondition (and (on b h) (clear b) (handempty) (at-step s2))
    :effect (and
      (holding b)
      (clear h)
      (not (on b h))
      (not (clear b))
      (not (handempty))
      (not (at-step s2))
      (at-step s3)
    )
  )

  ; Action 4: stack(B, C)
  (:action a4_stack_b_c
    :parameters ()
    :precondition (and (holding b) (clear c) (at-step s3))
    :effect (and
      (on b c)
      (clear b)
      (handempty)
      (not (holding b))
      (not (clear c))
      (not (at-step s3))
      (at-step s4)
    )
  )

  ; Action 5: unstack(B, C)
  (:action a5_unstack_b_c
    :parameters ()
    :precondition (and (on b c) (clear b) (handempty) (at-step s4))
    :effect (and
      (holding b)
      (clear c)
      (not (on b c))
      (not (clear b))
      (not (handempty))
      (not (at-step s4))
      (at-step s5)
    )
  )

  ; Action 6: putdown(B)
  (:action a6_putdown_b
    :parameters ()
    :precondition (and (holding b) (at-step s5))
    :effect (and
      (ontable b)
      (clear b)
      (handempty)
      (not (holding b))
      (not (at-step s5))
      (at-step s6)
    )
  )

  ; Action 7: unstack(H, F)
  (:action a7_unstack_h_f
    :parameters ()
    :precondition (and (on h f) (clear h) (handempty) (at-step s6))
    :effect (and
      (holding h)
      (clear f)
      (not (on h f))
      (not (clear h))
      (not (handempty))
      (not (at-step s6))
      (at-step s7)
    )
  )

  ; Action 8: putdown(H)
  (:action a8_putdown_h
    :parameters ()
    :precondition (and (holding h) (at-step s7))
    :effect (and
      (ontable h)
      (clear h)
      (handempty)
      (not (holding h))
      (not (at-step s7))
      (at-step s8)
    )
  )

  ; Action 9: unstack(C, E)
  (:action a9_unstack_c_e
    :parameters ()
    :precondition (and (on c e) (clear c) (handempty) (at-step s8))
    :effect (and
      (holding c)
      (clear e)
      (not (on c e))
      (not (clear c))
      (not (handempty))
      (not (at-step s8))
      (at-step s9)
    )
  )

  ; Action 10: stack(C, B)
  (:action a10_stack_c_b
    :parameters ()
    :precondition (and (holding c) (clear b) (at-step s9))
    :effect (and
      (on c b)
      (clear c)
      (handempty)
      (not (holding c))
      (not (clear b))
      (not (at-step s9))
      (at-step s10)
    )
  )

  ; Action 11: pickup(F)
  (:action a11_pickup_f
    :parameters ()
    :precondition (and (ontable f) (clear f) (handempty) (at-step s10))
    :effect (and
      (holding f)
      (not (ontable f))
      (not (clear f))
      (not (handempty))
      (not (at-step s10))
      (at-step s11)
    )
  )

  ; Action 12: stack(F, E)
  (:action a12_stack_f_e
    :parameters ()
    :precondition (and (holding f) (clear e) (at-step s11))
    :effect (and
      (on f e)
      (clear f)
      (handempty)
      (not (holding f))
      (not (clear e))
      (not (at-step s11))
      (at-step s12)
    )
  )

  ; Action 13: pickup(H)
  (:action a13_pickup_h
    :parameters ()
    :precondition (and (ontable h) (clear h) (handempty) (at-step s12))
    :effect (and
      (holding h)
      (not (ontable h))
      (not (clear h))
      (not (handempty))
      (not (at-step s12))
      (at-step s13)
    )
  )

  ; Action 14: putdown(H)
  (:action a14_putdown_h
    :parameters ()
    :precondition (and (holding h) (at-step s13))
    :effect (and
      (ontable h)
      (clear h)
      (handempty)
      (not (holding h))
      (not (at-step s13))
      (at-step s14)
    )
  )

  ; Action 15: pickup(D)
  (:action a15_pickup_d
    :parameters ()
    :precondition (and (ontable d) (clear d) (handempty) (at-step s14))
    :effect (and
      (holding d)
      (not (ontable d))
      (not (clear d))
      (not (handempty))
      (not (at-step s14))
      (at-step s15)
    )
  )

  ; Action 16: stack(D, F)
  (:action a16_stack_d_f
    :parameters ()
    :precondition (and (holding d) (clear f) (at-step s15))
    :effect (and
      (on d f)
      (clear d)
      (handempty)
      (not (holding d))
      (not (clear f))
      (not (at-step s15))
      (at-step s16)
    )
  )

  ; Action 17: unstack(D, F)
  (:action a17_unstack_d_f
    :parameters ()
    :precondition (and (on d f) (clear d) (handempty) (at-step s16))
    :effect (and
      (holding d)
      (clear f)
      (not (on d f))
      (not (clear d))
      (not (handempty))
      (not (at-step s16))
      (at-step s17)
    )
  )

  ; Action 18: putdown(D)
  (:action a18_putdown_d
    :parameters ()
    :precondition (and (holding d) (at-step s17))
    :effect (and
      (ontable d)
      (clear d)
      (handempty)
      (not (holding d))
      (not (at-step s17))
      (at-step s18)
    )
  )

  ; Action 19: pickup(D)
  (:action a19_pickup_d
    :parameters ()
    :precondition (and (ontable d) (clear d) (handempty) (at-step s18))
    :effect (and
      (holding d)
      (not (ontable d))
      (not (clear d))
      (not (handempty))
      (not (at-step s18))
      (at-step s19)
    )
  )

  ; Action 20: stack(D, H)
  (:action a20_stack_d_h
    :parameters ()
    :precondition (and (holding d) (clear h) (at-step s19))
    :effect (and
      (on d h)
      (clear d)
      (handempty)
      (not (holding d))
      (not (clear h))
      (not (at-step s19))
      (at-step s20)
    )
  )

  ; Action 21: unstack(F, E)
  (:action a21_unstack_f_e
    :parameters ()
    :precondition (and (on f e) (clear f) (handempty) (at-step s20))
    :effect (and
      (holding f)
      (clear e)
      (not (on f e))
      (not (clear f))
      (not (handempty))
      (not (at-step s20))
      (at-step s21)
    )
  )

  ; Action 22: stack(F, D)
  (:action a22_stack_f_d
    :parameters ()
    :precondition (and (holding f) (clear d) (at-step s21))
    :effect (and
      (on f d)
      (clear f)
      (handempty)
      (not (holding f))
      (not (clear d))
      (not (at-step s21))
      (at-step s22)
    )
  )

  ; Action 23: unstack(C, B)
  (:action a23_unstack_c_b
    :parameters ()
    :precondition (and (on c b) (clear c) (handempty) (at-step s22))
    :effect (and
      (holding c)
      (clear b)
      (not (on c b))
      (not (clear c))
      (not (handempty))
      (not (at-step s22))
      (at-step s23)
    )
  )

  ; Action 24: putdown(C)
  (:action a24_putdown_c
    :parameters ()
    :precondition (and (holding c) (at-step s23))
    :effect (and
      (ontable c)
      (clear c)
      (handempty)
      (not (holding c))
      (not (at-step s23))
      (at-step s24)
    )
  )

  ; Action 25: pickup(C)
  (:action a25_pickup_c
    :parameters ()
    :precondition (and (ontable c) (clear c) (handempty) (at-step s24))
    :effect (and
      (holding c)
      (not (ontable c))
      (not (clear c))
      (not (handempty))
      (not (at-step s24))
      (at-step s25)
    )
  )

  ; Action 26: putdown(C)
  (:action a26_putdown_c
    :parameters ()
    :precondition (and (holding c) (at-step s25))
    :effect (and
      (ontable c)
      (clear c)
      (handempty)
      (not (holding c))
      (not (at-step s25))
      (at-step s26)
    )
  )

  ; Action 27: unstack(F, D)
  (:action a27_unstack_f_d
    :parameters ()
    :precondition (and (on f d) (clear f) (handempty) (at-step s26))
    :effect (and
      (holding f)
      (clear d)
      (not (on f d))
      (not (clear f))
      (not (handempty))
      (not (at-step s26))
      (at-step s27)
    )
  )

  ; Action 28: putdown(F)
  (:action a28_putdown_f
    :parameters ()
    :precondition (and (holding f) (at-step s27))
    :effect (and
      (ontable f)
      (clear f)
      (handempty)
      (not (holding f))
      (not (at-step s27))
      (at-step s28)
    )
  )

  ; Action 29: unstack(E, A)
  (:action a29_unstack_e_a
    :parameters ()
    :precondition (and (on e a) (clear e) (handempty) (at-step s28))
    :effect (and
      (holding e)
      (clear a)
      (not (on e a))
      (not (clear e))
      (not (handempty))
      (not (at-step s28))
      (at-step s29)
    )
  )

  ; Action 30: stack(E, B)
  (:action a30_stack_e_b
    :parameters ()
    :precondition (and (holding e) (clear b) (at-step s29))
    :effect (and
      (on e b)
      (clear e)
      (handempty)
      (not (holding e))
      (not (clear b))
      (not (at-step s29))
      (at-step s30)
    )
  )
)