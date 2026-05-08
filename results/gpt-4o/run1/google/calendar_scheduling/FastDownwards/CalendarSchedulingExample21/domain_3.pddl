(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time_slot)
  (:predicates
    (free ?p - person ?t - time_slot)
    (meeting_scheduled ?t_start - time_slot ?t_end - time_slot)
    (next_slot ?t1 - time_slot ?t2 - time_slot)
  )
  (:action schedule_meeting
    :parameters (?t_start - time_slot ?t_end - time_slot)
    :precondition
      (and
        (next_slot ?t_start ?t_end)
        (free bobby ?t_start)
        (free bobby ?t_end)
        (free scott ?t_start)
        (free scott ?t_end)
        (free kimberly ?t_start)
        (free kimberly ?t_end)
        (not (meeting_scheduled ?t_start ?t_end))
      )
    :effect
      (meeting_scheduled ?t_start ?t_end)
  )
)