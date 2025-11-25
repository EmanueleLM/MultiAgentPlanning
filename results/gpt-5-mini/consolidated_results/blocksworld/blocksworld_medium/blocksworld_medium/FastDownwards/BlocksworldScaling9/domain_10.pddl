(define (domain blocksworld-orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types block time)

  (:predicates
    (on ?b - block ?under - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (at ?t - time)
    (succ ?t1 - time ?t2 - time)
  )

  (:action pick-up
    :parameters (?b - block ?t - time ?t2 - time)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (at ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (holding ?b)
      (not (handempty))
      (not (at ?t))
      (at ?t2)
    )
  )

  (:action unstack
    :parameters (?b - block ?under - block ?t - time ?t2 - time)
    :precondition (and
      (on ?b ?under)
      (clear ?b)
      (handempty)
      (at ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (not (clear ?b))
      (holding ?b)
      (not (handempty))
      (not (at ?t))
      (at ?t2)
    )
  )

  (:action put-down
    :parameters (?b - block ?t - time ?t2 - time)
    :precondition (and
      (holding ?b)
      (at ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?b))
      (handempty)
      (not (at ?t))
      (at ?t2)
    )
  )

  (:action stack
    :parameters (?b - block ?under - block ?t - time ?t2 - time)
    :precondition (and
      (holding ?b)
      (clear ?under)
      (not (= ?b ?under))
      (at ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (on ?b ?under)
      (not (clear ?under))
      (clear ?b)
      (not (holding ?b))
      (handempty)
      (not (at ?t))
      (at ?t2)
    )
  )
)