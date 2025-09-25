(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :existential-preconditions)
  (:types agent timeslot)

  (:predicates
    (workhour ?t - timeslot)                ; time slot is within work hours
    (available ?a - agent ?t - timeslot)    ; agent a is available at time t
    (meeting-time ?t - timeslot)            ; meeting has been proposed at time t
    (meeting-scheduled)                     ; flag: a meeting time has been chosen
    (agent-scheduled ?a - agent ?t - timeslot) ; agent a has committed to t
  )

  ;; Each agent has distinct actions. A single propose action chooses the meeting time (only if no time already chosen).
  ;; Other agents "confirm" that same meeting-time. Preconditions enforce availability and work-hours.
  (:action propose-raymond
    :parameters (?t - timeslot)
    :precondition (and (workhour ?t) (available raymond ?t) (not (meeting-scheduled)))
    :effect (and (meeting-time ?t) (meeting-scheduled) (agent-scheduled raymond ?t))
  )

  (:action confirm-raymond
    :parameters (?t - timeslot)
    :precondition (and (workhour ?t) (available raymond ?t) (meeting-time ?t))
    :effect (agent-scheduled raymond ?t)
  )

  (:action propose-billy
    :parameters (?t - timeslot)
    :precondition (and (workhour ?t) (available billy ?t) (not (meeting-scheduled)))
    :effect (and (meeting-time ?t) (meeting-scheduled) (agent-scheduled billy ?t))
  )

  (:action confirm-billy
    :parameters (?t - timeslot)
    :precondition (and (workhour ?t) (available billy ?t) (meeting-time ?t))
    :effect (agent-scheduled billy ?t)
  )

  (:action propose-donald
    :parameters (?t - timeslot)
    :precondition (and (workhour ?t) (available donald ?t) (not (meeting-scheduled)))
    :effect (and (meeting-time ?t) (meeting-scheduled) (agent-scheduled donald ?t))
  )

  (:action confirm-donald
    :parameters (?t - timeslot)
    :precondition (and (workhour ?t) (available donald ?t) (meeting-time ?t))
    :effect (agent-scheduled donald ?t)
  )
)