(define (domain san_francisco_trip)
  (:requirements :strips :typing :negative-preconditions)
  
  (:types
    place - object
    person - object
    time_slot - object
  )

  (:predicates
    (at ?person - person ?place - place ?time - time_slot)
    (available ?person - person ?time - time_slot)
    (visited ?person - person)
    (time_order ?t1 - time_slot ?t2 - time_slot)
  )

  (:action travel
    :parameters (?from - place ?to - place ?start - time_slot ?end - time_slot)
    :precondition (and
      (at you ?from ?start)
      (time_order ?start ?end))
    :effect (and
      (not (at you ?from ?end))
      (at you ?to ?end))
  )
  
  (:action meet
    :parameters (?person - person ?place - place ?start - time_slot ?end - time_slot)
    :precondition (and
      (at you ?place ?start)
      (at ?person ?place ?start)
      (time_order ?start ?end)
      (available ?person ?start)
      (not (visited ?person)))
    :effect (and
      (visited ?person)
      (available ?person ?end))
  )
)