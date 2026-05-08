(define (domain blocksworld-orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage - object)

  (:predicates
    (on ?b - block ?under - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  (:action pick-up
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (holding ?b)
      (not (handempty))
      (not (stage ?s))
      (stage ?s2)
    )
  )

  (:action unstack
    :parameters (?b - block ?under - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?under)
      (clear ?b)
      (handempty)
      (stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (not (clear ?b))
      (holding ?b)
      (not (handempty))
      (not (stage ?s))
      (stage ?s2)
    )
  )

  (:action put-down
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?b))
      (handempty)
      (not (stage ?s))
      (stage ?s2)
    )
  )

  (:action stack
    :parameters (?b - block ?under - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?under)
      (stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (on ?b ?under)
      (not (clear ?under))
      (clear ?b)
      (not (holding ?b))
      (handempty)
      (not (stage ?s))
      (stage ?s2)
    )
  )
)