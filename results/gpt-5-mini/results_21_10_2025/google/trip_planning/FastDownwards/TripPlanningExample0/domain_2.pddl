(define (domain travel-planning-with-slots)
  (:requirements :typing :negative-preconditions)
  (:types city day slot)
  (:predicates
    (day ?d - day)
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (at ?c - city ?d - day)
    (covered ?d - day)
    (allowed-meet-day ?d - day)
    (met)
    (slot-for ?s - slot ?c - city)
    (available ?s - slot)
  )

  (:action stay-in-city
    :parameters (?c - city ?d1 - day ?d2 - day ?s - slot)
    :precondition (and (current ?d1) (next ?d1 ?d2) (at ?c ?d1) (slot-for ?s ?c) (available ?s))
    :effect (and
              (not (current ?d1)) (current ?d2)
              (at ?c ?d2)
              (covered ?d2)
              (not (available ?s))
            )
  )

  (:action fly-barcelona-to-florence
    :parameters (?d1 - day ?d2 - day ?s - slot)
    :precondition (and (current ?d1) (next ?d1 ?d2) (at barcelona ?d1) (slot-for ?s florence) (available ?s))
    :effect (and
              (not (current ?d1)) (current ?d2)
              (at florence ?d2)
              (covered ?d2)
              (not (available ?s))
            )
  )

  (:action fly-florence-to-barcelona
    :parameters (?d1 - day ?d2 - day ?s - slot)
    :precondition (and (current ?d1) (next ?d1 ?d2) (at florence ?d1) (slot-for ?s barcelona) (available ?s))
    :effect (and
              (not (current ?d1)) (current ?d2)
              (at barcelona ?d2)
              (covered ?d2)
              (not (available ?s))
            )
  )

  (:action fly-barcelona-to-helsinki
    :parameters (?d1 - day ?d2 - day ?s - slot)
    :precondition (and (current ?d1) (next ?d1 ?d2) (at barcelona ?d1) (slot-for ?s helsinki) (available ?s))
    :effect (and
              (not (current ?d1)) (current ?d2)
              (at helsinki ?d2)
              (covered ?d2)
              (not (available ?s))
            )
  )

  (:action fly-helsinki-to-barcelona
    :parameters (?d1 - day ?d2 - day ?s - slot)
    :precondition (and (current ?d1) (next ?d1 ?d2) (at helsinki ?d1) (slot-for ?s barcelona) (available ?s))
    :effect (and
              (not (current ?d1)) (current ?d2)
              (at barcelona ?d2)
              (covered ?d2)
              (not (available ?s))
            )
  )

  (:action confirm-in-florence
    :parameters (?d - day)
    :precondition (and (at florence ?d) (allowed-meet-day ?d))
    :effect (met)
  )
)