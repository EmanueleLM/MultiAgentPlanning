(define (domain san_francisco_meeting_nancy)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (direct_travel ?from - location ?to - location)
    (travel_arrives ?depart - time ?arrive - time)
    (available ?p - person ?l - location ?t - time)
    (meeting_started ?p - person)
    (met_requirement ?p - person)
    (progress_0 ?p - person)
    (progress_1 ?p - person)
    (progress_2 ?p - person)
    (progress_3 ?p - person)
    (progress_4 ?p - person)
    (progress_5 ?p - person)
  )

  (:action wait_15
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (not (meeting_started nancy))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_15
    :parameters (?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (direct_travel ?from ?to)
      (travel_arrives ?depart ?arrive)
      (not (meeting_started nancy))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_step_0_1
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available ?p ?l ?t1)
      (progress_0 ?p)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (progress_0 ?p))
      (progress_1 ?p)
      (meeting_started ?p)
    )
  )

  (:action meet_step_1_2
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available ?p ?l ?t1)
      (meeting_started ?p)
      (progress_1 ?p)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (progress_1 ?p))
      (progress_2 ?p)
    )
  )

  (:action meet_step_2_3
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available ?p ?l ?t1)
      (meeting_started ?p)
      (progress_2 ?p)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (progress_2 ?p))
      (progress_3 ?p)
    )
  )

  (:action meet_step_3_4
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available ?p ?l ?t1)
      (meeting_started ?p)
      (progress_3 ?p)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (progress_3 ?p))
      (progress_4 ?p)
    )
  )

  (:action meet_step_4_5
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available ?p ?l ?t1)
      (meeting_started ?p)
      (progress_4 ?p)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (progress_4 ?p))
      (progress_5 ?p)
      (met_requirement ?p)
      (not (meeting_started ?p))
    )
  )
)