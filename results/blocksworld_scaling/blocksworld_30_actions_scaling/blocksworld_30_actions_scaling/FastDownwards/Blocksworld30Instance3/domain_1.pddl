(define (domain blocksworld-trace-instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    ;; Blocks relations
    (on ?b - block ?under - block)    ; block b is on block under
    (ontable ?b - block)              ; block b is on the table
    (clear ?b - block)                ; nothing on top of block b
    (carried ?b - block)              ; this block is currently being carried (globally)
    (nooneholding)                    ; true iff no block is currently carried

    ;; step fluents to enforce the exact trace order
    (step0) (step1) (step2) (step3) (step4) (step5) (step6) (step7) (step8) (step9)
    (step10) (step11) (step12) (step13) (step14) (step15) (step16) (step17) (step18) (step19)
    (step20) (step21) (step22) (step23) (step24) (step25) (step26) (step27) (step28) (step29)
    (step30)
  )

  ;; Action semantics used by the trace actions:
  ;; - unstack(X,Y): remove top block X from block Y and make it carried
  ;; - putdown(X): put the carried block X on the table
  ;; - pickup(X): pick up an ontable block X
  ;; - stack(X,Y): put carried block X onto clear block Y
  ;; Each trace action below both performs the block operation and advances the step fluent
  ;; so the actions must be executed in the exact order step0 -> step1 -> ... -> step30.

  ;; 1: unstack(F, D)
  (:action act1_unstack_F_D
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

  ;; 2: putdown(F)
  (:action act2_putdown_F
    :precondition (and (step1) (carried F))
    :effect (and
      (not (step1)) (step2)
      (ontable F)
      (clear F)
      (not (carried F))
      (nooneholding)
    )
  )

  ;; 3: pickup(D)
  (:action act3_pickup_D
    :precondition (and (step2) (ontable D) (clear D) (nooneholding))
    :effect (and
      (not (step2)) (step3)
      (carried D)
      (not (ontable D))
      (not (clear D))
      (not (nooneholding))
    )
  )

  ;; 4: stack(D, F)
  (:action act4_stack_D_F
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

  ;; 5: unstack(B, E)
  (:action act5_unstack_B_E
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

  ;; 6: putdown(B)
  (:action act6_putdown_B
    :precondition (and (step5) (carried B))
    :effect (and
      (not (step5)) (step6)
      (ontable B)
      (clear B)
      (not (carried B))
      (nooneholding)
    )
  )

  ;; 7: pickup(B)
  (:action act7_pickup_B
    :precondition (and (step6) (ontable B) (clear B) (nooneholding))
    :effect (and
      (not (step6)) (step7)
      (carried B)
      (not (ontable B))
      (not (clear B))
      (not (nooneholding))
    )
  )

  ;; 8: stack(B, D)
  (:action act8_stack_B_D
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

  ;; 9: unstack(B, D)
  (:action act9_unstack_B_D
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

  ;; 10: stack(B, C)
  (:action act10_stack_B_C
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

  ;; 11: unstack(B, C)
  (:action act11_unstack_B_C
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

  ;; 12: stack(B, D)
  (:action act12_stack_B_D
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

  ;; 13: unstack(C, H)
  (:action act13_unstack_C_H
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

  ;; 14: putdown(C)
  (:action act14_putdown_C
    :precondition (and (step13) (carried C))
    :effect (and
      (not (step13)) (step14)
      (ontable C)
      (clear C)
      (not (carried C))
      (nooneholding)
    )
  )

  ;; 15: unstack(E, A)
  (:action act15_unstack_E_A
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

  ;; 16: stack(E, B)
  (:action act16_stack_E_B
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

  ;; 17: pickup(A)
  (:action act17_pickup_A
    :precondition (and (step16) (ontable A) (clear A) (nooneholding))
    :effect (and
      (not (step16)) (step17)
      (carried A)
      (not (ontable A))
      (not (clear A))
      (not (nooneholding))
    )
  )

  ;; 18: stack(A, H)
  (:action act18_stack_A_H
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

  ;; 19: unstack(A, H)
  (:action act19_unstack_A_H
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

  ;; 20: putdown(A)
  (:action act20_putdown_A
    :precondition (and (step19) (carried A))
    :effect (and
      (not (step19)) (step20)
      (ontable A)
      (clear A)
      (not (carried A))
      (nooneholding)
    )
  )

  ;; 21: pickup(A)
  (:action act21_pickup_A
    :precondition (and (step20) (ontable A) (clear A) (nooneholding))
    :effect (and
      (not (step20)) (step21)
      (carried A)
      (not (ontable A))
      (not (clear A))
      (not (nooneholding))
    )
  )

  ;; 22: stack(A, H)
  (:action act22_stack_A_H
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

  ;; 23: unstack(A, H)
  (:action act23_unstack_A_H
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

  ;; 24: stack(A, H)
  (:action act24_stack_A_H
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

  ;; 25: unstack(E, B)
  (:action act25_unstack_E_B
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

  ;; 26: stack(E, B)
  (:action act26_stack_E_B
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

  ;; 27: unstack(A, H)
  (:action act27_unstack_A_H
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

  ;; 28: putdown(A)
  (:action act28_putdown_A
    :precondition (and (step27) (carried A))
    :effect (and
      (not (step27)) (step28)
      (ontable A)
      (clear A)
      (not (carried A))
      (nooneholding)
    )
  )

  ;; 29: unstack(E, B)
  (:action act29_unstack_E_B
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

  ;; 30: stack(E, A)
  (:action act30_stack_E_A
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