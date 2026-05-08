(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types time_slot participant)
  (:predicates
    (is_free ?ts - time_slot ?p - participant)
    (meeting_scheduled ?ts - time_slot)
    (kathleen_preference ?ts - time_slot)
  )
  (:action schedule_meeting
    :parameters (?ts - time_slot)
    :precondition (and 
      (is_free ?ts - time_slot participant_teresa)
      (is_free ?ts - time_slot participant_kathleen)
      (is_free ?ts - time_slot participant_patricia)
      (kathleen_preference ?ts)
      (not (meeting_scheduled ?ts))
    )
    :effect (and 
      (meeting_scheduled ?ts)
    )
  )
  (:action schedule_meeting_without_preference
    :parameters (?ts - time_slot)
    :precondition (and 
      (is_free ?ts - time_slot participant_teresa)
      (is_free ?ts - time_slot participant_kathleen)
      (is_free ?ts - time_slot participant_patricia)
      (not (kathleen_preference ?ts))
      (not (meeting_scheduled ?ts))
    )
    :effect (and 
      (meeting_scheduled ?ts)
    )
  )
)