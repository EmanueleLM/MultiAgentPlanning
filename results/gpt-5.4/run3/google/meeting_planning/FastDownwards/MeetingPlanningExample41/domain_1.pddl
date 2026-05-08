(define (domain san_francisco_meet_george)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person agent time progress
  )

  (:predicates
    (travel_18 ?from - location ?to - location)
    (travel_19 ?from - location ?to - location)
    (next_time ?t1 - time ?t2 - time)
    (plus_18 ?t1 - time ?t2 - time)
    (plus_19 ?t1 - time ?t2 - time)
    (george_available ?t - time)
    (progress_next ?p1 - progress ?p2 - progress)
    (at_location_person ?p - person ?l - location)
    (at_location_agent ?a - agent ?l - location)
    (current_time ?t - time)
    (meeting_progress ?p - progress)
    (met_george)
  )

  (:action wait_one_minute
    :parameters (?a - agent ?from_t - time ?to_t - time)
    :precondition (and
      (current_time ?from_t)
      (next_time ?from_t ?to_t)
    )
    :effect (and
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action travel_18_minutes
    :parameters (?a - agent ?from_l - location ?to_l - location ?from_t - time ?to_t - time)
    :precondition (and
      (at_location_agent ?a ?from_l)
      (current_time ?from_t)
      (travel_18 ?from_l ?to_l)
      (plus_18 ?from_t ?to_t)
    )
    :effect (and
      (not (at_location_agent ?a ?from_l))
      (at_location_agent ?a ?to_l)
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action travel_19_minutes
    :parameters (?a - agent ?from_l - location ?to_l - location ?from_t - time ?to_t - time)
    :precondition (and
      (at_location_agent ?a ?from_l)
      (current_time ?from_t)
      (travel_19 ?from_l ?to_l)
      (plus_19 ?from_t ?to_t)
    )
    :effect (and
      (not (at_location_agent ?a ?from_l))
      (at_location_agent ?a ?to_l)
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action meet_george_one_minute
    :parameters (?a - agent ?l - location ?person - person ?t1 - time ?t2 - time ?p1 - progress ?p2 - progress)
    :precondition (and
      (at_location_agent ?a ?l)
      (at_location_person ?person ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (george_available ?t1)
      (meeting_progress ?p1)
      (progress_next ?p1 ?p2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_progress ?p1))
      (meeting_progress ?p2)
    )
  )

  (:action finalize_met_george
    :parameters ()
    :precondition (and
      (meeting_progress m45)
      (not (met_george))
    )
    :effect (met_george)
  )
)