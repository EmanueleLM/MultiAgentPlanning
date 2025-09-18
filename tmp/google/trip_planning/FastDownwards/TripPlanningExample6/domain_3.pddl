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
    (is-day1 ?d - day)
    (is-day4 ?d - day)
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
    :effect (and
              (not (at ?c ?d1))
              (at ?c ?d2))
  )

  (:action attend-day1_a1
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (is-berlin ?c) (is-day1 ?d))
    :effect (attended-day1)
  )

  (:action attend-day4_a1
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (is-berlin ?c) (is-day4 ?d))
    :effect (attended-day4)
  )

  (:action fly_a2
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (connected ?from ?to) (at ?from ?d1) (next ?d1 ?d2))
    :effect (and
              (not (at ?from ?d1))
              (at ?to ?d2))
  )

  (:action stay_a2
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and
              (not (at ?c ?d1))
              (at ?c ?d2))
  )

  (:action attend-day1_a2
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (is-berlin ?c) (is-day1 ?d))
    :effect (attended-day1)
  )

  (:action attend-day4_a2
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (is-berlin ?c) (is-day4 ?d))
    :effect (attended-day4)
  )

  (:action fly_a3
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (flight ?from ?to) (at ?from ?d1) (next ?d1 ?d2))
    :effect (and
              (not (at ?from ?d1))
              (at ?to ?d2))
  )

  (:action stay_a3
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and
              (not (at ?c ?d1))
              (at ?c ?d2))
  )
)