(define (domain jack_of_all_trades_schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)
  (:constants arthur theresa carl - person)
  (:predicates
    (free_at ?p - person ?t - timeslot)
    (meeting_at ?t - timeslot)
  )

  (:action schedule_meeting_at
    :parameters (?t - timeslot)
    :precondition (and
                    (free_at arthur ?t)
                    (free_at theresa ?t)
                    (free_at carl ?t)
                    (not (meeting_at ?t))
                  )
    :effect (and
              (meeting_at ?t)
              (not (free_at arthur ?t))
              (not (free_at theresa ?t))
              (not (free_at carl ?t))
            )
  )
)