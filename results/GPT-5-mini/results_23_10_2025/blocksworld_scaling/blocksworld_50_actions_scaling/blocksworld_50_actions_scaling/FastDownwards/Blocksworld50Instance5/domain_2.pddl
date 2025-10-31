(define (domain blocks)
  (:requirements :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (verified)
  )

  (:action pickup
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
    )
  )

  (:action putdown
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  (:action unstack
    :parameters (?b - block ?x - block)
    :precondition (and (on ?b ?x) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (clear ?x)
      (not (on ?b ?x))
      (not (clear ?b))
      (not (handempty))
    )
  )

  (:action stack
    :parameters (?b - block ?x - block)
    :precondition (and (holding ?b) (clear ?x))
    :effect (and
      (on ?b ?x)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?x))
    )
  )

  (:action verify-final-arrangement
    :parameters (?A ?B ?C ?D ?E ?F ?G ?H ?I ?J ?K ?L ?M - block)
    :precondition (and
      (ontable ?L)
      (ontable ?B)
      (ontable ?C)
      (ontable ?E)
      (ontable ?G)
      (ontable ?M)

      (on ?A ?L)
      (on ?K ?A)
      (on ?F ?B)
      (on ?J ?C)
      (on ?H ?J)
      (on ?D ?H)
      (on ?I ?G)
    )
    :effect (and (verified))
  )
)