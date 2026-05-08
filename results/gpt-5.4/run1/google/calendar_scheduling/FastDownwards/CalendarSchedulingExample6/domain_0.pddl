(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (chosen_start ?s - slot)
    (chosen_end ?s - slot)
    (meeting_scheduled)
  )

  (:action choose_start
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (not (meeting_scheduled))
      (next_slot ?s1 ?s2)
      (not (chosen_start ?s1))
      (not (chosen_end ?s2))
    )
    :effect (and
      (chosen_start ?s1)
      (chosen_end ?s2)
    )
  )

  (:action schedule_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (not (meeting_scheduled))
      (chosen_start ?s1)
      (chosen_end ?s2)
      (next_slot ?s1 ?s2)
      (free thomas ?s1)
      (free thomas ?s2)
      (free dylan ?s1)
      (free dylan ?s2)
      (free jerry ?s1)
      (free jerry ?s2)
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)