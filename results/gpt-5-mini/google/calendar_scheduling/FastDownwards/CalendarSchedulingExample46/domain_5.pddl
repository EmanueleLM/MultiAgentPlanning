(define (domain calendar_scheduling_example46)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)

  ;; instance-specific persons declared as domain constants for clarity
  (:constants arthur theresa carl - person)

  (:predicates
    ;; person has an existing or scheduled busy event starting at timeslot ?t
    (busy_at ?p - person ?t - timeslot)
    ;; a meeting (the meeting we must schedule) starts at timeslot ?t
    (meeting_at ?t - timeslot)
    ;; person ?p attends the meeting that starts at ?t
    (in_meeting ?p - person ?t - timeslot)
  )

  ;; Schedule the required 30-minute meeting for the three specified participants
  ;; at timeslot ?t. Preconditions enforce:
  ;;  - no meeting already scheduled at ?t
  ;;  - none of the participants are busy at ?t
  ;; Effects:
  ;;  - record that a meeting is scheduled at ?t
  ;;  - mark each participant as attending and busy at ?t (prevents other meetings being scheduled there)
  (:action schedule_meeting_at
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting_at ?t))
      (not (busy_at arthur ?t))
      (not (busy_at theresa ?t))
      (not (busy_at carl ?t))
      (not (in_meeting arthur ?t))
      (not (in_meeting theresa ?t))
      (not (in_meeting carl ?t))
    )
    :effect (and
      (meeting_at ?t)
      (in_meeting arthur ?t)
      (in_meeting theresa ?t)
      (in_meeting carl ?t)
      (busy_at arthur ?t)
      (busy_at theresa ?t)
      (busy_at carl ?t)
    )
  )
)