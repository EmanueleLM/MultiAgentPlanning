(define (domain blocksworld-scaling10-domain)
  :requirements :strips :typing :negative-preconditions
  :types block
  :predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  (:action pick-up
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (holding ?b)
      (not (handempty))
    )
  )
  (:action unstack
    :parameters (?b - block ?p - block)
    :precondition (and (on ?b ?p) (clear ?b) (handempty))
    :effect (and
      (not (on ?b ?p))
      (not (clear ?b))
      (holding ?b)
      (clear ?p)
      (not (handempty))
    )
  )
  (:action put-down
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?b))
      (handempty)
    )
  )
  (:action stack
    :parameters (?b - block ?p - block)
    :precondition (and (holding ?b) (clear ?p))
    :effect (and
      (on ?b ?p)
      (clear ?b)
      (not (clear ?p))
      (not (holding ?b))
      (handempty)
    )
  )
)