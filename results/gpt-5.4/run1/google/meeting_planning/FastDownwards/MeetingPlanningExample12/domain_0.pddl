(define (domain sf_barbara_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
    meeting_stage
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)

    (next_time ?t1 - time ?t2 - time)

    (travel_north_beach_to_alamo_square ?depart - time ?arrive - time)
    (travel_alamo_square_to_north_beach ?depart - time ?arrive - time)

    (barbara_available ?t - time)

    (meeting_checkpoint ?s - meeting_stage ?t - time)
    (meeting_stage_reached ?s - meeting_stage)
    (next_stage ?s1 - meeting_stage ?s2 - meeting_stage)

    (met_barbara)
  )

  (:action wait
    :parameters (?from - time ?to - time)
    :precondition (and
      (current_time ?from)
      (next_time ?from ?to)
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  (:action go_north_beach_to_alamo_square
    :parameters (?depart - time ?arrive - time)
    :precondition (and
      (at north_beach)
      (current_time ?depart)
      (travel_north_beach_to_alamo_square ?depart ?arrive)
    )
    :effect (and
      (not (at north_beach))
      (at alamo_square)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action go_alamo_square_to_north_beach
    :parameters (?depart - time ?arrive - time)
    :precondition (and
      (at alamo_square)
      (current_time ?depart)
      (travel_alamo_square_to_north_beach ?depart ?arrive)
    )
    :effect (and
      (not (at alamo_square))
      (at north_beach)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action advance_barbara_meeting
    :parameters (?s1 - meeting_stage ?s2 - meeting_stage ?t_now - time ?t_next - time)
    :precondition (and
      (meeting_stage_reached ?s1)
      (next_stage ?s1 ?s2)
      (meeting_checkpoint ?s1 ?t_now)
      (next_time ?t_now ?t_next)
      (current_time ?t_now)
      (at alamo_square)
      (barbara_available ?t_now)
    )
    :effect (and
      (not (meeting_stage_reached ?s1))
      (meeting_stage_reached ?s2)
      (not (current_time ?t_now))
      (current_time ?t_next)
    )
  )

  (:action finalize_barbara_meeting
    :parameters ()
    :precondition (and
      (meeting_stage_reached m6)
    )
    :effect (and
      (met_barbara)
    )
  )
)