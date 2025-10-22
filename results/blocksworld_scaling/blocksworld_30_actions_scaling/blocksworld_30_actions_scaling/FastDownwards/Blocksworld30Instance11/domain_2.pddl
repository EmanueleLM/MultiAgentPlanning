(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent step place)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
    (done ?s - step)
  )

  ; Action 1: robot1 unstack(H, D)
  (:action unstack_r1_h_d
    :parameters ()
    :precondition (and (on h d) (clear h) (handempty robot1) (done s0))
    :effect (and (not (on h d)) (holding robot1 h) (clear d) (not (clear h)) (not (handempty robot1)) (done s1))
  )

  ; Action 2: robot1 stack(H, J)
  (:action stack_r1_h_j
    :parameters ()
    :precondition (and (holding robot1 h) (clear j) (done s1))
    :effect (and (on h j) (clear h) (not (clear j)) (not (holding robot1 h)) (handempty robot1) (done s2))
  )

  ; Action 3: robot1 unstack(C, G)
  (:action unstack_r1_c_g
    :parameters ()
    :precondition (and (on c g) (clear c) (handempty robot1) (done s2))
    :effect (and (not (on c g)) (holding robot1 c) (clear g) (not (clear c)) (not (handempty robot1)) (done s3))
  )

  ; Action 4: robot1 stack(C, H)
  (:action stack_r1_c_h
    :parameters ()
    :precondition (and (holding robot1 c) (clear h) (done s3))
    :effect (and (on c h) (clear c) (not (clear h)) (not (holding robot1 c)) (handempty robot1) (done s4))
  )

  ; Action 5: robot1 unstack(G, A)
  (:action unstack_r1_g_a
    :parameters ()
    :precondition (and (on g a) (clear g) (handempty robot1) (done s4))
    :effect (and (not (on g a)) (holding robot1 g) (clear a) (not (clear g)) (not (handempty robot1)) (done s5))
  )

  ; Action 6: robot1 stack(G, A)
  (:action stack_r1_g_a
    :parameters ()
    :precondition (and (holding robot1 g) (clear a) (done s5))
    :effect (and (on g a) (clear g) (not (clear a)) (not (holding robot1 g)) (handempty robot1) (done s6))
  )

  ; Action 7: robot1 unstack(D, I)
  (:action unstack_r1_d_i
    :parameters ()
    :precondition (and (on d i) (clear d) (handempty robot1) (done s6))
    :effect (and (not (on d i)) (holding robot1 d) (clear i) (not (clear d)) (not (handempty robot1)) (done s7))
  )

  ; Action 8: robot1 stack(D, I)
  (:action stack_r1_d_i
    :parameters ()
    :precondition (and (holding robot1 d) (clear i) (done s7))
    :effect (and (on d i) (clear d) (not (clear i)) (not (holding robot1 d)) (handempty robot1) (done s8))
  )

  ; Action 9: robot1 unstack(D, I)
  (:action unstack_r1_d_i_again
    :parameters ()
    :precondition (and (on d i) (clear d) (handempty robot1) (done s8))
    :effect (and (not (on d i)) (holding robot1 d) (clear i) (not (clear d)) (not (handempty robot1)) (done s9))
  )

  ; Action 10: robot1 stack(D, C)
  (:action stack_r1_d_c
    :parameters ()
    :precondition (and (holding robot1 d) (clear c) (done s9))
    :effect (and (on d c) (clear d) (not (clear c)) (not (holding robot1 d)) (handempty robot1) (done s10))
  )

  ; Action 11: robot1 pickup(F)
  (:action pickup_r1_f
    :parameters ()
    :precondition (and (ontable f) (clear f) (handempty robot1) (done s10))
    :effect (and (not (ontable f)) (holding robot1 f) (not (clear f)) (not (handempty robot1)) (done s11))
  )

  ; Action 12: robot1 stack(F, G)
  (:action stack_r1_f_g
    :parameters ()
    :precondition (and (holding robot1 f) (clear g) (done s11))
    :effect (and (on f g) (clear f) (not (clear g)) (not (holding robot1 f)) (handempty robot1) (done s12))
  )

  ; Action 13: robot1 unstack(D, C)
  (:action unstack_r1_d_c
    :parameters ()
    :precondition (and (on d c) (clear d) (handempty robot1) (done s12))
    :effect (and (not (on d c)) (holding robot1 d) (clear c) (not (clear d)) (not (handempty robot1)) (done s13))
  )

  ; Action 14: robot1 stack(D, C)
  (:action stack_r1_d_c_again
    :parameters ()
    :precondition (and (holding robot1 d) (clear c) (done s13))
    :effect (and (on d c) (clear d) (not (clear c)) (not (holding robot1 d)) (handempty robot1) (done s14))
  )

  ; Action 15: robot1 pickup(I)
  (:action pickup_r1_i
    :parameters ()
    :precondition (and (ontable i) (clear i) (handempty robot1) (done s14))
    :effect (and (not (ontable i)) (holding robot1 i) (not (clear i)) (not (handempty robot1)) (done s15))
  )

  ; Action 16: robot2 stack(I, D)
  (:action stack_r2_i_d
    :parameters ()
    :precondition (and (holding robot2 i) (clear d) (done s15))
    :effect (and (on i d) (clear i) (not (clear d)) (not (holding robot2 i)) (handempty robot2) (done s16))
  )

  ; Action 17: robot2 unstack(I, D)
  (:action unstack_r2_i_d
    :parameters ()
    :precondition (and (on i d) (clear i) (handempty robot2) (done s16))
    :effect (and (not (on i d)) (holding robot2 i) (clear d) (not (clear i)) (not (handempty robot2)) (done s17))
  )

  ; Action 18: robot2 stack(I, F)
  (:action stack_r2_i_f
    :parameters ()
    :precondition (and (holding robot2 i) (clear f) (done s17))
    :effect (and (on i f) (clear i) (not (clear f)) (not (holding robot2 i)) (handempty robot2) (done s18))
  )

  ; Action 19: robot2 unstack(I, F)
  (:action unstack_r2_i_f
    :parameters ()
    :precondition (and (on i f) (clear i) (handempty robot2) (done s18))
    :effect (and (not (on i f)) (holding robot2 i) (clear f) (not (clear i)) (not (handempty robot2)) (done s19))
  )

  ; Action 20: robot2 putdown(I)
  (:action putdown_r2_i
    :parameters ()
    :precondition (and (holding robot2 i) (done s19))
    :effect (and (ontable i) (clear i) (handempty robot2) (not (holding robot2 i)) (done s20))
  )

  ; Action 21: robot2 pickup(I)
  (:action pickup_r2_i
    :parameters ()
    :precondition (and (ontable i) (clear i) (handempty robot2) (done s20))
    :effect (and (not (ontable i)) (holding robot2 i) (not (clear i)) (not (handempty robot2)) (done s21))
  )

  ; Action 22: robot2 stack(I, D)
  (:action stack_r2_i_d_again
    :parameters ()
    :precondition (and (holding robot2 i) (clear d) (done s21))
    :effect (and (on i d) (clear i) (not (clear d)) (not (holding robot2 i)) (handempty robot2) (done s22))
  )

  ; Action 23: robot2 unstack(I, D)
  (:action unstack_r2_i_d_again
    :parameters ()
    :precondition (and (on i d) (clear i) (handempty robot2) (done s22))
    :effect (and (not (on i d)) (holding robot2 i) (clear d) (not (clear i)) (not (handempty robot2)) (done s23))
  )

  ; Action 24: robot2 stack(I, F)
  (:action stack_r2_i_f_again
    :parameters ()
    :precondition (and (holding robot2 i) (clear f) (done s23))
    :effect (and (on i f) (clear i) (not (clear f)) (not (holding robot2 i)) (handempty robot2) (done s24))
  )

  ; Action 25: robot2 unstack(I, F)
  (:action unstack_r2_i_f_again
    :parameters ()
    :precondition (and (on i f) (clear i) (handempty robot2) (done s24))
    :effect (and (not (on i f)) (holding robot2 i) (clear f) (not (clear i)) (not (handempty robot2)) (done s25))
  )

  ; Action 26: robot2 putdown(I)
  (:action putdown_r2_i_again
    :parameters ()
    :precondition (and (holding robot2 i) (done s25))
    :effect (and (ontable i) (clear i) (handempty robot2) (not (holding robot2 i)) (done s26))
  )

  ; Action 27: robot2 unstack(F, G)
  (:action unstack_r2_f_g
    :parameters ()
    :precondition (and (on f g) (clear f) (handempty robot2) (done s26))
    :effect (and (not (on f g)) (holding robot2 f) (clear g) (not (clear f)) (not (handempty robot2)) (done s27))
  )

  ; Action 28: robot2 stack(F, I)
  (:action stack_r2_f_i
    :parameters ()
    :precondition (and (holding robot2 f) (clear i) (done s27))
    :effect (and (on f i) (clear f) (not (clear i)) (not (holding robot2 f)) (handempty robot2) (done s28))
  )

  ; Action 29: robot2 unstack(G, A)
  (:action unstack_r2_g_a
    :parameters ()
    :precondition (and (on g a) (clear g) (handempty robot2) (done s28))
    :effect (and (not (on g a)) (holding robot2 g) (clear a) (not (clear g)) (not (handempty robot2)) (done s29))
  )

  ; Action 30: robot2 stack(G, F)
  (:action stack_r2_g_f
    :parameters ()
    :precondition (and (holding robot2 g) (clear f) (done s29))
    :effect (and (on g f) (clear g) (not (clear f)) (not (holding robot2 g)) (handempty robot2) (done s30))
  )
)