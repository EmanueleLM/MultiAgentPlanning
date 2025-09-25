(define (domain integrated-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time slot)

  (:predicates
    (free ?p - person ?t - time)
    (free-slot ?p - person ?s - slot)
    (available ?p - person ?t - time)
    (slot ?s - slot)
    (slot-time ?s - slot ?t - time)
    (participant ?p - person)
    (is-host ?p - person)
    (can-schedule)
    (meeting-scheduled)
    (scheduled-time ?t - time)
    (scheduled-slot ?s - slot)
    (meeting-at-time ?t - time)
    (meeting-at-slot ?s - slot)
    (meeting-with ?p - person)
    (meeting-with-2 ?s - slot ?p1 - person ?p2 - person)
    (feasible ?s - slot)
    (before13 ?t - time)
  )

  (:action schedule-before
    :parameters (?t - time ?g - person ?r - person ?b - person)
    :precondition (and
      (before13 ?t)
      (free ?g ?t) (free ?r ?t) (free ?b ?t)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-time ?t)
      (meeting-at-time ?t)
    )
  )

  (:action schedule-after
    :parameters (?t - time ?g - person ?r - person ?b - person)
    :precondition (and
      (not (before13 ?t))
      (free ?g ?t) (free ?r ?t) (free ?b ?t)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-time ?t)
      (meeting-at-time ?t)
    )
  )

  (:action schedule-meeting-2
    :parameters (?s - slot ?p1 - person ?p2 - person)
    :precondition (and
      (slot ?s)
      (participant ?p1) (participant ?p2)
      (free-slot ?p1 ?s)
      (feasible ?s)
      (not (scheduled-slot ?s))
    )
    :effect (and
      (scheduled-slot ?s)
      (meeting-at-slot ?s)
      (meeting-with-2 ?s ?p1 ?p2)
      (meeting-scheduled)
    )
  )

  (:action schedule-meeting-3
    :parameters (?host - person ?t - time ?p1 - person ?p2 - person)
    :precondition (and
      (can-schedule)
      (is-host ?host)
      (available ?host ?t)
      (participant ?p1) (participant ?p2)
    )
    :effect (and
      (not (can-schedule))
      (meeting-scheduled)
      (meeting-at-time ?t)
      (meeting-with ?host)
      (meeting-with ?p1)
      (meeting-with ?p2)
    )
  )

  (:action bridge-time-to-slot
    :parameters (?t - time ?s - slot ?p1 - person ?p2 - person)
    :precondition (and
      (scheduled-time ?t)
      (slot-time ?s ?t)
      (participant ?p1) (participant ?p2)
      (not (meeting-with ?p1))
    )
    :effect (and
      (meeting-with ?p1)
      (meeting-with ?p2)
      (meeting-with-2 ?s ?p1 ?p2)
      (scheduled-slot ?s)
      (meeting-at-slot ?s)
    )
  )
)