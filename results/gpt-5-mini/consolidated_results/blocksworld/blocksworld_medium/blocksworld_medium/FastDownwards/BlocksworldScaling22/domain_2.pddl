(define (domain orchestrated_blocks_time)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent time)

  (:predicates
    ;; temporalized world fluents: predicate holds for a particular time step
    (on ?b - block ?under - block ?t - time)    ; ?b is directly on ?under at time ?t
    (ontable ?b - block ?t - time)              ; ?b is directly on the table at time ?t
    (clear ?b - block ?t - time)                ; ?b has nothing on top of it at time ?t and is not held
    (holding ?a - agent ?b - block ?t - time)   ; agent ?a is holding ?b at time ?t
    (handempty ?a - agent ?t - time)            ; agent ?a holds nothing at time ?t

    ;; discrete time / stage ordering
    (next ?t1 - time ?t2 - time)                ; ?t2 is the immediate successor of ?t1
  )

  ;; Lifter actions: remove a block from table or from another block.
  ;; Each action consumes one discrete time step: requires (next ?t ?t2) and deletes facts at ?t and adds facts at ?t2.
  (:action lifter_pickup
    :parameters (?a - agent ?b - block ?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (handempty ?a ?t)
      (ontable ?b ?t)
      (clear ?b ?t)
    )
    :effect (and
      ;; occupancy/hand changes anchored to times: delete from time ?t, add results at time ?t2
      (not (handempty ?a ?t))
      (holding ?a ?b ?t2)

      (not (ontable ?b ?t))
      (not (clear ?b ?t))
    )
  )

  (:action lifter_unstack
    :parameters (?a - agent ?b - block ?under - block ?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (handempty ?a ?t)
      (on ?b ?under ?t)
      (clear ?b ?t)
    )
    :effect (and
      (not (handempty ?a ?t))
      (holding ?a ?b ?t2)

      (not (on ?b ?under ?t))
      ;; the block that was supporting ?b becomes clear at the successor time
      (clear ?under ?t2)

      (not (clear ?b ?t))
    )
  )

  ;; Placer actions: place the held block onto the table or stack on another block.
  (:action placer_putdown
    :parameters (?a - agent ?b - block ?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (holding ?a ?b ?t)
    )
    :effect (and
      (handempty ?a ?t2)
      (not (holding ?a ?b ?t))

      (ontable ?b ?t2)
      (clear ?b ?t2)
    )
  )

  (:action placer_stack
    :parameters (?a - agent ?b - block ?under - block ?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (holding ?a ?b ?t)
      (clear ?under ?t)
    )
    :effect (and
      (handempty ?a ?t2)
      (not (holding ?a ?b ?t))

      (on ?b ?under ?t2)
      ;; the supporting block ceases to be clear at the time it is covered
      (not (clear ?under ?t))
      ;; the placed block is clear at successor time (nothing on top immediately after stacking)
      (clear ?b ?t2)
    )
  )
)