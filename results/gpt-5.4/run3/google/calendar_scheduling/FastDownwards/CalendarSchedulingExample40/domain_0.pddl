(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
    meeting
  )

  (:predicates
    (next_slot ?a - timeslot ?b - timeslot)
    (free ?p - participant ?t - timeslot)
    (chosen_start ?m - meeting ?t - timeslot)
    (chosen_second ?m - meeting ?t - timeslot)
    (unscheduled ?m - meeting)
    (duration_one ?m - meeting)
    (duration_two ?m - meeting)
  )

  (:action choose_start
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (unscheduled ?m)
      (free jacob ?t)
      (free gabriel ?t)
      (free matthew ?t)
    )
    :effect (and
      (chosen_start ?m ?t)
      (duration_one ?m)
      (not (unscheduled ?m))
    )
  )

  (:action extend_to_one_hour
    :parameters (?m - meeting ?t1 - timeslot ?t2 - timeslot)
    :precondition (and
      (duration_one ?m)
      (chosen_start ?m ?t1)
      (next_slot ?t1 ?t2)
      (free jacob ?t2)
      (free gabriel ?t2)
      (free matthew ?t2)
      (not (chosen_second ?m ?t2))
    )
    :effect (and
      (chosen_second ?m ?t2)
      (duration_two ?m)
      (not (duration_one ?m))
    )
  )
)