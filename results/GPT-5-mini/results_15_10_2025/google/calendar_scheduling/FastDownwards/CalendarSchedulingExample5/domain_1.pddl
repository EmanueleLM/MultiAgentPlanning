(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (allowed-charlotte ?s - slot)
    (meeting-scheduled)
    (meeting-start ?s - slot)
  )
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
                    (not (meeting-scheduled))
                    (free kathryn ?s)
                    (free charlotte ?s)
                    (free lauren ?s)
                    (allowed-charlotte ?s)
                  )
    :effect (and
              (meeting-scheduled)
              (meeting-start ?s)
            )
  )
)