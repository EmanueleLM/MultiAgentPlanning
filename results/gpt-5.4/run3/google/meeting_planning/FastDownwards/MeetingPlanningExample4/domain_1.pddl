(define (domain san_francisco_jessica_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:constants
    presidio marina_district - location
    jessica - person
  )

  (:predicates
    (at ?l - location)
    (connected ?from - location ?to - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (person_at ?p - person ?l - location)
    (available ?p - person ?t - time)
    (met_15_jessica)
    (met_30_jessica)
    (met_45_jessica)
    (met_60_jessica)
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action move
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (connected ?from ?to)
      (current_time ?t1)
      (next_time ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_first_15_jessica
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at marina_district)
      (person_at jessica marina_district)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available jessica ?t1)
      (not (met_15_jessica))
    )
    :effect (and
      (met_15_jessica)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_second_15_jessica
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at marina_district)
      (person_at jessica marina_district)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available jessica ?t1)
      (met_15_jessica)
      (not (met_30_jessica))
    )
    :effect (and
      (met_30_jessica)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_third_15_jessica
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at marina_district)
      (person_at jessica marina_district)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available jessica ?t1)
      (met_30_jessica)
      (not (met_45_jessica))
    )
    :effect (and
      (met_45_jessica)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_fourth_15_jessica
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at marina_district)
      (person_at jessica marina_district)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available jessica ?t1)
      (met_45_jessica)
      (not (met_60_jessica))
    )
    :effect (and
      (met_60_jessica)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )
)