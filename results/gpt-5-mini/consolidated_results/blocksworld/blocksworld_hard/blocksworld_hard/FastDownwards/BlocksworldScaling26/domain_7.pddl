(define (domain blocks-sequenced)
  (:requirements :strips :typing :negative-preconditions)
  ;; types: 'support' and 'phase' are base types; blocks and the table are supports
  (:types support phase block table - support)

  (:predicates
    (handempty)
    (holding ?b - block)
    (on ?b - block ?s - support)
    (clear ?b - block)
    (at-phase ?p - phase)
    (next ?p1 - phase ?p2 - phase)
  )

  (:action unstack
    :parameters (?b - block ?s - block ?p - phase ?pn - phase)
    :precondition (and
      (at-phase ?p)
      (next ?p ?pn)
      (on ?b ?s)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (holding ?b)
      (not (handempty))
      (not (on ?b ?s))
      (clear ?s)
      (not (clear ?b))
      (not (at-phase ?p))
      (at-phase ?pn)
    )
  )

  (:action pick-up
    :parameters (?b - block ?t - table ?p - phase ?pn - phase)
    :precondition (and
      (at-phase ?p)
      (next ?p ?pn)
      (on ?b ?t)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (holding ?b)
      (not (handempty))
      (not (on ?b ?t))
      (not (clear ?b))
      (not (at-phase ?p))
      (at-phase ?pn)
    )
  )

  (:action put-down
    :parameters (?b - block ?t - table ?p - phase ?pn - phase)
    :precondition (and
      (at-phase ?p)
      (next ?p ?pn)
      (holding ?b)
    )
    :effect (and
      (on ?b ?t)
      (handempty)
      (not (holding ?b))
      (clear ?b)
      (not (at-phase ?p))
      (at-phase ?pn)
    )
  )

  (:action stack
    :parameters (?b - block ?s - block ?p - phase ?pn - phase)
    :precondition (and
      (at-phase ?p)
      (next ?p ?pn)
      (holding ?b)
      (clear ?s)
    )
    :effect (and
      (on ?b ?s)
      (handempty)
      (not (holding ?b))
      (not (clear ?s))
      (clear ?b)
      (not (at-phase ?p))
      (at-phase ?pn)
    )
  )
)