(define (domain sf_meeting_margaret)
  (:requirements :strips :typing)
  (:types location person)
  (:predicates
    (at ?l - location)
    (person_at ?p - person ?l - location)
    (chosen_departure_0900)
    (arrived_0912)
    (arrival_0912_at ?l - location)
    (travel_edge ?from - location ?to - location)
    (slot_0912_1545_available ?p - person ?l - location)
    (met ?p - person)
  )

  (:action move_to_haight
    :parameters (?from - location ?to - location)
    :precondition (and
      (at ?from)
      (chosen_departure_0900)
      (travel_edge ?from ?to)
      (arrival_0912_at ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (arrived_0912)
    )
  )

  (:action meet_margaret_30
    :parameters (?p - person ?l - location)
    :precondition (and
      (at ?l)
      (arrived_0912)
      (person_at ?p ?l)
      (slot_0912_1545_available ?p ?l)
    )
    :effect (met ?p)
  )
)