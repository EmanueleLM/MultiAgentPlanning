(define (domain integrated-trip)
  (:requirements :typing :negative-preconditions :action-costs :equality)
  (:types city day cnt)

  (:predicates
    (at ?c - city ?d - day)
    (direct ?c1 - city ?c2 - city)
    (next ?d1 - day ?d2 - day)
    (trip-started)
    (trip-finished)
    (spent ?c - city ?n - cnt)
    (succ ?n1 - cnt ?n2 - cnt)
  )

  (:action man_start-at-manchester
    :parameters (?n1 - cnt ?n2 - cnt)
    :precondition (and (not (trip-started)) (spent manchester ?n1) (succ ?n1 ?n2))
    :effect (and (trip-started)
                 (at manchester day1)
                 (not (spent manchester ?n1)) (spent manchester ?n2))
  )

  (:action buch_start-at-bucharest
    :parameters (?n1 - cnt ?n2 - cnt)
    :precondition (and (not (trip-started)) (spent bucharest ?n1) (succ ?n1 ?n2))
    :effect (and (trip-started)
                 (at bucharest day1)
                 (not (spent bucharest ?n1)) (spent bucharest ?n2))
  )

  (:action lyon_start-at-lyon
    :parameters (?n1 - cnt ?n2 - cnt)
    :precondition (and (not (trip-started)) (spent lyon ?n1) (succ ?n1 ?n2))
    :effect (and (trip-started)
                 (at lyon day1)
                 (not (spent lyon ?n1)) (spent lyon ?n2))
  )

  (:action man_fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day ?n1 - cnt ?n2 - cnt)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (direct ?from ?to) (trip-started)
                       (spent ?to ?n1) (succ ?n1 ?n2))
    :effect (and (at ?to ?d2)
                 (not (spent ?to ?n1)) (spent ?to ?n2))
  )

  (:action buch_fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day ?n1 - cnt ?n2 - cnt)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (direct ?from ?to) (trip-started)
                       (spent ?to ?n1) (succ ?n1 ?n2))
    :effect (and (at ?to ?d2)
                 (not (spent ?to ?n1)) (spent ?to ?n2))
  )

  (:action lyon_fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day ?n1 - cnt ?n2 - cnt)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (direct ?from ?to) (trip-started)
                       (spent ?to ?n1) (succ ?n1 ?n2))
    :effect (and (at ?to ?d2)
                 (not (spent ?to ?n1)) (spent ?to ?n2))
  )

  (:action man_stay-manchester
    :parameters (?d1 - day ?d2 - day ?n1 - cnt ?n2 - cnt)
    :precondition (and (at manchester ?d1) (next ?d1 ?d2) (spent manchester ?n1) (succ ?n1 ?n2) (trip-started))
    :effect (and (at manchester ?d2)
                 (not (spent manchester ?n1)) (spent manchester ?n2))
  )

  (:action buch_stay-one-day
    :parameters (?c - city ?d1 - day ?d2 - day ?n1 - cnt ?n2 - cnt)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2) (spent ?c ?n1) (succ ?n1 ?n2) (trip-started))
    :effect (and (at ?c ?d2)
                 (not (spent ?c ?n1)) (spent ?c ?n2))
  )

  (:action lyon_stay-lyon
    :parameters (?d1 - day ?d2 - day ?n1 - cnt ?n2 - cnt)
    :precondition (and (at lyon ?d1) (next ?d1 ?d2) (spent lyon ?n1) (succ ?n1 ?n2) (trip-started))
    :effect (and (at lyon ?d2)
                 (not (spent lyon ?n1)) (spent lyon ?n2))
  )

  (:action end-trip
    :parameters (?c - city)
    :precondition (and (trip-started) (not (trip-finished)) (at ?c day17))
    :effect (and (trip-finished))
  )
)