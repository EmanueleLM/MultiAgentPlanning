(define (domain calendar_scheduling_domain)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants
    scott gabriel christine - person
  )
  (:predicates
    (is_free ?p - person ?s - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?s - timeslot)
    :precondition (and
      (is_free scott ?s)
      (is_free gabriel ?s)
      (is_free christine ?s)
    )
    :effect (meeting_scheduled)
  )
)