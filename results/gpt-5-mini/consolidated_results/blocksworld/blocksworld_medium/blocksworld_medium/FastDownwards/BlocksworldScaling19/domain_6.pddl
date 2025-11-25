(define (domain blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (stage-active ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  (:action pick-up
    :parameters (?b - block ?t - stage ?t2 - stage)
    :precondition (and
      (clear ?b)
      (ontable ?b)
      (handempty)
      (stage-active ?t)
      (next ?t ?t2)
    )
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (not (stage-active ?t))
      (stage-active ?t2)
    )
  )

  (:action unstack
    :parameters (?b - block ?c - block ?t - stage ?t2 - stage)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (stage-active ?t)
      (next ?t ?t2)
    )
    :effect (and
      (holding ?b)
      (clear ?c)
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (not (stage-active ?t))
      (stage-active ?t2)
    )
  )

  (:action put-down
    :parameters (?b - block ?t - stage ?t2 - stage)
    :precondition (and
      (holding ?b)
      (stage-active ?t)
      (next ?t ?t2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (stage-active ?t))
      (stage-active ?t2)
    )
  )

  (:action stack
    :parameters (?b - block ?c - block ?t - stage ?t2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (stage-active ?t)
      (next ?t ?t2)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (handempty)
      (not (holding ?b))
      (not (stage-active ?t))
      (stage-active ?t2)
    )
  )
)