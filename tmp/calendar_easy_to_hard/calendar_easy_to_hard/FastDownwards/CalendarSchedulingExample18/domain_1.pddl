(define (domain combined-schedule)
  (:requirements :typing :negative-preconditions :conditional-effects :action-costs :fluents :equality :adl)
  (:types slot person)

  (:predicates
    (slot ?s - slot)
    (within-work-hours ?s - slot)
    (slot-free ?s - slot)
    (late ?s - slot)

    (available-brian ?s - slot)
    (busy-billy ?s - slot)
    (busy-patricia ?s - slot)

    (meeting-booked)
    (meeting-at ?s - slot)
    (attends-brian ?s - slot)
    (attends-billy ?s - slot)
    (attends-patricia ?s - slot)
  )

  (:functions (total-cost))

  (:action schedule-by-brian
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (within-work-hours ?s)
      (slot-free ?s)
      (available-brian ?s)
      (not (busy-billy ?s))
      (not (busy-patricia ?s))
      (not (meeting-booked))
    )
    :effect (and
      (meeting-booked)
      (meeting-at ?s)
      (attends-brian ?s)
      (attends-billy ?s)
      (attends-patricia ?s)
      (not (slot-free ?s))
      (when (late ?s) (increase (total-cost) 1))
    )
  )

  (:action schedule-by-billy
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (within-work-hours ?s)
      (slot-free ?s)
      (not (busy-billy ?s))
      (not (busy-patricia ?s))
      (available-brian ?s)
      (not (meeting-booked))
    )
    :effect (and
      (meeting-booked)
      (meeting-at ?s)
      (attends-brian ?s)
      (attends-billy ?s)
      (attends-patricia ?s)
      (not (slot-free ?s))
      (when (late ?s) (increase (total-cost) 1))
    )
  )

  (:action schedule-by-patricia
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (within-work-hours ?s)
      (slot-free ?s)
      (not (busy-patricia ?s))
      (not (busy-billy ?s))
      (available-brian ?s)
      (not (meeting-booked))
    )
    :effect (and
      (meeting-booked)
      (meeting-at ?s)
      (attends-brian ?s)
      (attends-billy ?s)
      (attends-patricia ?s)
      (not (slot-free ?s))
      (when (late ?s) (increase (total-cost) 1))
    )
  )
)