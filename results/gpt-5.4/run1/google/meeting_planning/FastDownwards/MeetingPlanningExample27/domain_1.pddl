(define (domain san_francisco_meet_margaret)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    traveler
    person
    location
    timepoint
  )

  (:constants
    marina_district pacific_heights - location
    margaret - person
  )

  (:predicates
    (at ?traveler - traveler ?loc - location)
    (current_time ?t - timepoint)
    (next_time ?t1 - timepoint ?t2 - timepoint)
    (connected ?from - location ?to - location)
    (margaret_available ?loc - location ?t - timepoint)
    (met ?p - person)
  )

  (:action travel
    :parameters (?traveler - traveler ?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?traveler ?from)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (connected ?from ?to)
    )
    :effect (and
      (not (at ?traveler ?from))
      (at ?traveler ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action wait
    :parameters (?traveler - traveler ?loc - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?traveler ?loc)
      (current_time ?t1)
      (next_time ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_margaret
    :parameters (?traveler - traveler ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?traveler pacific_heights)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (margaret_available pacific_heights ?t1)
      (not (met margaret))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (met margaret)
    )
  )
)