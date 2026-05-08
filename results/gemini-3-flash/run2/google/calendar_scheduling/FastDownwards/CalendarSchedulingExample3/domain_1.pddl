(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)
    (next ?s1 ?s2 - slot)
    (meeting_scheduled)
  )

  ;; A meeting for one hour requires two consecutive 30-minute slots where all participants are free.
  (:action schedule_one_hour_meeting
    :parameters (?s1 ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (available arthur ?s1)
      (available arthur ?s2)
      (available michael ?s1)
      (available michael ?s2)
      (available samantha ?s1)
      (available samantha ?s2)
    )
    :effect (meeting_scheduled)
  )
)