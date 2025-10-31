(define (domain combined-schedule)
  (:requirements :typing :negative-preconditions :preferences)
  (:types slot person)

  (:predicates
    ;; slot and hour predicates
    (slot ?s - slot)
    (within-work-hours ?s - slot)
    (slot-free ?s - slot)
    (late ?s - slot)                       ; for a soft preference (after 15:30)

    ;; per-agent availability / busy facts (keeps agent information distinct)
    (available-brian ?s - slot)
    (busy-billy ?s - slot)
    (busy-patricia ?s - slot)

    ;; meeting state and attendance recorded per participant
    (meeting-booked)
    (meeting-at ?s - slot)
    (attends-brian ?s - slot)
    (attends-billy ?s - slot)
    (attends-patricia ?s - slot)
  )

  ;; Three distinct scheduling actions (one per participant) to keep agent actions separate.
  ;; Each action encodes the agent's role in scheduling but all require the meeting slot to be free
  ;; and that no participant is busy at that slot. Effects are identical: book the meeting.
  (:action schedule-by-brian
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (within-work-hours ?s)
      (slot-free ?s)
      (available-brian ?s)            ; Brian's asserted availability (his knowledge)
      (not (busy-billy ?s))          ; respect Billy's known busy times
      (not (busy-patricia ?s))       ; respect Patricia's known busy times
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
  )

  (:action schedule-by-billy
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (within-work-hours ?s)
      (slot-free ?s)
      (not (busy-billy ?s))          ; Billy's asserted hard constraint
      (not (busy-patricia ?s))       ; Patricia's asserted constraints must be respected
      (available-brian ?s)           ; require Brian's availability
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
  )

  (:action schedule-by-patricia
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (within-work-hours ?s)
      (slot-free ?s)
      (not (busy-patricia ?s))       ; Patricia's asserted busy times
      (not (busy-billy ?s))          ; Billy's asserted busy times must be respected
      (available-brian ?s)           ; Brian's availability (known)
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
  )
)