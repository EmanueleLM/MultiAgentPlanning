(define (domain san_francisco_meet_sarah)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
    meet_stage
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (connected ?from - location ?to - location)
    (plus30 ?t1 - time ?t2 - time)
    (plus26 ?t1 - time ?t2 - time)
    (sarah_available ?t - time)
    (meeting_sarah)
    (met_sarah)
    (meeting_stage ?m - meet_stage)
    (next_stage ?m1 - meet_stage ?m2 - meet_stage)
  )

  (:action wait_one_minute
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (not (meeting_sarah))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_sunset_to_union
    :parameters (?depart - time ?arrive - time)
    :precondition (and
      (at sunset_district)
      (current_time ?depart)
      (plus30 ?depart ?arrive)
      (connected sunset_district union_square)
      (not (meeting_sarah))
    )
    :effect (and
      (not (at sunset_district))
      (at union_square)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action travel_union_to_sunset
    :parameters (?depart - time ?arrive - time)
    :precondition (and
      (at union_square)
      (current_time ?depart)
      (plus26 ?depart ?arrive)
      (connected union_square sunset_district)
      (not (meeting_sarah))
    )
    :effect (and
      (not (at union_square))
      (at sunset_district)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action start_meeting_sarah
    :parameters ()
    :precondition (and
      (at union_square)
      (not (meeting_sarah))
      (not (met_sarah))
      (meeting_stage m0)
    )
    :effect (and
      (meeting_sarah)
    )
  )

  (:action continue_meeting_sarah
    :parameters (?t1 - time ?t2 - time ?m1 - meet_stage ?m2 - meet_stage)
    :precondition (and
      (meeting_sarah)
      (at union_square)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (sarah_available ?t1)
      (sarah_available ?t2)
      (meeting_stage ?m1)
      (next_stage ?m1 ?m2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage ?m1))
      (meeting_stage ?m2)
    )
  )

  (:action finish_meeting_sarah
    :parameters ()
    :precondition (and
      (meeting_sarah)
      (meeting_stage m15)
    )
    :effect (and
      (met_sarah)
      (not (meeting_sarah))
    )
  )
)