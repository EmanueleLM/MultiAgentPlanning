(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants ryan ruth denise - person)
  (:predicates
    (person_free ?p - person ?s - slot)
    (next_slot ?s1 ?s2 - slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting_1hr
    :parameters (?s1 ?s2 - slot)
    :precondition (and
      (next_slot ?s1 ?s2)
      (person_free ryan ?s1)
      (person_free ryan ?s2)
      (person_free ruth ?s1)
      (person_free ruth ?s2)
      (person_free denise ?s1)
      (person_free denise ?s2)
    )
    :effect (meeting_scheduled)
  )
)