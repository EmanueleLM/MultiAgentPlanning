(define (domain jack_of_all_trades_meeting)
  (:requirements :typing :negative-preconditions :strips)
  (:types person time)
  (:constants
    julie sean lori - person
  )
  (:predicates
    (free ?p - person ?t - time)
    (next ?t1 - time ?t2 - time)
    (meeting_scheduled)
    (meeting_start ?t - time)
  )

  ;; Schedule a one-hour meeting that occupies two consecutive half-hour slots:
  ;; require that the second slot is the immediate successor of the first.
  (:action schedule_meeting
    :parameters (?s - time ?e - time)
    :precondition (and
      (next ?s ?e)
      (free julie ?s) (free julie ?e)
      (free sean ?s)  (free sean ?e)
      (free lori ?s)  (free lori ?e)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_start ?s)
      ;; consume the two half-hour slots for each participant
      (not (free julie ?s)) (not (free julie ?e))
      (not (free sean ?s))  (not (free sean ?e))
      (not (free lori ?s))  (not (free lori ?e))
    )
  )
)