(define (domain blocksworld_strict)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table stage)

  (:predicates
    (on-table ?b - block ?t - table)
    (on ?b - block ?below - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (stage-active ?s - stage)
    (next ?s - stage ?s2 - stage)
  )

  (:action pickup-from-table
    :parameters (?b - block ?t - table ?s - stage ?s2 - stage)
    :precondition (and
      (on-table ?b ?t)
      (clear ?b)
      (handempty)
      (stage-active ?s)
      (next ?s ?s2)
      (not (stage-active ?s2))
    )
    :effect (and
      (holding ?b)
      (not (on-table ?b ?t))
      (not (clear ?b))
      (not (handempty))
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )

  (:action unstack-from-block
    :parameters (?b - block ?below - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?below)
      (clear ?b)
      (handempty)
      (stage-active ?s)
      (next ?s ?s2)
      (not (stage-active ?s2))
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?below))
      (clear ?below)
      (not (clear ?b))
      (not (handempty))
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )

  (:action put-down-on-table
    :parameters (?b - block ?t - table ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (stage-active ?s)
      (next ?s ?s2)
      (not (stage-active ?s2))
    )
    :effect (and
      (on-table ?b ?t)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )

  (:action stack-on-block
    :parameters (?b - block ?dest - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?dest)
      (stage-active ?s)
      (next ?s ?s2)
      (not (stage-active ?s2))
    )
    :effect (and
      (on ?b ?dest)
      (clear ?b)
      (not (clear ?dest))
      (handempty)
      (not (holding ?b))
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )
)