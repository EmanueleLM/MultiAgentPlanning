(define (domain blocksworld-orchestrated)
  :requirements :strips :typing :negative-preconditions
  :types block place - object

  :predicates
    (on ?b - block ?x - object)
    (clear ?b - block)
    (handempty)
    (holding ?b - block)

  (:action pick-up
    :parameters (?b - block ?p - place)
    :precondition (and
      (on ?b ?p)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b ?p))
      (not (clear ?b))
      (holding ?b)
      (not (handempty))
    )
  )

  (:action unstack
    :parameters (?b - block ?under - block)
    :precondition (and
      (on ?b ?under)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (not (clear ?b))
      (holding ?b)
      (not (handempty))
    )
  )

  (:action put-down
    :parameters (?b - block ?p - place)
    :precondition (and
      (holding ?b)
    )
    :effect (and
      (on ?b ?p)
      (clear ?b)
      (not (holding ?b))
      (handempty)
    )
  )

  (:action stack
    :parameters (?b - block ?under - block)
    :precondition (and
      (holding ?b)
      (clear ?under)
    )
    :effect (and
      (on ?b ?under)
      (not (clear ?under))
      (clear ?b)
      (not (holding ?b))
      (handempty)
    )
  )
)