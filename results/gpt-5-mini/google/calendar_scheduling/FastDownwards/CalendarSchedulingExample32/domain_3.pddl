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

  ;; Schedule a specific meeting at a single timeslot.
  ;; Preconditions enforce the slot is within workhours and all participants are free.
  ;; The action is usable only once for a given meeting (checked by (not (scheduled ?m))).
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