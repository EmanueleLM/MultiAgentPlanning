(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (person ?p - person)
    (slot ?s - slot)
    (available ?p - person ?s - slot)   ; person ?p is available during slot ?s
    (meeting-scheduled)                  ; a meeting (for the required participants) has been scheduled
    (scheduled-at ?s - slot)             ; meeting is scheduled at slot ?s
  )

  ;; Schedule a 30-minute meeting with the three required participants
  ;; This action is the only way to achieve (meeting-scheduled).
  (:action schedule-meeting-diane-kelly-deborah
    :parameters (?s - slot)
    :precondition (and
      (available diane ?s)
      (available kelly ?s)
      (available deborah ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )
)