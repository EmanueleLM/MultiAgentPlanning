(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants
    raymond billy donald - person
  )
  (:predicates
    (available ?p - person ?ts - timeslot)
    (scheduled)
  )

  ;; Action to schedule a single 30-minute meeting at a specific timeslot.
  ;; The meeting is successful if all three required participants are available.
  (:action schedule_meeting
    :parameters (?ts - timeslot)
    :precondition (and 
      (available raymond ?ts)
      (available billy ?ts)
      (available donald ?ts)
    )
    :effect (scheduled)
  )
)