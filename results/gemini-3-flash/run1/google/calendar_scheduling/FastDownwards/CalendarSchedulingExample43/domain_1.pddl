(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types
    slot person
  )
  (:predicates
    (at_slot ?s - slot)
    (next ?s1 ?s2 - slot)
    (free ?p - person ?s - slot)
    (is_albert ?p - person)
    (is_gregory ?p - person)
    (is_benjamin ?p - person)
    (meeting_scheduled)
  )

  ;; Move the time cursor to the next 30-minute slot
  (:action advance_time
    :parameters (?s1 ?s2 - slot)
    :precondition (and
      (at_slot ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (at_slot ?s1))
      (at_slot ?s2)
    )
  )

  ;; Schedule the meeting at the current slot if everyone is free
  (:action schedule_meeting
    :parameters (?s - slot ?a ?g ?b - person)
    :precondition (and
      (at_slot ?s)
      (is_albert ?a)
      (is_gregory ?g)
      (is_benjamin ?b)
      (free ?a ?s)
      (free ?g ?s)
      (free ?b ?s)
    )
    :effect (meeting_scheduled)
  )
)