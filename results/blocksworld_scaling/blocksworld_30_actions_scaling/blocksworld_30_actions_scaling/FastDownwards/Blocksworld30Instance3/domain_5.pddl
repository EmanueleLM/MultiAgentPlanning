(define (domain blocksworld-trace-instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?b - block ?under - block)
    (ontable ?b - block)
    (clear ?b - block)
    (carried ?b - block)
    (nooneholding)
    (step0) (step1) (step2) (step3) (step4) (step5) (step6) (step7) (step8) (step9)
    (step10) (step11) (step12) (step13) (step14) (step15) (step16) (step17) (step18) (step19)
    (step20) (step21) (step22) (step23) (step24) (step25) (step26) (step27) (step28) (step29)
    (step30)
  )

  (:action act1_unstack_f_d
    :parameters ()
    :precondition (and (step0) (on f d) (clear f) (nooneholding))
    :effect (and
      (not (step0)) (step1)
      (carried f)
      (not (on f d))
      (clear d)
      (not (clear f))
      (not (ontable f))
      (not (nooneholding))
    )
  )

  (:action act2_putdown_f
    :parameters ()
    :precondition (and (step1) (carried f))
    :effect (and
      (not (step1)) (step2)
      (ontable f)
      (clear f)
      (not (carried f))
      (nooneholding)
    )
  )

  (:action act3_pickup_d
    :parameters ()
    :precondition (and (step2) (ontable d) (clear d) (nooneholding))
    :effect (and
      (not (step2)) (step3)
      (carried d)
      (not (ontable d))
      (not (clear d))
      (not (nooneholding))
    )
  )

  (:action act4_stack_d_f
    :parameters ()
    :precondition (and (step3) (carried d) (clear f))
    :effect (and
      (not (step3)) (step4)
      (on d f)
      (clear d)
      (not (clear f))
      (not (carried d))
      (nooneholding)
    )
  )

  (:action act5_unstack_b_e
    :parameters ()
    :precondition (and (step4) (on b e) (clear b) (nooneholding))
    :effect (and
      (not (step4)) (step5)
      (carried b)
      (not (on b e))
      (clear e)
      (not (clear b))
      (not (ontable b))
      (not (nooneholding))
    )
  )

  (:action act6_putdown_b
    :parameters ()
    :precondition (and (step5) (carried b))
    :effect (and
      (not (step5)) (step6)
      (ontable b)
      (clear b)
      (not (carried b))
      (nooneholding)
    )
  )

  (:action act7_pickup_b
    :parameters ()
    :precondition (and (step6) (ontable b) (clear b) (nooneholding))
    :effect (and
      (not (step6)) (step7)
      (carried b)
      (not (ontable b))
      (not (clear b))
      (not (nooneholding))
    )
  )

  (:action act8_stack_b_d
    :parameters ()
    :precondition (and (step7) (carried b) (clear d))
    :effect (and
      (not (step7)) (step8)
      (on b d)
      (clear b)
      (not (clear d))
      (not (carried b))
      (nooneholding)
    )
  )

  (:action act9_unstack_b_d
    :parameters ()
    :precondition (and (step8) (on b d) (clear b) (nooneholding))
    :effect (and
      (not (step8)) (step9)
      (carried b)
      (not (on b d))
      (clear d)
      (not (clear b))
      (not (ontable b))
      (not (nooneholding))
    )
  )

  (:action act10_stack_b_c
    :parameters ()
    :precondition (and (step9) (carried b) (clear c))
    :effect (and
      (not (step9)) (step10)
      (on b c)
      (clear b)
      (not (clear c))
      (not (carried b))
      (nooneholding)
    )
  )

  (:action act11_unstack_b_c
    :parameters ()
    :precondition (and (step10) (on b c) (clear b) (nooneholding))
    :effect (and
      (not (step10)) (step11)
      (carried b)
      (not (on b c))
      (clear c)
      (not (clear b))
      (not (ontable b))
      (not (nooneholding))
    )
  )

  (:action act12_stack_b_d
    :parameters ()
    :precondition (and (step11) (carried b) (clear d))
    :effect (and
      (not (step11)) (step12)
      (on b d)
      (clear b)
      (not (clear d))
      (not (carried b))
      (nooneholding)
    )
  )

  (:action act13_unstack_c_h
    :parameters ()
    :precondition (and (step12) (on c h) (clear c) (nooneholding))
    :effect (and
      (not (step12)) (step13)
      (carried c)
      (not (on c h))
      (clear h)
      (not (clear c))
      (not (ontable c))
      (not (nooneholding))
    )
  )

  (:action act14_putdown_c
    :parameters ()
    :precondition (and (step13) (carried c))
    :effect (and
      (not (step13)) (step14)
      (ontable c)
      (clear c)
      (not (carried c))
      (nooneholding)
    )
  )

  (:action act15_unstack_e_a
    :parameters ()
    :precondition (and (step14) (on e a) (clear e) (nooneholding))
    :effect (and
      (not (step14)) (step15)
      (carried e)
      (not (on e a))
      (clear a)
      (not (clear e))
      (not (ontable e))
      (not (nooneholding))
    )
  )

  (:action act16_stack_e_b
    :parameters ()
    :precondition (and (step15) (carried e) (clear b))
    :effect (and
      (not (step15)) (step16)
      (on e b)
      (clear e)
      (not (clear b))
      (not (carried e))
      (nooneholding)
    )
  )

  (:action act17_pickup_a
    :parameters ()
    :precondition (and (step16) (ontable a) (clear a) (nooneholding))
    :effect (and
      (not (step16)) (step17)
      (carried a)
      (not (ontable a))
      (not (clear a))
      (not (nooneholding))
    )
  )

  (:action act18_stack_a_h
    :parameters ()
    :precondition (and (step17) (carried a) (clear h))
    :effect (and
      (not (step17)) (step18)
      (on a h)
      (clear a)
      (not (clear h))
      (not (carried a))
      (nooneholding)
    )
  )

  (:action act19_unstack_a_h
    :parameters ()
    :precondition (and (step18) (on a h) (clear a) (nooneholding))
    :effect (and
      (not (step18)) (step19)
      (carried a)
      (not (on a h))
      (clear h)
      (not (clear a))
      (not (ontable a))
      (not (nooneholding))
    )
  )

  (:action act20_putdown_a
    :parameters ()
    :precondition (and (step19) (carried a))
    :effect (and
      (not (step19)) (step20)
      (ontable a)
      (clear a)
      (not (carried a))
      (nooneholding)
    )
  )

  (:action act21_pickup_a
    :parameters ()
    :precondition (and (step20) (ontable a) (clear a) (nooneholding))
    :effect (and
      (not (step20)) (step21)
      (carried a)
      (not (ontable a))
      (not (clear a))
      (not (nooneholding))
    )
  )

  (:action act22_stack_a_h
    :parameters ()
    :precondition (and (step21) (carried a) (clear h))
    :effect (and
      (not (step21)) (step22)
      (on a h)
      (clear a)
      (not (clear h))
      (not (carried a))
      (nooneholding)
    )
  )

  (:action act23_unstack_a_h
    :parameters ()
    :precondition (and (step22) (on a h) (clear a) (nooneholding))
    :effect (and
      (not (step22)) (step23)
      (carried a)
      (not (on a h))
      (clear h)
      (not (clear a))
      (not (ontable a))
      (not (nooneholding))
    )
  )

  (:action act24_stack_a_h
    :parameters ()
    :precondition (and (step23) (carried a) (clear h))
    :effect (and
      (not (step23)) (step24)
      (on a h)
      (clear a)
      (not (clear h))
      (not (carried a))
      (nooneholding)
    )
  )

  (:action act25_unstack_e_b
    :parameters ()
    :precondition (and (step24) (on e b) (clear e) (nooneholding))
    :effect (and
      (not (step24)) (step25)
      (carried e)
      (not (on e b))
      (clear b)
      (not (clear e))
      (not (ontable e))
      (not (nooneholding))
    )
  )

  (:action act26_stack_e_b
    :parameters ()
    :precondition (and (step25) (carried e) (clear b))
    :effect (and
      (not (step25)) (step26)
      (on e b)
      (clear e)
      (not (clear b))
      (not (carried e))
      (nooneholding)
    )
  )

  (:action act27_unstack_a_h
    :parameters ()
    :precondition (and (step26) (on a h) (clear a) (nooneholding))
    :effect (and
      (not (step26)) (step27)
      (carried a)
      (not (on a h))
      (clear h)
      (not (clear a))
      (not (ontable a))
      (not (nooneholding))
    )
  )

  (:action act28_putdown_a
    :parameters ()
    :precondition (and (step27) (carried a))
    :effect (and
      (not (step27)) (step28)
      (ontable a)
      (clear a)
      (not (carried a))
      (nooneholding)
    )
  )

  (:action act29_unstack_e_b
    :parameters ()
    :precondition (and (step28) (on e b) (clear e) (nooneholding))
    :effect (and
      (not (step28)) (step29)
      (carried e)
      (not (on e b))
      (clear b)
      (not (clear e))
      (not (ontable e))
      (not (nooneholding))
    )
  )

  (:action act30_stack_e_a
    :parameters ()
    :precondition (and (step29) (carried e) (clear a))
    :effect (and
      (not (step29)) (step30)
      (on e a)
      (clear e)
      (not (clear a))
      (not (carried e))
      (nooneholding)
    )
  )
)