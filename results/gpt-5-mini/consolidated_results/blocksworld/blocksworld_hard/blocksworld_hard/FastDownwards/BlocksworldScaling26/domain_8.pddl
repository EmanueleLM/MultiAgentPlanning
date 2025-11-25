(define (domain blocks-sequenced)
  (:requirements :strips :typing :negative-preconditions)
  ;; types: block and table are subtypes of support; phase is separate
  (:types block table - support phase)

  (:predicates
    (handempty)
    (holding ?b - block)
    (on ?b - block ?s - support)
    (clear ?b - block)
    (at-phase ?p - phase)
    (next ?p1 - phase ?p2 - phase)
  )

  ;; Unstack a block from another block (requires contiguous phase progression)
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

  ;; Pick up a block from the table (requires contiguous phase progression)
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

  ;; Put down a held block onto the table (requires contiguous phase progression)
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

  ;; Stack a held block onto another block (requires contiguous phase progression)
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