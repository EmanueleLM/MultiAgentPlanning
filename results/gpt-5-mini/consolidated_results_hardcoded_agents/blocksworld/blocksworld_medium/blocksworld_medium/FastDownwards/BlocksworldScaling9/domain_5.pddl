(define (domain blocksworld-orchestrated)
  :requirements :strips :typing
  :types block - object

  :predicates
    (on ?b - block ?under - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)

  (:action pick-up
    :parameters (?b - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (ontable ?b))
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
    :parameters (?b - block)
    :precondition (and
      (holding ?b)
    )
    :effect (and
      (ontable ?b)
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