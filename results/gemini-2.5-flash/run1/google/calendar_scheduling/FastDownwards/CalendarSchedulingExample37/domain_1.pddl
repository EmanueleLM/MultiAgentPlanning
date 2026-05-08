(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions :existential-preconditions)
  (:types
    person
    time_slot
  )
  (:predicates
    (at_time_slot ?s - time_slot)
    (is_free ?p - person ?s - time_slot)
    (next_slot ?s1 - time_slot ?s2 - time_slot)
    (meeting_scheduled ?s - time_slot)
  )

  (:action schedule_meeting
    :parameters (?s - time_slot)
    :precondition (and
      (at_time_slot ?s)
      (is_free gregory ?s)
      (is_free teresa ?s)
      (is_free carol ?s)
    )
    :effect (and
      (meeting_scheduled ?s)
    )
  )

  (:action advance_time
    :parameters (?current_s - time_slot ?next_s - time_slot)
    :precondition (and
      (at_time_slot ?current_s)
      (next_slot ?current_s ?next_s)
      (not (exists (?s_any - time_slot) (meeting_scheduled ?s_any)))
    )
    :effect (and
      (not (at_time_slot ?current_s))
      (at_time_slot ?next_s)
    )
  )
)