(define (domain blocks-sequenced)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table - support phase)

  (:predicates
    (handempty)
    (holding ?b - block)
    (on ?b - block ?s - support)
    (clear ?b - block)
    (at-phase ?p - phase)
    (next ?p1 - phase ?p2 - phase)
  )

  ;; Unstack a block ?b from on top of another block ?s
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
      ;; b is now held
      (holding ?b)
      (not (handempty))

      ;; b is no longer on s
      (not (on ?b ?s))

      ;; s becomes clear because b was removed
      (clear ?s)

      ;; a held block is not considered clear (per specification)
      (not (clear ?b))

      ;; advance phase
      (not (at-phase ?p))
      (at-phase ?pn)
    )
  )

  ;; Pick-up a block ?b from the table ?t
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

      ;; remove table support
      (not (on ?b ?t))

      ;; a held block is not considered clear
      (not (clear ?b))

      ;; advance phase
      (not (at-phase ?p))
      (at-phase ?pn)
    )
  )

  ;; Put-down a held block ?b onto the table ?t
  (:action put-down
    :parameters (?b - block ?t - table ?p - phase ?pn - phase)
    :precondition (and
      (at-phase ?p)
      (next ?p ?pn)
      (holding ?b)
    )
    :effect (and
      ;; place b on the table
      (on ?b ?t)

      ;; hand becomes empty
      (handempty)
      (not (holding ?b))

      ;; once put down on the table, b is not held and is clear
      (clear ?b)

      ;; advance phase
      (not (at-phase ?p))
      (at-phase ?pn)
    )
  )

  ;; Stack a held block ?b on top of block ?s
  (:action stack
    :parameters (?b - block ?s - block ?p - phase ?pn - phase)
    :precondition (and
      (at-phase ?p)
      (next ?p ?pn)
      (holding ?b)
      (clear ?s)
    )
    :effect (and
      ;; b is now on s
      (on ?b ?s)

      ;; hand becomes empty
      (handempty)
      (not (holding ?b))

      ;; s is no longer clear after b is stacked on it
      (not (clear ?s))

      ;; the placed block b is not held and has nothing on top, but per spec
      ;; a block that was just placed is not held and therefore clear
      (clear ?b)

      ;; advance phase
      (not (at-phase ?p))
      (at-phase ?pn)
    )
  )
)