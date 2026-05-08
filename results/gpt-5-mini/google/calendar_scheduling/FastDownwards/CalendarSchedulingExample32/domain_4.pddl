(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant meeting timeslot)

  (:constants emily melissa frank - participant)

  (:predicates
    (in_workhours ?s - timeslot)
    (busy ?p - participant ?s - timeslot)
    (scheduled ?m - meeting)
    (scheduled_at ?m - meeting ?s - timeslot)
    (attends ?p - participant ?m - meeting)
  )

  (:action schedule_meeting_at
    :parameters (?m - meeting ?s - timeslot)
    :precondition (and
      (in_workhours ?s)
      (not (busy emily ?s))
      (not (busy melissa ?s))
      (not (busy frank ?s))
      (not (scheduled ?m))
    )
    :effect (and
      (scheduled ?m)
      (scheduled_at ?m ?s)
      (attends emily ?m)
      (attends melissa ?m)
      (attends frank ?m)
    )
  )
)