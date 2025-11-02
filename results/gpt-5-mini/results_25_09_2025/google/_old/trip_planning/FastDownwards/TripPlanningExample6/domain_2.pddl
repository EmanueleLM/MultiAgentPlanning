(define (domain integrated-trip-domain)
  (:requirements :strips :typing :adl)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct-flight ?from - city ?to - city)
    (connected ?from - city ?to - city)
    (flight ?from - city ?to - city)
    (is-dubrovnik ?c - city)
    (is-berlin ?c - city)
    (is-munich ?c - city)
    (attended-day1)
    (attended-day4)
  )

  (:action fly_a1
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (at ?from ?d) (direct-flight ?from ?to))
    :effect (and
              (not (at ?from ?d))
              (at ?to ?d))
  )

  (:action stay_a1
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (at ?c ?d2)
  )

  (:action attend-day1_a1
    :parameters (?c - city)
    :precondition (and (at ?c d1) (is-berlin ?c))
    :effect (attended-day1)
  )

  (:action attend-day4_a1
    :parameters (?c - city)
    :precondition (and (at ?c d4) (is-berlin ?c))
    :effect (attended-day4)
  )

  (:action fly_a2
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (connected ?from ?to) (at ?from ?d1) (next ?d1 ?d2))
    :effect (at ?to ?d2)
  )

  (:action stay_a2
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (at ?c ?d2)
  )

  (:action attend-day1_a2
    :parameters (?c - city)
    :precondition (and (at ?c d1) (is-berlin ?c))
    :effect (attended-day1)
  )

  (:action attend-day4_a2
    :parameters (?c - city)
    :precondition (and (at ?c d4) (is-berlin ?c))
    :effect (attended-day4)
  )

  (:action fly_a3
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (flight ?from ?to) (at ?from ?d1) (next ?d1 ?d2))
    :effect (at ?to ?d2)
  )

  (:action stay_a3
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (at ?c ?d2)
  )
)