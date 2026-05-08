(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant meeting timeslot)

  (:predicates
    (in_workhours ?s - timeslot)
    (busy ?p - participant ?s - timeslot)
    (scheduled ?m - meeting)
    (scheduled_at ?m - meeting ?s - timeslot)
    (attends ?p - participant ?m - meeting)
  )

  (:action schedule_meeting_at
    :parameters (?s - timeslot)
    :precondition (and
      (in_workhours ?s)
      (not (busy emily ?s))
      (not (busy melissa ?s))
      (not (busy frank ?s))
      (not (scheduled meeting1))
    )
    :effect (and
      (scheduled meeting1)
      (scheduled_at meeting1 ?s)
      (attends emily meeting1)
      (attends melissa meeting1)
      (attends frank meeting1)
    )
  )
)