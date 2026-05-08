(define (domain san_francisco_trip)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    place - object
    person - object
    time_slot - object
  )

  (:predicates
    (at ?person - person ?place - place)
    (available ?person - person ?time - time_slot)
    (visited ?person - person)
    (time_order ?t1 - time_slot ?t2 - time_slot)
  )

  (:action travel
    :parameters (?from - place ?to - place ?current_time - time_slot ?arrival_time - time_slot)
    :precondition (and
      (at you ?from)
      (time_order ?current_time ?arrival_time))
    :effect (and
      (not (at you ?from))
      (at you ?to))
  )

  (:action meet
    :parameters (?person - person ?place - place ?meeting_time - time_slot)
    :precondition (and
      (at you ?place)
      (at ?person ?place)
      (available ?person ?meeting_time)
      (not (visited ?person)))
    :effect (and
      (visited ?person))
  )
)