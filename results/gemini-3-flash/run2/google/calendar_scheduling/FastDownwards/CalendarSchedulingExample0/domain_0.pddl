(define (domain meeting_scheduler)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants michelle steven jerry - person)
  (:predicates
    (next ?s1 ?s2 - slot)
    (available ?p - person ?s - slot)
    (meeting_scheduled)
  )

  ;; The schedule_meeting action looks for a 1-hour block (two consecutive slots).
  ;; It checks that all three participants are available for both 30-minute intervals.
  (:action schedule_meeting
    :parameters (?s1 ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (available michelle ?s1)
      (available michelle ?s2)
      (available steven ?s1)
      (available steven ?s2)
      (available jerry ?s1)
      (available jerry ?s2)
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)