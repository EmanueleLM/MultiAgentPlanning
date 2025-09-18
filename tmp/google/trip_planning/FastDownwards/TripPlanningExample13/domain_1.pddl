(define (domain integrated-trip)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types city day cnt)

  (:predicates
    (at ?c - city ?d - day)         ; at city ?c on day ?d (presence on that day)
    (direct ?c1 - city ?c2 - city) ; direct flight exists from ?c1 to ?c2
    (next ?d1 - day ?d2 - day)     ; day successor
    (trip-started)
    (trip-finished)
    (spent ?c - city ?n - cnt)     ; city ?c has currently accumulated ?n days
    (succ ?n1 - cnt ?n2 - cnt)     ; successor relation for count objects
  )

  ;; --- Start actions (distinct per agent / city) ---
  (:action man_start-at-manchester
    :cost 1
    :precondition (not (trip-started))
    :effect (and (trip-started) (at manchester day1))
  )

  (:action buch_start-at-bucharest
    :cost 1
    :precondition (not (trip-started))
    :effect (and (trip-started) (at bucharest day1))
  )

  (:action lyon_start-at-lyon
    :cost 1
    :precondition (not (trip-started))
    :effect (and (trip-started) (at lyon day1))
  )

  ;; --- Fly actions (distinct per agent but same semantics) ---
  (:action man_fly
    :cost 1
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (at ?from ?d) (direct ?from ?to) (trip-started))
    :effect (and (not (at ?from ?d)) (at ?to ?d))
  )

  (:action buch_fly
    :cost 1
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (at ?from ?d) (direct ?from ?to) (trip-started))
    :effect (and (not (at ?from ?d)) (at ?to ?d))
  )

  (:action lyon_fly
    :cost 1
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (at ?from ?d) (direct ?from ?to) (trip-started))
    :effect (and (not (at ?from ?d)) (at ?to ?d))
  )

  ;; --- Stay actions (advance to next day and increment city's spent counter) ---
  ;; Manchester-specific stay
  (:action man_stay-manchester
    :cost 1
    :parameters (?d1 - day ?d2 - day ?n1 - cnt ?n2 - cnt)
    :precondition (and (at manchester ?d1) (next ?d1 ?d2) (spent manchester ?n1) (succ ?n1 ?n2) (trip-started))
    :effect (and (not (at manchester ?d1)) (at manchester ?d2)
                 (not (spent manchester ?n1)) (spent manchester ?n2))
  )

  ;; Bucharest generic one-day stay
  (:action buch_stay-one-day
    :cost 1
    :parameters (?c - city ?d1 - day ?d2 - day ?n1 - cnt ?n2 - cnt)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2) (spent ?c ?n1) (succ ?n1 ?n2) (trip-started))
    :effect (and (not (at ?c ?d1)) (at ?c ?d2)
                 (not (spent ?c ?n1)) (spent ?c ?n2))
  )

  ;; Lyon-specific stay
  (:action lyon_stay-lyon
    :cost 1
    :parameters (?d1 - day ?d2 - day ?n1 - cnt ?n2 - cnt)
    :precondition (and (at lyon ?d1) (next ?d1 ?d2) (spent lyon ?n1) (succ ?n1 ?n2) (trip-started))
    :effect (and (not (at lyon ?d1)) (at lyon ?d2)
                 (not (spent lyon ?n1)) (spent lyon ?n2))
  )

  ;; --- End-trip action to count the final (day17) occupancy ---
  (:action end-trip-count-final-day
    :cost 1
    :parameters (?c - city ?n1 - cnt ?n2 - cnt)
    :precondition (and (trip-started) (not (trip-finished)) (at ?c day17) (spent ?c ?n1) (succ ?n1 ?n2))
    :effect (and (trip-finished) (not (spent ?c ?n1)) (spent ?c ?n2))
  )
)