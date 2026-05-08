(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)
  (:constants raymond billy donald - person)
  (:predicates
    (available ?p - person ?s - timeslot)
    (meeting_found ?s - timeslot) ; Predicate to mark which timeslot was chosen for the meeting
    (task_completed) ; A nullary predicate to indicate that the overall scheduling task is complete
  )

  (:action schedule_meeting
    :parameters (?s - timeslot)
    :precondition (and
      (available raymond ?s)
      (available billy ?s)
      (available donald ?s)
    )
    :effect (and
      (meeting_found ?s) ; Record the specific timeslot chosen
      (task_completed)   ; Signal the successful completion of the scheduling task
    )
  )
)