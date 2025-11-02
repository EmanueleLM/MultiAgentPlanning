(define (domain blocksworld-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent stage)

  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
    (at-stage ?s - stage)
  )

  ;; Step 1: unstack(E, A)
  (:action step1_unstack_E_A
    :parameters (?ag - agent)
    :precondition (and
      (at-stage s0)
      (on E A)
      (clear E)
      (handempty ?ag)
    )
    :effect (and
      (not (on E A))
      (holding ?ag E)
      (clear A)
      (not (handempty ?ag))
      (not (at-stage s0))
      (at-stage s1)
    )
  )

  ;; Step 2: stack(E, D)
  (:action step2_stack_E_D
    :parameters (?ag - agent)
    :precondition (and
      (at-stage s1)
      (holding ?ag E)
      (clear D)
    )
    :effect (and
      (not (holding ?ag E))
      (on E D)
      (not (clear D))
      (clear E)
      (handempty ?ag)
      (not (at-stage s1))
      (at-stage s2)
    )
  )

  ;; Step 3: unstack(E, D)
  (:action step3_unstack_E_D
    :parameters (?ag - agent)
    :precondition (and
      (at-stage s2)
      (on E D)
      (clear E)
      (handempty ?ag)
    )
    :effect (and
      (not (on E D))
      (holding ?ag E)
      (clear D)
      (not (handempty ?ag))
      (not (at-stage s2))
      (at-stage s3)
    )
  )

  ;; Step 4: stack(E, F)
  (:action step4_stack_E_F
    :parameters (?ag - agent)
    :precondition (and
      (at-stage s3)
      (holding ?ag E)
      (clear F)
    )
    :effect (and
      (not (holding ?ag E))
      (on E F)
      (not (clear F))
      (clear E)
      (handempty ?ag)
      (not (at-stage s3))
      (at-stage s4)
    )
  )

  ;; Step 5: unstack(D, C)
  (:action step5_unstack_D_C
    :parameters (?ag - agent)
    :precondition (and
      (at-stage s4)
      (on D C)
      (clear D)
      (handempty ?ag)
    )
    :effect (and
      (not (on D C))
      (holding ?ag D)
      (clear C)
      (not (handempty ?ag))
      (not (at-stage s4))
      (at-stage s5)
    )
  )

  ;; Step 6: putdown(D)
  (:action step6_putdown_D
    :parameters (?ag - agent)
    :precondition (and
      (at-stage s5)
      (holding ?ag D)
    )
    :effect (and
      (not (holding ?ag D))
      (on-table D)
      (handempty ?ag)
      (clear D)
      (not (at-stage s5))
      (at-stage s6)
    )
  )

  ;; Step 7: unstack(E, F)
  (:action step7_unstack_E_F
    :parameters (?ag - agent)
    :precondition (and
      (at-stage s6)
      (on E F)
      (clear E)
      (handempty ?ag)
    )
    :effect (and
      (not (on E F))
      (holding ?ag E)
      (clear F)
      (not (handempty ?ag))
      (not (at-stage s6))
      (at-stage s7)
    )
  )

  ;; Step 8: stack(E, F)  -- place back on F
  (:action step8_stack_E_F
    :parameters (?ag - agent)
    :precondition (and
      (at-stage s7)
      (holding ?ag E)
      (clear F)
    )
    :effect (and
      (not (holding ?ag E))
      (on E F)
      (not (clear F))
      (clear E)
      (handempty ?ag)
      (not (at-stage s7))
      (at-stage s8)
    )
  )

  ;; Step 9: unstack(E, F)  -- pick E off F again
  (:action step9_unstack_E_F_again
    :parameters (?ag - agent)
    :precondition (and
      (at-stage s8)
      (on E F)
      (clear E)
      (handempty ?ag)
    )
    :effect (and
      (not (on E F))
      (holding ?ag E)
      (clear F)
      (not (handempty ?ag))
      (not (at-stage s8))
      (at-stage s9)
    )
  )

  ;; Step 10: putdown(E)
  (:action step10_putdown_E
    :parameters (?ag - agent)
    :precondition (and
      (at-stage s9)
      (holding ?ag E)
    )
    :effect (and
      (not (holding ?ag E))
      (on-table E)
      (handempty ?ag)
      (clear E)
      (not (at-stage s9))
      (at-stage s10)
    )
  )

)