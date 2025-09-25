(define (domain integrated-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot day)
  (:predicates
    (work-slot ?s - slot)
    (free ?p - person ?s - slot)
    (busy ?p - person ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
    (attending ?p - person ?d - day ?s - slot)
  )

  (:action schedule-meeting-agent1
    :parameters (?d - day ?s - slot ?a - person ?j - person ?m - person)
    :precondition (and (work-slot ?s) (free ?a ?s))
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (attending ?a ?d ?s)
      (attending ?j ?d ?s)
      (attending ?m ?d ?s)
      (not (free ?a ?s))
    )
  )

  (:action schedule-meeting-agent2
    :parameters (?s - slot ?a - person ?j - person ?m - person)
    :precondition (and
      (not (busy ?a ?s))
      (not (busy ?j ?s))
      (not (busy ?m ?s))
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (busy ?a ?s)
      (busy ?j ?s)
      (busy ?m ?s)
    )
  )

  (:action schedule-meeting-agent3
    :parameters (?d - day ?s - slot ?a - person ?j - person ?m - person)
    :precondition (and
      (not (meeting-scheduled))
      (free ?a ?s)
      (free ?j ?s)
      (free ?m ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (not (free ?a ?s))
      (not (free ?j ?s))
      (not (free ?m ?s))
    )
  )
)