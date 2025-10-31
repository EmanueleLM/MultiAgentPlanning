(define (domain integrated-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :disjunctive-goals)
  (:types slot)

  ;; Predicates representing each agent's view (kept distinct)
  (:predicates
    (within-work-hours ?s - slot)

    ;; Agent 1 predicates (from first agent)
    (free_a1 ?s - slot)
    (scheduled_a1 ?s - slot)

    ;; Agent 2 predicates (from second agent)
    (free_a2 ?s - slot)
    (scheduled_a2 ?s - slot)

    ;; Agent 3 predicates (from third agent)
    (free_a3 ?s - slot)
    (scheduled_a3 ?s - slot)

    ;; Global confirmation that the meeting is scheduled at a given slot
    (meeting_scheduled ?s - slot)
  )

  ;; Actions kept distinct according to each agent's model (names reflect original agents)
  (:action schedule-meeting
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

  (:action schedule-at
    :parameters (?s - slot)
    :precondition (and
                    (free_a2 ?s)
                    (not (scheduled_a2 ?s))
                  )
    :effect (and
              (scheduled_a2 ?s)
              (not (free_a2 ?s))
            )
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and
                    (free_a3 ?s)
                    (not (scheduled_a3 ?s))
                  )
    :effect (and
              (scheduled_a3 ?s)
              (not (free_a3 ?s))
            )
  )

  ;; Finalize/confirm action that makes the meeting globally scheduled when all agents
  ;; have scheduled the same slot in their own calendars.
  (:action confirm-meeting
    :parameters (?s - slot)
    :precondition (and
                    (scheduled_a1 ?s)
                    (scheduled_a2 ?s)
                    (scheduled_a3 ?s)
                    (not (meeting_scheduled ?s))
                  )
    :effect (meeting_scheduled ?s)
  )
)