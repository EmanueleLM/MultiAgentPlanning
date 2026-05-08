(define (domain san_francisco_day_meeting_john)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:constants
    john - person
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (travel_edge ?from - location ?to - location ?depart - time ?arrive - time)
    (wait_edge ?from_t - time ?to_t - time)
    (person_at ?p - person ?l - location)
    (available_start ?p - person ?t - time)
    (meeting ?p - person)
    (started_at ?p - person ?t - time)
    (progress_0 ?p - person)
    (progress_1 ?p - person)
    (progress_2 ?p - person)
    (progress_3 ?p - person)
    (progress_4 ?p - person)
    (met_minimum ?p - person)
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (wait_edge ?t1 ?t2)
      (not (meeting john))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (travel_edge ?from ?to ?depart ?arrive)
      (not (meeting john))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action start_meeting
    :parameters (?p - person ?l - location ?t - time)
    :precondition (and
      (current_time ?t)
      (at ?l)
      (person_at ?p ?l)
      (available_start ?p ?t)
      (progress_0 ?p)
      (not (meeting ?p))
    )
    :effect (and
      (meeting ?p)
      (started_at ?p ?t)
      (not (progress_0 ?p))
      (progress_1 ?p)
    )
  )

  (:action advance_meeting_1
    :parameters (?p - person)
    :precondition (and
      (meeting ?p)
      (progress_1 ?p)
    )
    :effect (and
      (not (progress_1 ?p))
      (progress_2 ?p)
    )
  )

  (:action advance_meeting_2
    :parameters (?p - person)
    :precondition (and
      (meeting ?p)
      (progress_2 ?p)
    )
    :effect (and
      (not (progress_2 ?p))
      (progress_3 ?p)
    )
  )

  (:action advance_meeting_3
    :parameters (?p - person)
    :precondition (and
      (meeting ?p)
      (progress_3 ?p)
    )
    :effect (and
      (not (progress_3 ?p))
      (progress_4 ?p)
    )
  )

  (:action finish_meeting
    :parameters (?p - person ?t - time)
    :precondition (and
      (meeting ?p)
      (progress_4 ?p)
      (started_at ?p ?t)
      (available_start ?p ?t)
    )
    :effect (and
      (not (meeting ?p))
      (not (progress_4 ?p))
      (met_minimum ?p)
    )
  )
)