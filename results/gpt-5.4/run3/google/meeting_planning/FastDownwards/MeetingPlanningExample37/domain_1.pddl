(define (domain san_francisco_meet_jeffrey)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:constants
    jeffrey - person
    t_1215 t_1345 - time
  )

  (:predicates
    (at ?l - location)
    (route ?from - location ?to - location)
    (travel_departure ?from - location ?to - location ?t_from - time)
    (travel_arrival ?from - location ?to - location ?t_to - time)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (person_at ?p - person ?l - location)
    (available_start ?p - person ?t - time)
    (meeting ?p - person)
    (min_duration_reached ?p - person)
    (can_end_meeting ?p - person ?t - time)
    (met ?p - person)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t_from - time ?t_to - time)
    :precondition (and
      (at ?from)
      (current_time ?t_from)
      (route ?from ?to)
      (travel_departure ?from ?to ?t_from)
      (travel_arrival ?from ?to ?t_to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t_from))
      (current_time ?t_to)
    )
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (not (meeting jeffrey))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action start_meeting
    :parameters (?p - person ?l - location ?t - time)
    :precondition (and
      (at ?l)
      (person_at ?p ?l)
      (current_time ?t)
      (available_start ?p ?t)
      (not (meeting ?p))
      (not (met ?p))
    )
    :effect (and
      (meeting ?p)
    )
  )

  (:action progress_meeting_to_min_duration
    :parameters (?p - person)
    :precondition (and
      (meeting ?p)
      (current_time t_1215)
    )
    :effect (and
      (not (current_time t_1215))
      (current_time t_1345)
      (min_duration_reached ?p)
    )
  )

  (:action end_meeting
    :parameters (?p - person ?t - time)
    :precondition (and
      (meeting ?p)
      (min_duration_reached ?p)
      (current_time ?t)
      (can_end_meeting ?p ?t)
    )
    :effect (and
      (not (meeting ?p))
      (met ?p)
    )
  )
)