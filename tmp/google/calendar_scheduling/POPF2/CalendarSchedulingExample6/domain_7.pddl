(define (domain unified-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types time person)

  (:predicates
    (available ?p - person ?t - time)
    (free ?p - person ?t - time)
    (meeting-scheduled)
    (meeting-scheduled-at ?t - time)
    (participant ?p - person)
    (timeslot ?t - time)
  )

  ;; Action by Agent 1
  (:action schedule-meeting-agent1
    :parameters (?t - time)
    :precondition (and
      (available thomas ?t)
      (available dylan ?t)
      (available jerry ?t)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-scheduled-at ?t)
    )
  )

  ;; Action by Agent 2
  (:action schedule-agent2
    :parameters (?p1 - person ?p2 - person ?p3 - person ?t - time)
    :precondition (and
      (free ?p1 ?t)
      (free ?p2 ?t)
      (free ?p3 ?t)
    )
    :effect (meeting-scheduled-at ?t)
  )

  ;; Action by Agent 3
  (:action schedule-meeting-agent3
    :parameters (?t - time)
    :precondition (and
      (forall (?p - person) (available ?p ?t))
      (timeslot ?t)
    )
    :effect (meeting-scheduled-at ?t)
  )
)