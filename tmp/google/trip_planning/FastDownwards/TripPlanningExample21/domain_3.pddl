(define (domain integrated-travel)
  (:requirements :strips :typing :negative-preconditions :adl :action-costs)
  (:types agent city day)

  (:constants
    mykonos vienna venice - city
    day0 day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:predicates
    (at ?a - agent ?c - city)
    (visited ?c - city)
    (direct ?from - city ?to - city)
    (workshop-attended ?a - agent)
    (current ?d - day)
    (advance2 ?d1 - day ?d2 - day)
    (advance6 ?d1 - day ?d2 - day)
  )

  (:action fly-flight
    :parameters (?a - agent ?from - city ?to - city)
    :precondition (and (at ?a ?from) (direct ?from ?to))
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
    :cost 1
  )

  (:action fly-traveler
    :parameters (?a - agent ?from - city ?to - city)
    :precondition (and (at ?a ?from) (direct ?from ?to))
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
    :cost 1
  )

  (:action stay-mykonos
    :parameters (?a - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?a mykonos) (current ?d1) (advance2 ?d1 ?d2))
    :effect (and
      (visited mykonos)
      (not (current ?d1))
      (current ?d2)
    )
  )

  (:action stay-vienna
    :parameters (?a - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?a vienna) (current ?d1) (advance2 ?d1 ?d2))
    :effect (and
      (visited vienna)
      (not (current ?d1))
      (current ?d2)
    )
  )

  (:action stay-venice
    :parameters (?a - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?a venice) (current ?d1) (advance6 ?d1 ?d2))
    :effect (and
      (visited venice)
      (not (current ?d1))
      (current ?d2)
    )
  )

  (:action attend-workshop
    :parameters (?a - agent)
    :precondition (and
      (at ?a venice)
      (or
        (current day5)
        (current day6)
        (current day7)
        (current day8)
        (current day9)
        (current day10)
      )
    )
    :effect (workshop-attended ?a)
  )
)