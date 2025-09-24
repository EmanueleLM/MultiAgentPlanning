(define (domain integrated-trip-domain)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct-flight ?from - city ?to - city)
    (is-berlin ?c - city)
    (is-day1 ?d - day)
    (is-day4 ?d - day)
    (attended-day1)
    (attended-day4)
  )

  (:action fly_dubrovnik
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (direct-flight ?from ?to))
    :effect (and
              (not (at ?from ?d1))
              (at ?to ?d2))
  )

  (:action stay_dubrovnik
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and
              (not (at ?c ?d1))
              (at ?c ?d2))
  )

  (:action fly_berlin
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (direct-flight ?from ?to))
    :effect (and
              (not (at ?from ?d1))
              (at ?to ?d2))
  )

  (:action stay_berlin
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and
              (not (at ?c ?d1))
              (at ?c ?d2))
  )

  (:action attend-day1_berlin
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (is-berlin ?c) (is-day1 ?d))
    :effect (attended-day1)
  )

  (:action attend-day4_berlin
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (is-berlin ?c) (is-day4 ?d))
    :effect (attended-day4)
  )

  (:action fly_munich
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (direct-flight ?from ?to))
    :effect (and
              (not (at ?from ?d1))
              (at ?to ?d2))
  )

  (:action stay_munich
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and
              (not (at ?c ?d1))
              (at ?c ?d2))
  )
)