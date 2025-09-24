(define (domain integrated-trip)
  (:requirements :typing :negative-preconditions :action-costs)
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

  ;; --- Start actions (distinct per agent / city) ---
  (:action man_start-at-manchester
    :cost 1
    :parameters (?n1 - cnt ?n2 - cnt)
    :precondition (and (not (trip-started)) (spent manchester ?n1) (succ ?n1 ?n2))
    :effect (and (trip-started)
                 (at manchester day1)
                 (not (spent manchester ?n1)) (spent manchester ?n2))
  )

  (:action buch_start-at-bucharest
    :cost 1
    :parameters (?n1 - cnt ?n2 - cnt)
    :precondition (and (not (trip-started)) (spent bucharest ?n1) (succ ?n1 ?n2))
    :effect (and (trip-started)
                 (at bucharest day1)
                 (not (spent bucharest ?n1)) (spent bucharest ?n2))
  )

  (:action lyon_start-at-lyon
    :cost 1
    :parameters (?n1 - cnt ?n2 - cnt)
    :precondition (and (not (trip-started)) (spent lyon ?n1) (succ ?n1 ?n2))
    :effect (and (trip-started)
                 (at lyon day1)
                 (not (spent lyon ?n1)) (spent lyon ?n2))
  )

  ;; --- Fly actions (distinct per agent) ---
  ;; Flights move occupancy to the next day at the destination and increment that city's spent counter.
  (:action man_fly
    :cost 1
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day ?n1 - cnt ?n2 - cnt)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (direct ?from ?to) (trip-started)
                       (spent ?to ?n1) (succ ?n1 ?n2))
    :effect (and (at ?to ?d2)
                 (not (spent ?to ?n1)) (spent ?to ?n2))
  )

  (:action buch_fly
    :cost 1
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day ?n1 - cnt ?n2 - cnt)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (direct ?from ?to) (trip-started)
                       (spent ?to ?n1) (succ ?n1 ?n2))
    :effect (and (at ?to ?d2)
                 (not (spent ?to ?n1)) (spent ?to ?n2))
  )

  (:action lyon_fly
    :cost 1
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day ?n1 - cnt ?n2 - cnt)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (direct ?from ?to) (trip-started)
                       (spent ?to ?n1) (succ ?n1 ?n2))
    :effect (and (at ?to ?d2)
                 (not (spent ?to ?n1)) (spent ?to ?n2))
  )

  ;; --- Stay actions (advance to next day in the same city and increment city's spent counter) ---
  (:action man_stay-manchester
    :cost 1
    :parameters (?d1 - day ?d2 - day ?n1 - cnt ?n2 - cnt)
    :precondition (and (at manchester ?d1) (next ?d1 ?d2) (spent manchester ?n1) (succ ?n1 ?n2) (trip-started))
    :effect (and (at manchester ?d2)
                 (not (spent manchester ?n1)) (spent manchester ?n2))
  )

  (:action buch_stay-one-day
    :cost 1
    :parameters (?c - city ?d1 - day ?d2 - day ?n1 - cnt ?n2 - cnt)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2) (spent ?c ?n1) (succ ?n1 ?n2) (trip-started))
    :effect (and (at ?c ?d2)
                 (not (spent ?c ?n1)) (spent ?c ?n2))
  )

  (:action lyon_stay-lyon
    :cost 1
    :parameters (?d1 - day ?d2 - day ?n1 - cnt ?n2 - cnt)
    :precondition (and (at lyon ?d1) (next ?d1 ?d2) (spent lyon ?n1) (succ ?n1 ?n2) (trip-started))
    :effect (and (at lyon ?d2)
                 (not (spent lyon ?n1)) (spent lyon ?n2))
  )

  ;; --- End-trip action (marks trip finished once day17 occupancy exists) ---
  (:action end-trip
    :cost 1
    :parameters (?c - city)
    :precondition (and (trip-started) (not (trip-finished)) (at ?c day17))
    :effect (trip-finished)
  )
)