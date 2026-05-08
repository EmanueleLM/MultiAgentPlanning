(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types timeslot)
  (:predicates
    (at_time ?t - timeslot)
    (next ?t1 ?t2 - timeslot)
    (slot_available ?t - timeslot)
    (slot_busy ?t - timeslot)
    (meeting_held)
    (meeting_at ?t - timeslot)
  )

  (:action skip_busy_slot
    :parameters (?t_curr - timeslot ?t_next - timeslot)
    :precondition (and 
      (at_time ?t_curr) 
      (next ?t_curr ?t_next) 
      (slot_busy ?t_curr)
    )
    :effect (and 
      (not (at_time ?t_curr)) 
      (at_time ?t_next)
    )
  )

  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and 
      (at_time ?t) 
      (slot_available ?t)
    )
    :effect (and 
      (meeting_held) 
      (meeting_at ?t)
    )
  )
)