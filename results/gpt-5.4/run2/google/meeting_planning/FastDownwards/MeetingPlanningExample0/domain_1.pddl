(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:predicates
    (at_time ?t - timepoint)
    (next ?from ?to - timepoint)
    (at ?l - location)
    (travel_edge ?from_loc - location ?to_loc - location ?from_t - timepoint ?to_t - timepoint)
    (available ?p - person ?from_t - timepoint ?to_t - timepoint)
    (met_segment_1)
    (met_segment_2)
    (is_mission_district ?l - location)
    (is_stephanie ?p - person)
    (is_t4 ?t - timepoint)
    (is_t5 ?t - timepoint)
    (is_t6 ?t - timepoint)
  )

  (:action advance_idle
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and
      (at_time ?from)
      (next ?from ?to)
    )
    :effect (and
      (not (at_time ?from))
      (at_time ?to)
    )
  )

  (:action travel
    :parameters (?from_loc - location ?to_loc - location ?from_t - timepoint ?to_t - timepoint)
    :precondition (and
      (at ?from_loc)
      (at_time ?from_t)
      (travel_edge ?from_loc ?to_loc ?from_t ?to_t)
      (not (at ?to_loc))
    )
    :effect (and
      (not (at ?from_loc))
      (at ?to_loc)
      (not (at_time ?from_t))
      (at_time ?to_t)
    )
  )

  (:action meet_stephanie_segment_1
    :parameters (?l - location ?p - person ?from_t - timepoint ?to_t - timepoint)
    :precondition (and
      (at ?l)
      (is_mission_district ?l)
      (at_time ?from_t)
      (is_t4 ?from_t)
      (is_t5 ?to_t)
      (available ?p ?from_t ?to_t)
      (is_stephanie ?p)
      (not (met_segment_1))
    )
    :effect (and
      (not (at_time ?from_t))
      (at_time ?to_t)
      (met_segment_1)
    )
  )

  (:action meet_stephanie_segment_2
    :parameters (?l - location ?p - person ?from_t - timepoint ?to_t - timepoint)
    :precondition (and
      (at ?l)
      (is_mission_district ?l)
      (at_time ?from_t)
      (is_t5 ?from_t)
      (is_t6 ?to_t)
      (available ?p ?from_t ?to_t)
      (is_stephanie ?p)
      (met_segment_1)
      (not (met_segment_2))
    )
    :effect (and
      (not (at_time ?from_t))
      (at_time ?to_t)
      (met_segment_2)
    )
  )
)