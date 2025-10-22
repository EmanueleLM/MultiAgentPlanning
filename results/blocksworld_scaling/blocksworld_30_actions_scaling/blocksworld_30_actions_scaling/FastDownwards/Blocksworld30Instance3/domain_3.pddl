(define (domain blocksworld-trace-instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:constants
    A B C D E F G H I - block
    mover1 mover2 orchestrator - agent
  )

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

  (:action act1_unstack_F_D
    :parameters ()
    :precondition (and (step0) (on F D) (clear F) (nooneholding))
    :effect (and
      (not (step0)) (step1)
      (carried F)
      (not (on F D))
      (clear D)
      (not (clear F))
      (not (ontable F))
      (not (nooneholding))
    )
  )

  (:action act2_putdown_F
    :parameters ()
    :precondition (and (step1) (carried F))
    :effect (and
      (not (step1)) (step2)
      (ontable F)
      (clear F)
      (not (carried F))
      (nooneholding)
    )
  )

  (:action act3_pickup_D
    :parameters ()
    :precondition (and (step2) (ontable D) (clear D) (nooneholding))
    :effect (and
      (not (step2)) (step3)
      (carried D)
      (not (ontable D))
      (not (clear D))
      (not (nooneholding))
    )
  )

  (:action act4_stack_D_F
    :parameters ()
    :precondition (and (step3) (carried D) (clear F))
    :effect (and
      (not (step3)) (step4)
      (on D F)
      (clear D)
      (not (clear F))
      (not (carried D))
      (nooneholding)
    )
  )

  (:action act5_unstack_B_E
    :parameters ()
    :precondition (and (step4) (on B E) (clear B) (nooneholding))
    :effect (and
      (not (step4)) (step5)
      (carried B)
      (not (on B E))
      (clear E)
      (not (clear B))
      (not (ontable B))
      (not (nooneholding))
    )
  )

  (:action act6_putdown_B
    :parameters ()
    :precondition (and (step5) (carried B))
    :effect (and
      (not (step5)) (step6)
      (ontable B)
      (clear B)
      (not (carried B))
      (nooneholding)
    )
  )

  (:action act7_pickup_B
    :parameters ()
    :precondition (and (step6) (ontable B) (clear B) (nooneholding))
    :effect (and
      (not (step6)) (step7)
      (carried B)
      (not (ontable B))
      (not (clear B))
      (not (nooneholding))
    )
  )

  (:action act8_stack_B_D
    :parameters ()
    :precondition (and (step7) (carried B) (clear D))
    :effect (and
      (not (step7)) (step8)
      (on B D)
      (clear B)
      (not (clear D))
      (not (carried B))
      (nooneholding)
    )
  )

  (:action act9_unstack_B_D
    :parameters ()
    :precondition (and (step8) (on B D) (clear B) (nooneholding))
    :effect (and
      (not (step8)) (step9)
      (carried B)
      (not (on B D))
      (clear D)
      (not (clear B))
      (not (ontable B))
      (not (nooneholding))
    )
  )

  (:action act10_stack_B_C
    :parameters ()
    :precondition (and (step9) (carried B) (clear C))
    :effect (and
      (not (step9)) (step10)
      (on B C)
      (clear B)
      (not (clear C))
      (not (carried B))
      (nooneholding)
    )
  )

  (:action act11_unstack_B_C
    :parameters ()
    :precondition (and (step10) (on B C) (clear B) (nooneholding))
    :effect (and
      (not (step10)) (step11)
      (carried B)
      (not (on B C))
      (clear C)
      (not (clear B))
      (not (ontable B))
      (not (nooneholding))
    )
  )

  (:action act12_stack_B_D
    :parameters ()
    :precondition (and (step11) (carried B) (clear D))
    :effect (and
      (not (step11)) (step12)
      (on B D)
      (clear B)
      (not (clear D))
      (not (carried B))
      (nooneholding)
    )
  )

  (:action act13_unstack_C_H
    :parameters ()
    :precondition (and (step12) (on C H) (clear C) (nooneholding))
    :effect (and
      (not (step12)) (step13)
      (carried C)
      (not (on C H))
      (clear H)
      (not (clear C))
      (not (ontable C))
      (not (nooneholding))
    )
  )

  (:action act14_putdown_C
    :parameters ()
    :precondition (and (step13) (carried C))
    :effect (and
      (not (step13)) (step14)
      (ontable C)
      (clear C)
      (not (carried C))
      (nooneholding)
    )
  )

  (:action act15_unstack_E_A
    :parameters ()
    :precondition (and (step14) (on E A) (clear E) (nooneholding))
    :effect (and
      (not (step14)) (step15)
      (carried E)
      (not (on E A))
      (clear A)
      (not (clear E))
      (not (ontable E))
      (not (nooneholding))
    )
  )

  (:action act16_stack_E_B
    :parameters ()
    :precondition (and (step15) (carried E) (clear B))
    :effect (and
      (not (step15)) (step16)
      (on E B)
      (clear E)
      (not (clear B))
      (not (carried E))
      (nooneholding)
    )
  )

  (:action act17_pickup_A
    :parameters ()
    :precondition (and (step16) (ontable A) (clear A) (nooneholding))
    :effect (and
      (not (step16)) (step17)
      (carried A)
      (not (ontable A))
      (not (clear A))
      (not (nooneholding))
    )
  )

  (:action act18_stack_A_H
    :parameters ()
    :precondition (and (step17) (carried A) (clear H))
    :effect (and
      (not (step17)) (step18)
      (on A H)
      (clear A)
      (not (clear H))
      (not (carried A))
      (nooneholding)
    )
  )

  (:action act19_unstack_A_H
    :parameters ()
    :precondition (and (step18) (on A H) (clear A) (nooneholding))
    :effect (and
      (not (step18)) (step19)
      (carried A)
      (not (on A H))
      (clear H)
      (not (clear A))
      (not (ontable A))
      (not (nooneholding))
    )
  )

  (:action act20_putdown_A
    :parameters ()
    :precondition (and (step19) (carried A))
    :effect (and
      (not (step19)) (step20)
      (ontable A)
      (clear A)
      (not (carried A))
      (nooneholding)
    )
  )

  (:action act21_pickup_A
    :parameters ()
    :precondition (and (step20) (ontable A) (clear A) (nooneholding))
    :effect (and
      (not (step20)) (step21)
      (carried A)
      (not (ontable A))
      (not (clear A))
      (not (nooneholding))
    )
  )

  (:action act22_stack_A_H
    :parameters ()
    :precondition (and (step21) (carried A) (clear H))
    :effect (and
      (not (step21)) (step22)
      (on A H)
      (clear A)
      (not (clear H))
      (not (carried A))
      (nooneholding)
    )
  )

  (:action act23_unstack_A_H
    :parameters ()
    :precondition (and (step22) (on A H) (clear A) (nooneholding))
    :effect (and
      (not (step22)) (step23)
      (carried A)
      (not (on A H))
      (clear H)
      (not (clear A))
      (not (ontable A))
      (not (nooneholding))
    )
  )

  (:action act24_stack_A_H
    :parameters ()
    :precondition (and (step23) (carried A) (clear H))
    :effect (and
      (not (step23)) (step24)
      (on A H)
      (clear A)
      (not (clear H))
      (not (carried A))
      (nooneholding)
    )
  )

  (:action act25_unstack_E_B
    :parameters ()
    :precondition (and (step24) (on E B) (clear E) (nooneholding))
    :effect (and
      (not (step24)) (step25)
      (carried E)
      (not (on E B))
      (clear B)
      (not (clear E))
      (not (ontable E))
      (not (nooneholding))
    )
  )

  (:action act26_stack_E_B
    :parameters ()
    :precondition (and (step25) (carried E) (clear B))
    :effect (and
      (not (step25)) (step26)
      (on E B)
      (clear E)
      (not (clear B))
      (not (carried E))
      (nooneholding)
    )
  )

  (:action act27_unstack_A_H
    :parameters ()
    :precondition (and (step26) (on A H) (clear A) (nooneholding))
    :effect (and
      (not (step26)) (step27)
      (carried A)
      (not (on A H))
      (clear H)
      (not (clear A))
      (not (ontable A))
      (not (nooneholding))
    )
  )

  (:action act28_putdown_A
    :parameters ()
    :precondition (and (step27) (carried A))
    :effect (and
      (not (step27)) (step28)
      (ontable A)
      (clear A)
      (not (carried A))
      (nooneholding)
    )
  )

  (:action act29_unstack_E_B
    :parameters ()
    :precondition (and (step28) (on E B) (clear E) (nooneholding))
    :effect (and
      (not (step28)) (step29)
      (carried E)
      (not (on E B))
      (clear B)
      (not (clear E))
      (not (ontable E))
      (not (nooneholding))
    )
  )

  (:action act30_stack_E_A
    :parameters ()
    :precondition (and (step29) (carried E) (clear A))
    :effect (and
      (not (step29)) (step30)
      (on E A)
      (clear E)
      (not (clear A))
      (not (carried E))
      (nooneholding)
    )
  )
)