(define (domain san_francisco_meet_john)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next ?t1 - time ?t2 - time)
    (travel_edge ?from - location ?depart - time ?to - location ?arrive - time)
    (john_available ?t - time)
    (meeting_john)
    (met_stage_0)
    (met_stage_15)
    (met_stage_30)
    (met_john)
  )

  (:action wait
    :parameters (?from - time ?to - time)
    :precondition (and
      (current_time ?from)
      (next ?from ?to)
      (not (meeting_john))
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  (:action travel
    :parameters (?from_loc - location ?depart - time ?to_loc - location ?arrive - time)
    :precondition (and
      (at ?from_loc)
      (current_time ?depart)
      (travel_edge ?from_loc ?depart ?to_loc ?arrive)
      (not (meeting_john))
    )
    :effect (and
      (not (at ?from_loc))
      (at ?to_loc)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action start_meeting_john
    :parameters (?t - time)
    :precondition (and
      (at pacific_heights)
      (current_time ?t)
      (john_available ?t)
      (not (meeting_john))
      (not (met_stage_0))
      (not (met_stage_15))
      (not (met_stage_30))
      (not (met_john))
    )
    :effect (and
      (meeting_john)
      (met_stage_0)
    )
  )

  (:action continue_meeting_0_to_15
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (meeting_john)
      (met_stage_0)
      (current_time ?t1)
      (next ?t1 ?t2)
      (john_available ?t1)
      (john_available ?t2)
      (at pacific_heights)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (met_stage_0))
      (met_stage_15)
    )
  )

  (:action continue_meeting_15_to_30
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (meeting_john)
      (met_stage_15)
      (current_time ?t1)
      (next ?t1 ?t2)
      (john_available ?t1)
      (john_available ?t2)
      (at pacific_heights)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (met_stage_15))
      (met_stage_30)
    )
  )

  (:action continue_meeting_30_to_45
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (meeting_john)
      (met_stage_30)
      (current_time ?t1)
      (next ?t1 ?t2)
      (john_available ?t1)
      (john_available ?t2)
      (at pacific_heights)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (met_stage_30))
      (not (meeting_john))
      (met_john)
    )
  )
)