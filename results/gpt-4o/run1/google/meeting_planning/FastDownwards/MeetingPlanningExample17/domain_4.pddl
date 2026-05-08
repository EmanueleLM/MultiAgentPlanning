(define (domain san_francisco_trip)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    place - object
    person - object
    time_slot - object
  )

  (:predicates
    (at ?entity - person ?location - place)
    (available ?entity - person ?time - time_slot)
    (visited ?person - person)
    (time_order ?t1 - time_slot ?t2 - time_slot)
    (you_at ?location - place)
  )

  (:action travel
    :parameters (?from - place ?to - place ?current_time - time_slot ?arrival_time - time_slot)
    :precondition (and
      (you_at ?from)
      (time_order ?current_time ?arrival_time))
    :effect (and
      (not (you_at ?from))
      (you_at ?to))
  )

  (:action meet
    :parameters (?person - person ?location - place ?meeting_time - time_slot)
    :precondition (and
      (you_at ?location)
      (at ?person ?location)
      (available ?person ?meeting_time)
      (not (visited ?person)))
    :effect (visited ?person)
  )
)