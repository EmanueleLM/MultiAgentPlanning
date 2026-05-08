(define (domain blocks-world-with-time)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (now ?t - step)
    (succ ?t - step ?t2 - step)
  )

  (:action pickup
    :parameters (?b - block ?t - step ?t2 - step)
    :precondition (and (ontable ?b) (clear ?b) (handempty) (now ?t) (succ ?t ?t2))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (not (now ?t))
      (now ?t2)
    )
  )

  (:action putdown
    :parameters (?b - block ?t - step ?t2 - step)
    :precondition (and (holding ?b) (now ?t) (succ ?t ?t2))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (now ?t))
      (now ?t2)
    )
  )

  (:action unstack
    :parameters (?b - block ?under - block ?t - step ?t2 - step)
    :precondition (and (on ?b ?under) (clear ?b) (handempty) (now ?t) (succ ?t ?t2))
    :effect (and
      (holding ?b)
      (clear ?under)
      (not (on ?b ?under))
      (not (clear ?b))
      (not (handempty))
      (not (ontable ?b))
      (not (now ?t))
      (now ?t2)
    )
  )

  (:action stack
    :parameters (?b - block ?under - block ?t - step ?t2 - step)
    :precondition (and (holding ?b) (clear ?under) (now ?t) (succ ?t ?t2))
    :effect (and
      (on ?b ?under)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?under))
      (not (ontable ?b))
      (not (now ?t))
      (now ?t2)
    )
  )
)