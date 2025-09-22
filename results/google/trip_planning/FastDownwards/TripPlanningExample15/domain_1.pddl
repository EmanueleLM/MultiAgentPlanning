(define (domain integrated_travel)
  (:requirements :typing :equality :negative-preconditions :conditional-effects :action-costs)
  (:types city day bcount pcount)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (visited ?c - city)
    (is-berlin ?c - city)
    (is-porto ?c - city)
    (is-krakow ?c - city)
    (attended-wedding)
    ;; bounded counters encoded as objects
    (berlin_count ?b - bcount)
    (porto_count ?p - pcount)
    (bnext ?b1 - bcount ?b2 - bcount)
    (pnext ?p1 - pcount ?p2 - pcount)
  )

  (:functions
    (total-cost)
  )

  ;-----------------------
  ; Berlin agent actions (berlin_ prefix)
  ;-----------------------
  (:action berlin_stay_in_berlin
    :parameters (?c - city ?d1 - day ?d2 - day ?b1 - bcount ?b2 - bcount)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2) (is-berlin ?c) (berlin_count ?b1) (bnext ?b1 ?b2))
    :effect (and
              (not (at ?c ?d1))
              (at ?c ?d2)
              (not (berlin_count ?b1))
              (berlin_count ?b2)
              (increase (total-cost) 1)
            )
  )

  (:action berlin_stay_else
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2) (not (is-berlin ?c)))
    :effect (and
              (not (at ?c ?d1))
              (at ?c ?d2)
              (increase (total-cost) 1)
            )
  )

  (:action berlin_fly_to_berlin
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day ?b1 - bcount ?b2 - bcount)
    :precondition (and (at ?from ?d1) (direct ?from ?to) (next ?d1 ?d2) (is-berlin ?to) (berlin_count ?b1) (bnext ?b1 ?b2))
    :effect (and
              (not (at ?from ?d1))
              (at ?to ?d2)
              (not (berlin_count ?b1))
              (berlin_count ?b2)
              (increase (total-cost) 1)
            )
  )

  (:action berlin_fly_else
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (direct ?from ?to) (next ?d1 ?d2) (not (is-berlin ?to)))
    :effect (and
              (not (at ?from ?d1))
              (at ?to ?d2)
              (increase (total-cost) 1)
            )
  )

  ;-----------------------
  ; Travel/Wedding agent actions (travel_ prefix)
  ;-----------------------
  (:action travel_fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (direct ?from ?to) (next ?d1 ?d2))
    :effect (and
              (not (at ?from ?d1))
              (at ?to ?d2)
              (increase (total-cost) 1)
            )
  )

  (:action travel_stay_in_porto
    :parameters (?c - city ?d1 - day ?d2 - day ?p1 - pcount ?p2 - pcount)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2) (is-porto ?c) (porto_count ?p1) (pnext ?p1 ?p2))
    :effect (and
              (not (at ?c ?d1))
              (at ?c ?d2)
              (not (porto_count ?p1))
              (porto_count ?p2)
              (increase (total-cost) 1)
            )
  )

  (:action travel_stay_else
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2) (not (is-porto ?c)))
    :effect (and
              (not (at ?c ?d1))
              (at ?c ?d2)
              (increase (total-cost) 1)
            )
  )

  (:action travel_attend_wedding
    :parameters ()
    :precondition (and (at porto day10) (not (attended-wedding)))
    :effect (and (attended-wedding) (increase (total-cost) 1))
  )

  ;-----------------------
  ; Trip agent actions (trip_ prefix)
  ;-----------------------
  (:action trip_fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (direct ?from ?to))
    :effect (and
              (not (at ?from ?d1))
              (at ?to ?d2)
              (visited ?to)
              (increase (total-cost) 1)
            )
  )

  (:action trip_stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and
              (not (at ?c ?d1))
              (at ?c ?d2)
              (visited ?c)
              (increase (total-cost) 1)
            )
  )

  (:action trip_stay_krakow_5days
    :parameters (?c - city ?d1 - day ?d2 - day ?d3 - day ?d4 - day ?d5 - day)
    :precondition (and
      (is-krakow ?c)
      (at ?c ?d1)
      (next ?d1 ?d2) (next ?d2 ?d3) (next ?d3 ?d4) (next ?d4 ?d5)
    )
    :effect (and
      (not (at ?c ?d1))
      (at ?c ?d2) (at ?c ?d3) (at ?c ?d4) (at ?c ?d5)
      (visited ?c)
      (increase (total-cost) 4)
    )
  )

)