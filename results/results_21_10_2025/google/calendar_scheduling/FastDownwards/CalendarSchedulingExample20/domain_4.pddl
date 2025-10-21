(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types participant slot)
  (:constants ralph peter daniel - participant)
  (:predicates
    (available ?p - participant ?s - slot)
    (proposed ?s - slot)
    (confirmed ?p - participant ?s - slot)
    (scheduled ?s - slot)
    (scheduled-any)
    (daniel-dislikes ?s - slot)
  )
  (:functions (total-cost))

  (:action propose-slot
    :parameters (?s - slot)
    :precondition (and
      (not (proposed ?s))
      (not (scheduled ?s))
    )
    :effect (proposed ?s)
  )

  (:action ralph-confirm
    :parameters (?s - slot)
    :precondition (and
      (proposed ?s)
      (available ralph ?s)
      (not (confirmed ralph ?s))
    )
    :effect (confirmed ralph ?s)
  )

  (:action peter-confirm
    :parameters (?s - slot)
    :precondition (and
      (proposed ?s)
      (available peter ?s)
      (not (confirmed peter ?s))
    )
    :effect (confirmed peter ?s)
  )

  (:action daniel-confirm
    :parameters (?s - slot)
    :precondition (and
      (proposed ?s)
      (available daniel ?s)
      (not (confirmed daniel ?s))
    )
    :effect (confirmed daniel ?s)
  )

  (:action finalize-preferred
    :parameters (?s - slot)
    :precondition (and
      (proposed ?s)
      (confirmed ralph ?s)
      (confirmed peter ?s)
      (confirmed daniel ?s)
      (not (scheduled ?s))
      (not (daniel-dislikes ?s))
    )
    :effect (and
      (scheduled ?s)
      (scheduled-any)
      (not (proposed ?s))
      (increase (total-cost) 0)
    )
  )

  (:action finalize-disliked
    :parameters (?s - slot)
    :precondition (and
      (proposed ?s)
      (confirmed ralph ?s)
      (confirmed peter ?s)
      (confirmed daniel ?s)
      (not (scheduled ?s))
      (daniel-dislikes ?s)
    )
    :effect (and
      (scheduled ?s)
      (scheduled-any)
      (not (proposed ?s))
      (increase (total-cost) 1)
    )
  )
)