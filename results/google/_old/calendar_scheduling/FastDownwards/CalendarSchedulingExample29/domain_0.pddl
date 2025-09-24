(define (domain combined-meeting-scheduling)
  (:requirements :typing :negative-preconditions :strips)
  (:types person timeslot)

  (:predicates
    ;; temporal relation
    (next ?t1 - timeslot ?t2 - timeslot)

    ;; availability representations used by different agents
    (available ?p - person ?t - timeslot)
    (free ?p - person ?t - timeslot)

    ;; meeting/status predicates
    (meeting-scheduled)
    (meeting-start ?t - timeslot)
    (attends ?p - person)
  )

  ;; Agent 1's scheduling action (keeps original semantics: uses free/attends)
  (:action schedule-meeting-agent1
    :parameters (?s - timeslot ?n - timeslot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (next ?s ?n)
      (free ?p1 ?s) (free ?p1 ?n)
      (free ?p2 ?s) (free ?p2 ?n)
      (free ?p3 ?s) (free ?p3 ?n)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start ?s)
      (attends ?p1) (attends ?p2) (attends ?p3)
      (not (free ?p1 ?s)) (not (free ?p1 ?n))
      (not (free ?p2 ?s)) (not (free ?p2 ?n))
      (not (free ?p3 ?s)) (not (free ?p3 ?n))
    )
  )

  ;; Agent 2's scheduling action (uses available predicate; marks unavailable after scheduling)
  (:action schedule-meeting-agent2
    :parameters (?p1 - person ?p2 - person ?p3 - person ?s - timeslot ?s2 - timeslot)
    :precondition (and
      (next ?s ?s2)
      (available ?p1 ?s) (available ?p1 ?s2)
      (available ?p2 ?s) (available ?p2 ?s2)
      (available ?p3 ?s) (available ?p3 ?s2)
    )
    :effect (and
      (meeting-scheduled)
      (not (available ?p1 ?s)) (not (available ?p1 ?s2))
      (not (available ?p2 ?s)) (not (available ?p2 ?s2))
      (not (available ?p3 ?s)) (not (available ?p3 ?s2))
    )
  )

  ;; Agent 3's scheduling action (uses available; also sets meeting-start)
  (:action schedule-meeting-agent3
    :parameters (?s - timeslot ?s2 - timeslot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (next ?s ?s2)
      (available ?p1 ?s) (available ?p1 ?s2)
      (available ?p2 ?s) (available ?p2 ?s2)
      (available ?p3 ?s) (available ?p3 ?s2)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start ?s)
    )
  )
)