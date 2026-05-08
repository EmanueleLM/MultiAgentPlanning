(define (domain blocks-orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types support stage block - support)

  (:predicates
    (on ?b - block ?s - support)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (is-table ?s - support)
    (current ?st - stage)
    (next ?st1 - stage ?st2 - stage)
  )

  (:action picker-pick-up-from-table
    :parameters (?b - block ?s - support ?st - stage ?st2 - stage)
    :precondition (and
      (on ?b ?s)
      (is-table ?s)
      (clear ?b)
      (handempty)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?s))
      (not (clear ?b))
      (not (handempty))
      (not (current ?st))
      (current ?st2)
    )
  )

  (:action picker-put-down-to-table
    :parameters (?b - block ?s - support ?st - stage ?st2 - stage)
    :precondition (and
      (holding ?b)
      (is-table ?s)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      (on ?b ?s)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (current ?st))
      (current ?st2)
    )
  )

  (:action unstacker-unstack
    :parameters (?b - block ?s - block ?st - stage ?st2 - stage)
    :precondition (and
      (on ?b ?s)
      (clear ?b)
      (handempty)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?s))
      (not (clear ?b))
      (not (handempty))
      (clear ?s)
      (not (current ?st))
      (current ?st2)
    )
  )

  (:action stacker-stack-onto-block
    :parameters (?b - block ?d - block ?st - stage ?st2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?d)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      (on ?b ?d)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?d))
      (not (current ?st))
      (current ?st2)
    )
  )
)