(define (domain jack_of_all_trades_meeting)
  (:requirements :typing :negative-preconditions :strips)
  (:types person time)
  (:predicates
    (free ?p - person ?t - time)
    (next ?t1 - time ?t2 - time)
    (meeting_scheduled)
    (meeting_start ?t - time)
  )

  (:action schedule_meeting
    :parameters (?s - time ?e - time)
    :precondition (and
      (next ?s ?e)
      (free julie ?s)
      (free julie ?e)
      (free sean ?s)
      (free sean ?e)
      (free lori ?s)
      (free lori ?e)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_start ?s)
    )
  )
)