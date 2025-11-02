(define (domain combined-schedule)
  (:requirements :typing :negative-preconditions :adl :action-costs :equality)
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

  ;; Brian scheduling actions (normal and late to encode costs)
  (:action schedule-by-brian-normal
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (within-work-hours ?s)
      (slot-free ?s)
      (available-brian ?s)
      (not (busy-billy ?s))
      (not (busy-patricia ?s))
      (not (late ?s))
      (not (meeting-booked))
    )
    :effect (and
      (meeting-booked)
      (meeting-at ?s)
      (attends-brian ?s)
      (attends-billy ?s)
      (attends-patricia ?s)
      (not (slot-free ?s))
    )
    :cost 0
  )

  (:action schedule-by-brian-late
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (within-work-hours ?s)
      (slot-free ?s)
      (available-brian ?s)
      (not (busy-billy ?s))
      (not (busy-patricia ?s))
      (late ?s)
      (not (meeting-booked))
    )
    :effect (and
      (meeting-booked)
      (meeting-at ?s)
      (attends-brian ?s)
      (attends-billy ?s)
      (attends-patricia ?s)
      (not (slot-free ?s))
    )
    :cost 1
  )

  ;; Billy scheduling actions
  (:action schedule-by-billy-normal
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (within-work-hours ?s)
      (slot-free ?s)
      (not (busy-billy ?s))
      (not (busy-patricia ?s))
      (available-brian ?s)
      (not (late ?s))
      (not (meeting-booked))
    )
    :effect (and
      (meeting-booked)
      (meeting-at ?s)
      (attends-brian ?s)
      (attends-billy ?s)
      (attends-patricia ?s)
      (not (slot-free ?s))
    )
    :cost 0
  )

  (:action schedule-by-billy-late
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (within-work-hours ?s)
      (slot-free ?s)
      (not (busy-billy ?s))
      (not (busy-patricia ?s))
      (available-brian ?s)
      (late ?s)
      (not (meeting-booked))
    )
    :effect (and
      (meeting-booked)
      (meeting-at ?s)
      (attends-brian ?s)
      (attends-billy ?s)
      (attends-patricia ?s)
      (not (slot-free ?s))
    )
    :cost 1
  )

  ;; Patricia scheduling actions
  (:action schedule-by-patricia-normal
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (within-work-hours ?s)
      (slot-free ?s)
      (not (busy-patricia ?s))
      (not (busy-billy ?s))
      (available-brian ?s)
      (not (late ?s))
      (not (meeting-booked))
    )
    :effect (and
      (meeting-booked)
      (meeting-at ?s)
      (attends-brian ?s)
      (attends-billy ?s)
      (attends-patricia ?s)
      (not (slot-free ?s))
    )
    :cost 0
  )

  (:action schedule-by-patricia-late
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (within-work-hours ?s)
      (slot-free ?s)
      (not (busy-patricia ?s))
      (not (busy-billy ?s))
      (available-brian ?s)
      (late ?s)
      (not (meeting-booked))
    )
    :effect (and
      (meeting-booked)
      (meeting-at ?s)
      (attends-brian ?s)
      (attends-billy ?s)
      (attends-patricia ?s)
      (not (slot-free ?s))
    )
    :cost 1
  )
)