(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (available ?p - participant ?t - timeslot)
    (within_work_hours ?t - timeslot)
    (preferred ?t - timeslot)
    (successor ?t1 - timeslot ?t2 - timeslot)
    (selected)
    (chosen ?t - timeslot)
    (assigned ?p - participant ?t - timeslot)
  )

  ;; select exactly one timeslot (enforced by the global "selected" flag)
  ;; and assign all participants to that chosen timeslot.
  (:action select_slot
    :parameters (?t - timeslot)
    :precondition (and
      (not (selected))
      (within_work_hours ?t)
      (available ralph ?t)
      (available peter ?t)
      (available daniel ?t)
    )
    :effect (and
      (selected)
      (chosen ?t)
      (assigned ralph ?t)
      (assigned peter ?t)
      (assigned daniel ?t)
    )
  )
)