(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot meeting)
  (:predicates
    (free ?p - participant ?s - slot)
    (consecutive ?s1 - slot ?s2 - slot)
    (scheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition (and
      (consecutive ?s1 ?s2)
      ;; All participants must be free in both slots
      (free stephen_agent ?s1) (free stephen_agent ?s2)
      (free edward_agent ?s1) (free edward_agent ?s2)
      (free angela_agent ?s1) (free angela_agent ?s2)
      (not (scheduled ?m))
    )
    :effect (and
      (scheduled ?m)
    )
  )
)