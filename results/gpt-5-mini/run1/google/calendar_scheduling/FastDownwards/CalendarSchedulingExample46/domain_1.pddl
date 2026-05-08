(define (domain jack_of_all_trades_schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)
  (:predicates
    (free_at ?p - person ?t - timeslot)
    (busy_at ?p - person ?t - timeslot)
    (meeting_at ?t - timeslot)
  )
  (:action schedule_meeting_at
    :parameters (?p1 - person ?p2 - person ?p3 - person ?t - timeslot)
    :precondition (and (free_at ?p1 ?t) (free_at ?p2 ?t) (free_at ?p3 ?t) (not (meeting_at ?t)))
    :effect (and
              (meeting_at ?t)
              (not (free_at ?p1 ?t)) (busy_at ?p1 ?t)
              (not (free_at ?p2 ?t)) (busy_at ?p2 ?t)
              (not (free_at ?p3 ?t)) (busy_at ?p3 ?t)
            )
  )
)