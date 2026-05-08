(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant meeting timeslot)

  ;; explicit participants as domain constants (preserve identity across domain/problem)
  (:constants emily melissa frank - participant)

  (:predicates
    (in_workhours ?s - timeslot)
    (busy ?p - participant ?s - timeslot)
    (scheduled ?m - meeting)
    (scheduled_at ?m - meeting ?s - timeslot)
    (attends ?p - participant ?m - meeting)
  )

  ;; Schedule a meeting at a single half-hour timeslot.
  ;; Preconditions: timeslot in workhours, meeting not already scheduled,
  ;; and all three participants free at that timeslot.
  ;; Effects: mark meeting scheduled, record its timeslot, mark each participant attending,
  ;; and mark each participant busy at that timeslot (resource exclusivity).
  (:action schedule_meeting_at
    :parameters (?m - meeting ?s - timeslot)
    :precondition (and
      (in_workhours ?s)
      (not (scheduled ?m))
      (not (busy emily ?s))
      (not (busy melissa ?s))
      (not (busy frank ?s))
    )
    :effect (and
      (scheduled ?m)
      (scheduled_at ?m ?s)
      (attends emily ?m)
      (attends melissa ?m)
      (attends frank ?m)
      (busy emily ?s)
      (busy melissa ?s)
      (busy frank ?s)
    )
  )
)