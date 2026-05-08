(define (domain san_francisco_ronald_day)
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

    (connected ?from - location ?to - location)
    (travel_time_7 ?from - location ?to - location)
    (travel_time_9 ?from - location ?to - location)

    (next_time ?t1 - time ?t2 - time)
    (plus_7 ?t1 - time ?t2 - time)
    (plus_9 ?t1 - time ?t2 - time)

    (available ?p - person ?l - location ?t - time)

    (meeting_stage ?p - person ?s - meet_stage)
    (next_stage ?s1 - meet_stage ?s2 - meet_stage)
    (met_minimum ?p - person)
  )

  (:action wait_one_minute
    :parameters (?t1 - time ?t2 - time ?l - location)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (at ?l)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_7
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (current_time ?t1)
      (connected ?from ?to)
      (travel_time_7 ?from ?to)
      (plus_7 ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_9
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (current_time ?t1)
      (connected ?from ?to)
      (travel_time_9 ?from ?to)
      (plus_9 ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_step
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time ?s1 - meet_stage ?s2 - meet_stage)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (at ?l)
      (available ?p ?l ?t1)
      (meeting_stage ?p ?s1)
      (next_stage ?s1 ?s2)
      (not (meeting_stage ?p m104))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage ?p ?s1))
      (meeting_stage ?p ?s2)
    )
  )

  (:action meet_final_step
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (at ?l)
      (available ?p ?l ?t1)
      (meeting_stage ?p m104)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage ?p m104))
      (meeting_stage ?p m105)
      (met_minimum ?p)
    )
  )
)