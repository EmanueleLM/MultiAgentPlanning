(define (domain blocks-sequenced)
  (:requirements :strips :typing)
  (:types block table - support phase)

  (:predicates
    (handempty)
    (holding ?b - block)
    (on ?b - block ?s - support)
    (clear ?b - block)
    (at-phase ?p - phase)
    (next ?p1 - phase ?p2 - phase)
  )

  ;; Unstack: remove ?b from ?s (both blocks)
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
      ;; book-keeping for the hand
      (holding ?b)
      (not (handempty))

      ;; update support s (it becomes clear because b is removed)
      (clear ?s)

      ;; remove the support relation of b
      (not (on ?b ?s))

      ;; keep clear(b) true while held
      (clear ?b)

      ;; progress the enforced sequence
      (not (at-phase ?p))
      (at-phase ?pn)
    )
  )

  ;; Pick-up: pick a block ?b from the table ?t
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

      ;; keep clear(b) true while held
      (clear ?b)

      ;; progress the enforced sequence
      (not (at-phase ?p))
      (at-phase ?pn)
    )
  )

  ;; Put-down: put a held block ?b onto the table ?t
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

      ;; hand bookkeeping
      (handempty)
      (not (holding ?b))

      ;; b remains clear after put-down
      (clear ?b)

      ;; progress the enforced sequence
      (not (at-phase ?p))
      (at-phase ?pn)
    )
  )

  ;; Stack: place held block ?b on block ?s
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

      ;; hand bookkeeping
      (handempty)
      (not (holding ?b))

      ;; s is no longer clear
      (not (clear ?s))

      ;; b remains clear (nothing on top of b)
      (clear ?b)

      ;; progress the enforced sequence
      (not (at-phase ?p))
      (at-phase ?pn)
    )
  )
)