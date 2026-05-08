(define (domain orchestrated_blocks_time)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent time)

  (:predicates
    ;; world fluents
    (on ?b - block ?under - block)    ; ?b is directly on ?under
    (ontable ?b - block)              ; ?b is directly on the table
    (clear ?b - block)                ; ?b has nothing on top of it and is not held
    (holding ?a - agent ?b - block)   ; agent ?a is holding ?b
    (handempty ?a - agent)            ; agent ?a holds nothing

    ;; discrete time / stage control
    (at ?t - time)                    ; current stage is ?t
    (next ?t1 - time ?t2 - time)      ; ?t2 is immediate successor of ?t1
  )

  ;; Lifter: pick up a clear block from the table (consumes the current stage -> next stage).
  (:action lifter_pickup
    :parameters (?a - agent ?b - block ?t - time ?t2 - time)
    :precondition (and
      (at ?t)
      (next ?t ?t2)
      (handempty ?a)
      (ontable ?b)
      (clear ?b)
    )
    :effect (and
      ;; advance stage (contiguous occupancy of stages)
      (not (at ?t))
      (at ?t2)

      ;; hand and holding updates
      (not (handempty ?a))
      (holding ?a ?b)

      ;; block leaves the table and is no longer clear (held)
      (not (ontable ?b))
      (not (clear ?b))
    )
  )

  ;; Lifter: unstack a clear block from on top of another block (consumes one stage).
  (:action lifter_unstack
    :parameters (?a - agent ?b - block ?under - block ?t - time ?t2 - time)
    :precondition (and
      (at ?t)
      (next ?t ?t2)
      (handempty ?a)
      (on ?b ?under)
      (clear ?b)
    )
    :effect (and
      ;; advance stage
      (not (at ?t))
      (at ?t2)

      ;; hand and holding updates
      (not (handempty ?a))
      (holding ?a ?b)

      ;; remove the on relation; support becomes clear; moved block not clear while held
      (not (on ?b ?under))
      (clear ?under)
      (not (clear ?b))
    )
  )

  ;; Placer: put down the held block on the table (consumes one stage).
  (:action placer_putdown
    :parameters (?a - agent ?b - block ?t - time ?t2 - time)
    :precondition (and
      (at ?t)
      (next ?t ?t2)
      (holding ?a ?b)
    )
    :effect (and
      ;; advance stage
      (not (at ?t))
      (at ?t2)

      ;; hand and holding updates
      (handempty ?a)
      (not (holding ?a ?b))

      ;; block is on the table and clear after putdown
      (ontable ?b)
      (clear ?b)
    )
  )

  ;; Placer: stack the held block onto a clear supporting block (consumes one stage).
  (:action placer_stack
    :parameters (?a - agent ?b - block ?under - block ?t - time ?t2 - time)
    :precondition (and
      (at ?t)
      (next ?t ?t2)
      (holding ?a ?b)
      (clear ?under)
      (not (= ?b ?under))
    )
    :effect (and
      ;; advance stage
      (not (at ?t))
      (at ?t2)

      ;; hand and holding updates
      (handempty ?a)
      (not (holding ?a ?b))

      ;; place the block on the support; update clear statuses
      (on ?b ?under)
      (not (clear ?under))
      (clear ?b)
    )
  )
)