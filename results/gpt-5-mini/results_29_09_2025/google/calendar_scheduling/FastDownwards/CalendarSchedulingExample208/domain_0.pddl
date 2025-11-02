(define (domain meeting-domain)
  (:requirements :typing :negative-preconditions)
  (:types person timeslot)

  (:predicates
    (busy ?p - person ?t - timeslot)        ; person is unavailable at timeslot
    (meeting-scheduled)
    (scheduled-at ?t - timeslot)
  )

  ; Single scheduling action parameterized by a timeslot.
  ; Preconditions require that no required attendee is busy at ?t and that no meeting is already scheduled.
  (:action schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
      (not (busy jesse ?t))
      (not (busy nancy ?t))
      (not (busy isabella ?t))
      (not (busy harold ?t))
      (not (busy linda ?t))
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?t)
    )
  )
)