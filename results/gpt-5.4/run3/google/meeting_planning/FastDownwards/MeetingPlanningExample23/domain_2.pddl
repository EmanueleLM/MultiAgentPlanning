(define (domain san_francisco_meet_john)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
    meet_stage
  )

  (:constants
    traveler - person
    bayview russian_hill - location
  )

  (:predicates
    (at ?p - person ?l - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (connected ?from - location ?to - location)
    (travel_two_step ?from - location ?to - location)
    (john_available ?t - time)
    (meeting_stage ?s - meet_stage)
    (meeting_next ?s1 - meet_stage ?s2 - meet_stage)
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at traveler ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time ?t3 - time)
    :precondition (and
      (at traveler ?from)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (next_time ?t2 ?t3)
      (connected ?from ?to)
      (travel_two_step ?from ?to)
    )
    :effect (and
      (not (at traveler ?from))
      (at traveler ?to)
      (not (current_time ?t1))
      (current_time ?t3)
    )
  )

  (:action meet_john_step
    :parameters (?s1 - meet_stage ?s2 - meet_stage ?t1 - time ?t2 - time)
    :precondition (and
      (meeting_stage ?s1)
      (meeting_next ?s1 ?s2)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (at traveler russian_hill)
      (john_available ?t1)
    )
    :effect (and
      (not (meeting_stage ?s1))
      (meeting_stage ?s2)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )
)