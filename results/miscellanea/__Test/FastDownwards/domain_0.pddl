(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types agent slot)

  (:predicates
    (free ?a - agent ?s - slot)
    (unscheduled)
    (meeting-scheduled ?s - slot)
  )

  ;; Three distinct scheduling actions (one per agent) as required.
  (:action schedule-by-alice
    :parameters (?s - slot)
    :precondition (and (unscheduled) (free alice ?s) (free bob ?s) (free carol ?s))
    :effect (and (not (unscheduled)) (meeting-scheduled ?s))
  )

  (:action schedule-by-bob
    :parameters (?s - slot)
    :precondition (and (unscheduled) (free alice ?s) (free bob ?s) (free carol ?s))
    :effect (and (not (unscheduled)) (meeting-scheduled ?s))
  )

  (:action schedule-by-carol
    :parameters (?s - slot)
    :precondition (and (unscheduled) (free alice ?s) (free bob ?s) (free carol ?s))
    :effect (and (not (unscheduled)) (meeting-scheduled ?s))
  )
)