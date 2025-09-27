(define (domain meeting-scheduling)
  (:requirements :typing)
  (:types person slot room)
  (:predicates
    (unscheduled)
    (scheduled ?s - slot)
    (available ?p - person ?s - slot)
    (room-free ?r - room)
    (room-occupied ?r - room ?s - slot)
  )

  ;; Schedule action uses a room and a chosen slot.
  ;; It requires that the meeting is currently unscheduled, the room is free,
  ;; and that every required attendee is available at the chosen slot.
  (:action schedule
    :parameters (?r - room ?s - slot)
    :precondition (and
      (unscheduled)
      (room-free ?r)
      ;; hard constraint: all attendees must be available at ?s
      (available jesse ?s)
      (available nancy ?s)
      (available isabella ?s)
      (available harold ?s)
      (available linda ?s)
    )
    :effect (and
      (not (unscheduled))
      (not (room-free ?r))
      (scheduled ?s)
      (room-occupied ?r ?s)
    )
  )
)