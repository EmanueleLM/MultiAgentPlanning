(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
  )

  (:predicates
    (free ?p - participant ?t - timeslot)
    (next_slot ?t1 - timeslot ?t2 - timeslot)
    (selected_start ?t - timeslot)
    (start_chosen)
    (scheduled)
  )

  (:action choose_start
    :parameters (?t - timeslot)
    :precondition (and
      (not (start_chosen))
      (free julie ?t)
      (free sean ?t)
      (free lori ?t)
    )
    :effect (and
      (selected_start ?t)
      (start_chosen)
    )
  )

  (:action extend_to_one_hour
    :parameters (?t1 - timeslot ?t2 - timeslot)
    :precondition (and
      (selected_start ?t1)
      (next_slot ?t1 ?t2)
      (free julie ?t2)
      (free sean ?t2)
      (free lori ?t2)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
    )
  )
)