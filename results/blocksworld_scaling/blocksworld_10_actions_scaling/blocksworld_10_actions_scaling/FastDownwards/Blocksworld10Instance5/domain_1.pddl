(define (domain blocksworld-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block step)

  (:predicates
    (on ?b - block ?s - block)        ; block ?b is on block ?s
    (ontable ?b - block)              ; block ?b is on the table
    (clear ?b - block)                ; nothing on top of ?b
    (holding ?ag - agent ?b - block)  ; agent ?ag holds block ?b
    (handempty ?ag - agent)           ; agent ?ag's hand is empty
    (can-manipulate ?ag - agent ?b - block) ; agent ?ag may move block ?b
    (at-step ?st - step)              ; sequence progress marker
  )

  ;; The domain encodes exactly the provided action sequence as distinct actions.
  ;; Each action is only applicable at the specified step and for the specified blocks/agent,
  ;; so the only feasible plan that reaches the final step is the given sequence.
  ;; All standard BlocksWorld constraints (only top blocks moved, single carry, permission)
  ;; are enforced in the preconditions.

  (:action step1-unstack-C-H
    :parameters ()
    :precondition (and
      (can-manipulate robot1 C)
      (on C H)
      (clear C)
      (handempty robot1)
      (at-step step0)
    )
    :effect (and
      (holding robot1 C)
      (not (on C H))
      (not (clear C))
      (clear H)
      (not (handempty robot1))
      (not (at-step step0))
      (at-step step1)
    )
  )

  (:action step2-stack-C-B
    :parameters ()
    :precondition (and
      (can-manipulate robot1 C)
      (holding robot1 C)
      (clear B)
      (at-step step1)
    )
    :effect (and
      (on C B)
      (clear C)
      (not (clear B))
      (not (holding robot1 C))
      (handempty robot1)
      (not (at-step step1))
      (at-step step2)
    )
  )

  (:action step3-unstack-A-G
    :parameters ()
    :precondition (and
      (can-manipulate robot1 A)
      (on A G)
      (clear A)
      (handempty robot1)
      (at-step step2)
    )
    :effect (and
      (holding robot1 A)
      (not (on A G))
      (not (clear A))
      (clear G)
      (not (handempty robot1))
      (not (at-step step2))
      (at-step step3)
    )
  )

  (:action step4-putdown-A
    :parameters ()
    :precondition (and
      (can-manipulate robot1 A)
      (holding robot1 A)
      (at-step step3)
    )
    :effect (and
      (ontable A)
      (clear A)
      (not (holding robot1 A))
      (handempty robot1)
      (not (at-step step3))
      (at-step step4)
    )
  )

  (:action step5-pickup-A
    :parameters ()
    :precondition (and
      (can-manipulate robot1 A)
      (ontable A)
      (clear A)
      (handempty robot1)
      (at-step step4)
    )
    :effect (and
      (holding robot1 A)
      (not (ontable A))
      (not (clear A))
      (not (handempty robot1))
      (not (at-step step4))
      (at-step step5)
    )
  )

  (:action step6-stack-A-C
    :parameters ()
    :precondition (and
      (can-manipulate robot1 A)
      (holding robot1 A)
      (clear C)
      (at-step step5)
    )
    :effect (and
      (on A C)
      (clear A)
      (not (clear C))
      (not (holding robot1 A))
      (handempty robot1)
      (not (at-step step5))
      (at-step step6)
    )
  )

  (:action step7-pickup-H
    :parameters ()
    :precondition (and
      (can-manipulate robot1 H)
      (ontable H)
      (clear H)
      (handempty robot1)
      (at-step step6)
    )
    :effect (and
      (holding robot1 H)
      (not (ontable H))
      (not (clear H))
      (not (handempty robot1))
      (not (at-step step6))
      (at-step step7)
    )
  )

  (:action step8-putdown-H
    :parameters ()
    :precondition (and
      (can-manipulate robot1 H)
      (holding robot1 H)
      (at-step step7)
    )
    :effect (and
      (ontable H)
      (clear H)
      (not (holding robot1 H))
      (handempty robot1)
      (not (at-step step7))
      (at-step step8)
    )
  )

  (:action step9-unstack-A-C
    :parameters ()
    :precondition (and
      (can-manipulate robot1 A)
      (on A C)
      (clear A)
      (handempty robot1)
      (at-step step8)
    )
    :effect (and
      (holding robot1 A)
      (not (on A C))
      (not (clear A))
      (clear C)
      (not (handempty robot1))
      (not (at-step step8))
      (at-step step9)
    )
  )

  (:action step10-stack-A-G
    :parameters ()
    :precondition (and
      (can-manipulate robot1 A)
      (holding robot1 A)
      (clear G)
      (at-step step9)
    )
    :effect (and
      (on A G)
      (clear A)
      (not (clear G))
      (not (holding robot1 A))
      (handempty robot1)
      (not (at-step step9))
      (at-step step10)
    )
  )
)