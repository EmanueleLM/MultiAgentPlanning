(define (domain jack_of_all_trades_schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)
  (:constants arthur theresa carl - person)

  (:predicates
    ;; person has an existing busy event at start time ?t (given calendar blocks)
    (busy_at ?p - person ?t - timeslot)
    ;; a meeting has been scheduled starting at ?t
    (meeting_at ?t - timeslot)
    ;; person ?p attends the meeting starting at ?t
    (in_meeting ?p - person ?t - timeslot)
  )

  ;; Schedule a single meeting (30-minute slot) at timeslot ?t for the three participants.
  ;; Preconditions enforce that the timeslot is not already used for a meeting and that
  ;; none of the participants are busy at that timeslot.
  (:action schedule_meeting_at
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting_at ?t))
      (not (busy_at arthur ?t))
      (not (busy_at theresa ?t))
      (not (busy_at carl ?t))
    )
    :effect (and
      (meeting_at ?t)
      (in_meeting arthur ?t)
      (in_meeting theresa ?t)
      (in_meeting carl ?t)
    )
  )
)