(define (domain meeting-scheduling-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)      ; person ?p is available at time slot ?s
    (meeting-scheduled)                    ; meeting has been scheduled
    (scheduled-at ?s - slot)               ; meeting is scheduled at slot ?s
    (preferred ?p - person ?s - slot)      ; optional: person ?p prefers slot ?s
  )

  ; Three distinct scheduling actions (one per agent). Any agent can perform the scheduling,
  ; but each action requires all participants to be available at the chosen slot.
  (:action heather-schedule
    :parameters (?s - slot)
    :precondition (and (not (meeting-scheduled))
                       (available heather ?s)
                       (available nicholas ?s)
                       (available zachary ?s))
    :effect (and (meeting-scheduled)
                 (scheduled-at ?s))
  )

  (:action nicholas-schedule
    :parameters (?s - slot)
    :precondition (and (not (meeting-scheduled))
                       (available heather ?s)
                       (available nicholas ?s)
                       (available zachary ?s))
    :effect (and (meeting-scheduled)
                 (scheduled-at ?s))
  )

  (:action zachary-schedule
    :parameters (?s - slot)
    :precondition (and (not (meeting-scheduled))
                       (available heather ?s)
                       (available nicholas ?s)
                       (available zachary ?s))
    :effect (and (meeting-scheduled)
                 (scheduled-at ?s))
  )
)