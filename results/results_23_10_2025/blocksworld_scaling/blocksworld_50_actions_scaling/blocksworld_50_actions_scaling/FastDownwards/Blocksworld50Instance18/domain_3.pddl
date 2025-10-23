(define (domain blocksworld_sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (step-done ?s - step)
  )

  (:action step1_unstack_e_j
    :parameters ()
    :precondition (and (on e j) (clear e) (handempty) (step-done s0))
    :effect (and (not (on e j)) (not (clear e)) (holding e) (clear j) (not (handempty)) (step-done s1))
  )

  (:action step2_stack_e_g
    :parameters ()
    :precondition (and (holding e) (clear g) (step-done s1))
    :effect (and (on e g) (clear e) (not (clear g)) (not (holding e)) (handempty) (step-done s2))
  )

  (:action step3_unstack_c_b
    :parameters ()
    :precondition (and (on c b) (clear c) (handempty) (step-done s2))
    :effect (and (not (on c b)) (not (clear c)) (holding c) (clear b) (not (handempty)) (step-done s3))
  )

  (:action step4_stack_c_b
    :parameters ()
    :precondition (and (holding c) (clear b) (step-done s3))
    :effect (and (on c b) (clear c) (not (clear b)) (not (holding c)) (handempty) (step-done s4))
  )

  (:action step5_unstack_c_b
    :parameters ()
    :precondition (and (on c b) (clear c) (handempty) (step-done s4))
    :effect (and (not (on c b)) (not (clear c)) (holding c) (clear b) (not (handempty)) (step-done s5))
  )

  (:action step6_stack_c_b
    :parameters ()
    :precondition (and (holding c) (clear b) (step-done s5))
    :effect (and (on c b) (clear c) (not (clear b)) (not (holding c)) (handempty) (step-done s6))
  )

  (:action step7_unstack_c_b
    :parameters ()
    :precondition (and (on c b) (clear c) (handempty) (step-done s6))
    :effect (and (not (on c b)) (not (clear c)) (holding c) (clear b) (not (handempty)) (step-done s7))
  )

  (:action step8_stack_c_b
    :parameters ()
    :precondition (and (holding c) (clear b) (step-done s7))
    :effect (and (on c b) (clear c) (not (clear b)) (not (holding c)) (handempty) (step-done s8))
  )

  (:action step9_unstack_j_i
    :parameters ()
    :precondition (and (on j i) (clear j) (handempty) (step-done s8))
    :effect (and (not (on j i)) (not (clear j)) (holding j) (clear i) (not (handempty)) (step-done s9))
  )

  (:action step10_stack_j_i
    :parameters ()
    :precondition (and (holding j) (clear i) (step-done s9))
    :effect (and (on j i) (clear j) (not (clear i)) (not (holding j)) (handempty) (step-done s10))
  )

  (:action step11_unstack_e_g
    :parameters ()
    :precondition (and (on e g) (clear e) (handempty) (step-done s10))
    :effect (and (not (on e g)) (not (clear e)) (holding e) (clear g) (not (handempty)) (step-done s11))
  )

  (:action step12_stack_e_c
    :parameters ()
    :precondition (and (holding e) (clear c) (step-done s11))
    :effect (and (on e c) (clear e) (not (clear c)) (not (holding e)) (handempty) (step-done s12))
  )

  (:action step13_unstack_g_h
    :parameters ()
    :precondition (and (on g h) (clear g) (handempty) (step-done s12))
    :effect (and (not (on g h)) (not (clear g)) (holding g) (clear h) (not (handempty)) (step-done s13))
  )

  (:action step14_putdown_g
    :parameters ()
    :precondition (and (holding g) (step-done s13))
    :effect (and (ontable g) (clear g) (not (holding g)) (handempty) (step-done s14))
  )

  (:action step15_unstack_j_i
    :parameters ()
    :precondition (and (on j i) (clear j) (handempty) (step-done s14))
    :effect (and (not (on j i)) (not (clear j)) (holding j) (clear i) (not (handempty)) (step-done s15))
  )

  (:action step16_stack_j_g
    :parameters ()
    :precondition (and (holding j) (clear g) (step-done s15))
    :effect (and (on j g) (clear j) (not (clear g)) (not (holding j)) (handempty) (step-done s16))
  )

  (:action step17_unstack_h_f
    :parameters ()
    :precondition (and (on h f) (clear h) (handempty) (step-done s16))
    :effect (and (not (on h f)) (not (clear h)) (holding h) (clear f) (not (handempty)) (step-done s17))
  )

  (:action step18_putdown_h
    :parameters ()
    :precondition (and (holding h) (step-done s17))
    :effect (and (ontable h) (clear h) (not (holding h)) (handempty) (step-done s18))
  )

  (:action step19_unstack_i_d
    :parameters ()
    :precondition (and (on i d) (clear i) (handempty) (step-done s18))
    :effect (and (not (on i d)) (not (clear i)) (holding i) (clear d) (not (handempty)) (step-done s19))
  )

  (:action step20_stack_i_h
    :parameters ()
    :precondition (and (holding i) (clear h) (step-done s19))
    :effect (and (on i h) (clear i) (not (clear h)) (not (holding i)) (handempty) (step-done s20))
  )

  (:action step21_pickup_d
    :parameters ()
    :precondition (and (ontable d) (clear d) (handempty) (step-done s20))
    :effect (and (not (ontable d)) (not (clear d)) (holding d) (not (handempty)) (step-done s21))
  )

  (:action step22_stack_d_f
    :parameters ()
    :precondition (and (holding d) (clear f) (step-done s21))
    :effect (and (on d f) (clear d) (not (clear f)) (not (holding d)) (handempty) (step-done s22))
  )

  (:action step23_unstack_j_g
    :parameters ()
    :precondition (and (on j g) (clear j) (handempty) (step-done s22))
    :effect (and (not (on j g)) (not (clear j)) (holding j) (clear g) (not (handempty)) (step-done s23))
  )

  (:action step24_stack_j_i
    :parameters ()
    :precondition (and (holding j) (clear i) (step-done s23))
    :effect (and (on j i) (clear j) (not (clear i)) (not (holding j)) (handempty) (step-done s24))
  )

  (:action step25_unstack_e_c
    :parameters ()
    :precondition (and (on e c) (clear e) (handempty) (step-done s24))
    :effect (and (not (on e c)) (not (clear e)) (holding e) (clear c) (not (handempty)) (step-done s25))
  )

  (:action step26_stack_e_g
    :parameters ()
    :precondition (and (holding e) (clear g) (step-done s25))
    :effect (and (on e g) (clear e) (not (clear g)) (not (holding e)) (handempty) (step-done s26))
  )

  (:action step27_unstack_j_i
    :parameters ()
    :precondition (and (on j i) (clear j) (handempty) (step-done s26))
    :effect (and (not (on j i)) (not (clear j)) (holding j) (clear i) (not (handempty)) (step-done s27))
  )

  (:action step28_stack_j_d
    :parameters ()
    :precondition (and (holding j) (clear d) (step-done s27))
    :effect (and (on j d) (clear j) (not (clear d)) (not (holding j)) (handempty) (step-done s28))
  )

  (:action step29_unstack_i_h
    :parameters ()
    :precondition (and (on i h) (clear i) (handempty) (step-done s28))
    :effect (and (not (on i h)) (not (clear i)) (holding i) (clear h) (not (handempty)) (step-done s29))
  )

  (:action step30_stack_i_c
    :parameters ()
    :precondition (and (holding i) (clear c) (step-done s29))
    :effect (and (on i c) (clear i) (not (clear c)) (not (holding i)) (handempty) (step-done s30))
  )

  (:action step31_pickup_h
    :parameters ()
    :precondition (and (ontable h) (clear h) (handempty) (step-done s30))
    :effect (and (not (ontable h)) (not (clear h)) (holding h) (not (handempty)) (step-done s31))
  )

  (:action step32_putdown_h
    :parameters ()
    :precondition (and (holding h) (step-done s31))
    :effect (and (ontable h) (clear h) (not (holding h)) (handempty) (step-done s32))
  )

  (:action step33_unstack_i_c
    :parameters ()
    :precondition (and (on i c) (clear i) (handempty) (step-done s32))
    :effect (and (not (on i c)) (not (clear i)) (holding i) (clear c) (not (handempty)) (step-done s33))
  )

  (:action step34_stack_i_j
    :parameters ()
    :precondition (and (holding i) (clear j) (step-done s33))
    :effect (and (on i j) (clear i) (not (clear j)) (not (holding i)) (handempty) (step-done s34))
  )

  (:action step35_unstack_i_j
    :parameters ()
    :precondition (and (on i j) (clear i) (handempty) (step-done s34))
    :effect (and (not (on i j)) (not (clear i)) (holding i) (clear j) (not (handempty)) (step-done s35))
  )

  (:action step36_putdown_i
    :parameters ()
    :precondition (and (holding i) (step-done s35))
    :effect (and (ontable i) (clear i) (not (holding i)) (handempty) (step-done s36))
  )

  (:action step37_pickup_i
    :parameters ()
    :precondition (and (ontable i) (clear i) (handempty) (step-done s36))
    :effect (and (not (ontable i)) (not (clear i)) (holding i) (not (handempty)) (step-done s37))
  )

  (:action step38_putdown_i
    :parameters ()
    :precondition (and (holding i) (step-done s37))
    :effect (and (ontable i) (clear i) (not (holding i)) (handempty) (step-done s38))
  )

  (:action step39_unstack_j_d
    :parameters ()
    :precondition (and (on j d) (clear j) (handempty) (step-done s38))
    :effect (and (not (on j d)) (not (clear j)) (holding j) (clear d) (not (handempty)) (step-done s39))
  )

  (:action step40_stack_j_h
    :parameters ()
    :precondition (and (holding j) (clear h) (step-done s39))
    :effect (and (on j h) (clear j) (not (clear h)) (not (holding j)) (handempty) (step-done s40))
  )

  (:action step41_pickup_i
    :parameters ()
    :precondition (and (ontable i) (clear i) (handempty) (step-done s40))
    :effect (and (not (ontable i)) (not (clear i)) (holding i) (not (handempty)) (step-done s41))
  )

  (:action step42_stack_i_c
    :parameters ()
    :precondition (and (holding i) (clear c) (step-done s41))
    :effect (and (on i c) (clear i) (not (clear c)) (not (holding i)) (handempty) (step-done s42))
  )

  (:action step43_unstack_d_f
    :parameters ()
    :precondition (and (on d f) (clear d) (handempty) (step-done s42))
    :effect (and (not (on d f)) (not (clear d)) (holding d) (clear f) (not (handempty)) (step-done s43))
  )

  (:action step44_stack_d_j
    :parameters ()
    :precondition (and (holding d) (clear j) (step-done s43))
    :effect (and (on d j) (clear d) (not (clear j)) (not (holding d)) (handempty) (step-done s44))
  )

  (:action step45_unstack_d_j
    :parameters ()
    :precondition (and (on d j) (clear d) (handempty) (step-done s44))
    :effect (and (not (on d j)) (not (clear d)) (holding d) (clear j) (not (handempty)) (step-done s45))
  )

  (:action step46_stack_d_e
    :parameters ()
    :precondition (and (holding d) (clear e) (step-done s45))
    :effect (and (on d e) (clear d) (not (clear e)) (not (holding d)) (handempty) (step-done s46))
  )

  (:action step47_unstack_j_h
    :parameters ()
    :precondition (and (on j h) (clear j) (handempty) (step-done s46))
    :effect (and (not (on j h)) (not (clear j)) (holding j) (clear h) (not (handempty)) (step-done s47))
  )

  (:action step48_stack_j_d
    :parameters ()
    :precondition (and (holding j) (clear d) (step-done s47))
    :effect (and (on j d) (clear j) (not (clear d)) (not (holding j)) (handempty) (step-done s48))
  )

  (:action step49_pickup_h
    :parameters ()
    :precondition (and (ontable h) (clear h) (handempty) (step-done s48))
    :effect (and (not (ontable h)) (not (clear h)) (holding h) (not (handempty)) (step-done s49))
  )

  (:action step50_stack_h_j
    :parameters ()
    :precondition (and (holding h) (clear j) (step-done s49))
    :effect (and (on h j) (clear h) (not (clear j)) (not (holding h)) (handempty) (step-done s50))
  )
)