(define (domain orchestrated_blocks_time)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent time)

  (:predicates
    (on ?b - block ?under - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?a - agent ?b - block)
    (handempty ?a - agent)
    (at ?t - time)
    (next ?t1 - time ?t2 - time)
  )

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
      (not (at ?t))
      (at ?t2)
      (not (handempty ?a))
      (holding ?a ?b)
      (not (ontable ?b))
      (not (clear ?b))
    )
  )

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
      (not (at ?t))
      (at ?t2)
      (not (handempty ?a))
      (holding ?a ?b)
      (not (on ?b ?under))
      (clear ?under)
      (not (clear ?b))
    )
  )

  (:action placer_putdown
    :parameters (?a - agent ?b - block ?t - time ?t2 - time)
    :precondition (and
      (at ?t)
      (next ?t ?t2)
      (holding ?a ?b)
    )
    :effect (and
      (not (at ?t))
      (at ?t2)
      (handempty ?a)
      (not (holding ?a ?b))
      (ontable ?b)
      (clear ?b)
    )
  )

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
      (not (at ?t))
      (at ?t2)
      (handempty ?a)
      (not (holding ?a ?b))
      (on ?b ?under)
      (not (clear ?under))
      (clear ?b)
    )
  )
)