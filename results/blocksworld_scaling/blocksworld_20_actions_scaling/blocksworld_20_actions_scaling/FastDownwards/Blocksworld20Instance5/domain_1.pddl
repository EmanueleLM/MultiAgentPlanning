(define (domain blocksworld-multi-agent-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent step)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?ag - agent ?x - block)
    (handempty ?ag - agent)
    (current-step ?s - step)
  )

  ;; Step 1: unstack(H, D)
  (:action step1_unstack_H_D
    :parameters (?ag - agent)
    :precondition (and (on H D) (clear H) (handempty ?ag) (current-step step1))
    :effect (and
      (not (on H D))
      (holding ?ag H)
      (not (handempty ?ag))
      (clear D)
      (not (clear H))
      (not (ontable H))
      (not (current-step step1))
      (current-step step2)
    )
  )

  ;; Step 2: stack(H, C)
  (:action step2_stack_H_C
    :parameters (?ag - agent)
    :precondition (and (holding ?ag H) (clear C) (current-step step2))
    :effect (and
      (not (holding ?ag H))
      (handempty ?ag)
      (on H C)
      (not (clear C))
      (clear H)
      (not (current-step step2))
      (current-step step3)
    )
  )

  ;; Step 3: unstack(H, C)
  (:action step3_unstack_H_C
    :parameters (?ag - agent)
    :precondition (and (on H C) (clear H) (handempty ?ag) (current-step step3))
    :effect (and
      (not (on H C))
      (holding ?ag H)
      (not (handempty ?ag))
      (clear C)
      (not (clear H))
      (not (current-step step3))
      (current-step step4)
    )
  )

  ;; Step 4: putdown(H)
  (:action step4_putdown_H
    :parameters (?ag - agent)
    :precondition (and (holding ?ag H) (current-step step4))
    :effect (and
      (not (holding ?ag H))
      (handempty ?ag)
      (ontable H)
      (clear H)
      (not (current-step step4))
      (current-step step5)
    )
  )

  ;; Step 5: unstack(C, E)
  (:action step5_unstack_C_E
    :parameters (?ag - agent)
    :precondition (and (on C E) (clear C) (handempty ?ag) (current-step step5))
    :effect (and
      (not (on C E))
      (holding ?ag C)
      (not (handempty ?ag))
      (clear E)
      (not (clear C))
      (not (ontable C))
      (not (current-step step5))
      (current-step step6)
    )
  )

  ;; Step 6: putdown(C)
  (:action step6_putdown_C
    :parameters (?ag - agent)
    :precondition (and (holding ?ag C) (current-step step6))
    :effect (and
      (not (holding ?ag C))
      (handempty ?ag)
      (ontable C)
      (clear C)
      (not (current-step step6))
      (current-step step7)
    )
  )

  ;; Step 7: pickup(C)
  (:action step7_pickup_C
    :parameters (?ag - agent)
    :precondition (and (ontable C) (clear C) (handempty ?ag) (current-step step7))
    :effect (and
      (not (ontable C))
      (not (handempty ?ag))
      (holding ?ag C)
      (not (current-step step7))
      (current-step step8)
    )
  )

  ;; Step 8: stack(C, E)
  (:action step8_stack_C_E
    :parameters (?ag - agent)
    :precondition (and (holding ?ag C) (clear E) (current-step step8))
    :effect (and
      (not (holding ?ag C))
      (handempty ?ag)
      (on C E)
      (not (clear E))
      (clear C)
      (not (current-step step8))
      (current-step step9)
    )
  )

  ;; Step 9: unstack(C, E)
  (:action step9_unstack_C_E
    :parameters (?ag - agent)
    :precondition (and (on C E) (clear C) (handempty ?ag) (current-step step9))
    :effect (and
      (not (on C E))
      (holding ?ag C)
      (not (handempty ?ag))
      (clear E)
      (not (clear C))
      (not (current-step step9))
      (current-step step10)
    )
  )

  ;; Step 10: putdown(C)
  (:action step10_putdown_C
    :parameters (?ag - agent)
    :precondition (and (holding ?ag C) (current-step step10))
    :effect (and
      (not (holding ?ag C))
      (handempty ?ag)
      (ontable C)
      (clear C)
      (not (current-step step10))
      (current-step step11)
    )
  )

  ;; Step 11: pickup(C)
  (:action step11_pickup_C
    :parameters (?ag - agent)
    :precondition (and (ontable C) (clear C) (handempty ?ag) (current-step step11))
    :effect (and
      (not (ontable C))
      (not (handempty ?ag))
      (holding ?ag C)
      (not (current-step step11))
      (current-step step12)
    )
  )

  ;; Step 12: stack(C, D)
  (:action step12_stack_C_D
    :parameters (?ag - agent)
    :precondition (and (holding ?ag C) (clear D) (current-step step12))
    :effect (and
      (not (holding ?ag C))
      (handempty ?ag)
      (on C D)
      (not (clear D))
      (clear C)
      (not (current-step step12))
      (current-step step13)
    )
  )

  ;; Step 13: unstack(E, A)
  (:action step13_unstack_E_A
    :parameters (?ag - agent)
    :precondition (and (on E A) (clear E) (handempty ?ag) (current-step step13))
    :effect (and
      (not (on E A))
      (holding ?ag E)
      (not (handempty ?ag))
      (clear A)
      (not (clear E))
      (not (ontable E))
      (not (current-step step13))
      (current-step step14)
    )
  )

  ;; Step 14: putdown(E)
  (:action step14_putdown_E
    :parameters (?ag - agent)
    :precondition (and (holding ?ag E) (current-step step14))
    :effect (and
      (not (holding ?ag E))
      (handempty ?ag)
      (ontable E)
      (clear E)
      (not (current-step step14))
      (current-step step15)
    )
  )

  ;; Step 15: pickup(E)
  (:action step15_pickup_E
    :parameters (?ag - agent)
    :precondition (and (ontable E) (clear E) (handempty ?ag) (current-step step15))
    :effect (and
      (not (ontable E))
      (not (handempty ?ag))
      (holding ?ag E)
      (not (current-step step15))
      (current-step step16)
    )
  )

  ;; Step 16: stack(E, A)
  (:action step16_stack_E_A
    :parameters (?ag - agent)
    :precondition (and (holding ?ag E) (clear A) (current-step step16))
    :effect (and
      (not (holding ?ag E))
      (handempty ?ag)
      (on E A)
      (not (clear A))
      (clear E)
      (not (current-step step16))
      (current-step step17)
    )
  )

  ;; Step 17: pickup(H)
  (:action step17_pickup_H
    :parameters (?ag - agent)
    :precondition (and (ontable H) (clear H) (handempty ?ag) (current-step step17))
    :effect (and
      (not (ontable H))
      (not (handempty ?ag))
      (holding ?ag H)
      (not (current-step step17))
      (current-step step18)
    )
  )

  ;; Step 18: stack(H, E)
  (:action step18_stack_H_E
    :parameters (?ag - agent)
    :precondition (and (holding ?ag H) (clear E) (current-step step18))
    :effect (and
      (not (holding ?ag H))
      (handempty ?ag)
      (on H E)
      (not (clear E))
      (clear H)
      (not (current-step step18))
      (current-step step19)
    )
  )

  ;; Step 19: unstack(C, D)
  (:action step19_unstack_C_D
    :parameters (?ag - agent)
    :precondition (and (on C D) (clear C) (handempty ?ag) (current-step step19))
    :effect (and
      (not (on C D))
      (holding ?ag C)
      (not (handempty ?ag))
      (clear D)
      (not (clear C))
      (not (current-step step19))
      (current-step step20)
    )
  )

  ;; Step 20: putdown(C)
  (:action step20_putdown_C
    :parameters (?ag - agent)
    :precondition (and (holding ?ag C) (current-step step20))
    :effect (and
      (not (holding ?ag C))
      (handempty ?ag)
      (ontable C)
      (clear C)
      (not (current-step step20))
      (current-step step21)
    )
  )
)