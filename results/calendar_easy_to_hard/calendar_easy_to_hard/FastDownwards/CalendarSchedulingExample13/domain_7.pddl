(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types person slot)
  (:predicates
    (free-slot ?p - person ?s - slot)
    (meeting-scheduled)
    (scheduled-slot ?s - slot)
    (meeting-with ?p - person)
  )
  (:action schedule-meeting
    :parameters (?s - slot ?p1 - person ?p2 - person ?p3 - person ?p4 - person)
    :precondition (and
      (free-slot ?p1 ?s) (free-slot ?p2 ?s) (free-slot ?p3 ?s) (free-slot ?p4 ?s)
      (not (meeting-scheduled))
      (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p1 ?p4))
      (not (= ?p2 ?p3)) (not (= ?p2 ?p4)) (not (= ?p3 ?p4))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-slot ?s)
      (meeting-with ?p1) (meeting-with ?p2) (meeting-with ?p3) (meeting-with ?p4)
    )
  )
)