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
    :parameters (?c - city ?d - day ?n1 - cnt ?n2 - cnt)
    :precondition (and (not (trip-started)) (spent ?c ?n1) (succ ?n1 ?n2))
    :effect (and (trip-started)
                 (at ?c ?d)
                 (not (spent ?c ?n1)) (spent ?c ?n2))
  )

  (:action buch_start-at-bucharest
    :parameters (?c - city ?d - day ?n1 - cnt ?n2 - cnt)
    :precondition (and (not (trip-started)) (spent ?c ?n1) (succ ?n1 ?n2))
    :effect (and (trip-started)
                 (at ?c ?d)
                 (not (spent ?c ?n1)) (spent ?c ?n2))
  )

  (:action lyon_start-at-lyon
    :parameters (?c - city ?d - day ?n1 - cnt ?n2 - cnt)
    :precondition (and (not (trip-started)) (spent ?c ?n1) (succ ?n1 ?n2))
    :effect (and (trip-started)
                 (at ?c ?d)
                 (not (spent ?c ?n1)) (spent ?c ?n2))
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
    :parameters (?c - city ?d1 - day ?d2 - day ?n1 - cnt ?n2 - cnt)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2) (spent ?c ?n1) (succ ?n1 ?n2) (trip-started))
    :effect (and (at ?c ?d2)
                 (not (spent ?c ?n1)) (spent ?c ?n2))
  )

  (:action buch_stay-one-day
    :parameters (?c - city ?d1 - day ?d2 - day ?n1 - cnt ?n2 - cnt)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2) (spent ?c ?n1) (succ ?n1 ?n2) (trip-started))
    :effect (and (at ?c ?d2)
                 (not (spent ?c ?n1)) (spent ?c ?n2))
  )

  (:action lyon_stay-lyon
    :parameters (?c - city ?d1 - day ?d2 - day ?n1 - cnt ?n2 - cnt)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2) (spent ?c ?n1) (succ ?n1 ?n2) (trip-started))
    :effect (and (at ?c ?d2)
                 (not (spent ?c ?n1)) (spent ?c ?n2))
  )

  (:action end-trip
    :parameters (?c - city ?d - day)
    :precondition (and (trip-started) (not (trip-finished)) (at ?c ?d))
    :effect (and (trip-finished))
  )
)