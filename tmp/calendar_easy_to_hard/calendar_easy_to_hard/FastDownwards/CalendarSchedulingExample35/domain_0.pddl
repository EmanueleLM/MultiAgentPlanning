(define (domain meeting-scheduling)
  (:requirements :strips)
  (:predicates
    (slot ?s)
    (unscheduled)
    (meeting-scheduled)
    (meeting-at ?s)
    ;; Availability facts are kept distinct per participant
    (available-alice ?s)
    (available-bob ?s)
    (available-diane ?s)
  )

  ;; A single parameterized action to schedule the 30-minute meeting at a specific slot.
  ;; Preconditions require the slot to exist, the meeting not yet scheduled, and each participant
  ;; to be available at that slot. Effects mark the meeting as scheduled at that slot.
  (:action schedule
    :parameters (?s)
    :precondition (and (unscheduled) (slot ?s)
                       (available-alice ?s)
                       (available-bob ?s)
                       (available-diane ?s))
    :effect (and (not (unscheduled))
                 (meeting-scheduled)
                 (meeting-at ?s))
  )
)