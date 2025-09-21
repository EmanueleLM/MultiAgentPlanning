(define (domain integrated-meeting-scheduling)
  (:requirements :typing :strips :negative-preconditions :equality)
  (:types slot)

  (:predicates
    (within-work-hours ?s - slot)
    (free_a1 ?s - slot)
    (scheduled_a1 ?s - slot)
    (free_a2 ?s - slot)
    (scheduled_a2 ?s - slot)
    (free_a3 ?s - slot)
    (scheduled_a3 ?s - slot)
    (meeting_scheduled ?s - slot)
    (meeting_scheduled_any)
  )

  (:action schedule-meeting-a1
    :parameters (?s - slot)
    :precondition (and
                    (within-work-hours ?s)
                    (free_a1 ?s)
                    (not (scheduled_a1 ?s))
                  )
    :effect (and
              (scheduled_a1 ?s)
              (not (free_a1 ?s))
            )
  )

  (:action schedule-meeting-a2
    :parameters (?s - slot)
    :precondition (and
                    (within-work-hours ?s)
                    (free_a2 ?s)
                    (not (scheduled_a2 ?s))
                  )
    :effect (and
              (scheduled_a2 ?s)
              (not (free_a2 ?s))
            )
  )

  (:action schedule-meeting-a3
    :parameters (?s - slot)
    :precondition (and
                    (within-work-hours ?s)
                    (free_a3 ?s)
                    (not (scheduled_a3 ?s))
                  )
    :effect (and
              (scheduled_a3 ?s)
              (not (free_a3 ?s))
            )
  )

  (:action confirm-meeting
    :parameters (?s - slot)
    :precondition (and
                    (scheduled_a1 ?s)
                    (scheduled_a2 ?s)
                    (scheduled_a3 ?s)
                    (not (meeting_scheduled_any))
                  )
    :effect (and
              (meeting_scheduled ?s)
              (meeting_scheduled_any)
            )
  )
)