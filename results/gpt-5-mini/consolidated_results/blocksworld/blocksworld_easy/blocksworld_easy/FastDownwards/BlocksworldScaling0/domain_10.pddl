(define (domain orchestrator-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?b - block ?s - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (atstage ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  (:action pick-up
    :parameters (?b - block ?t - stage ?t2 - stage)
    :precondition (and
      (handempty)
      (ontable ?b)
      (clear ?b)
      (atstage ?t)
      (next ?t ?t2)
    )
    :effect (and
      (atstage ?t2)
      (not (atstage ?t))
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
    )
  )

  (:action unstack
    :parameters (?b - block ?s - block ?t - stage ?t2 - stage)
    :precondition (and
      (handempty)
      (on ?b ?s)
      (clear ?b)
      (atstage ?t)
      (next ?t ?t2)
    )
    :effect (and
      (atstage ?t2)
      (not (atstage ?t))
      (holding ?b)
      (clear ?s)
      (not (on ?b ?s))
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
    )
  )

  (:action put-down
    :parameters (?b - block ?t - stage ?t2 - stage)
    :precondition (and
      (holding ?b)
      (atstage ?t)
      (next ?t ?t2)
    )
    :effect (and
      (atstage ?t2)
      (not (atstage ?t))
      (ontable ?b)
      (clear ?b)
      (not (holding ?b))
      (handempty)
    )
  )

  (:action stack
    :parameters (?b - block ?tgt - block ?t - stage ?t2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?tgt)
      (atstage ?t)
      (next ?t ?t2)
    )
    :effect (and
      (atstage ?t2)
      (not (atstage ?t))
      (on ?b ?tgt)
      (clear ?b)
      (not (holding ?b))
      (handempty)
      (not (clear ?tgt))
      (not (ontable ?b))
    )
  )
)