(define (domain integrated_travel)
  (:requirements :typing :negative-preconditions)
  (:types city day bcount pcount kcount)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (visited ?c - city)
    (is-berlin ?c - city)
    (is-porto ?c - city)
    (is-krakow ?c - city)
    (attended-wedding)
    (berlin_count ?b - bcount)
    (bnext ?b1 - bcount ?b2 - bcount)
    (porto_count ?p - pcount)
    (pnext ?p1 - pcount ?p2 - pcount)
    (krakow_count ?k - kcount)
    (knext ?k1 - kcount ?k2 - kcount)
    (wedding_day ?d - day)
  )

  (:action berlin_stay_in_berlin
    :parameters (?c - city ?d1 - day ?d2 - day ?b1 - bcount ?b2 - bcount)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2) (is-berlin ?c) (berlin_count ?b1) (bnext ?b1 ?b2))
    :effect (and
              (not (at ?c ?d1))
              (at ?c ?d2)
              (visited ?c)
              (not (berlin_count ?b1))
              (berlin_count ?b2)
            )
  )

  (:action fly_to_berlin
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day ?b1 - bcount ?b2 - bcount)
    :precondition (and (at ?from ?d1) (direct ?from ?to) (next ?d1 ?d2) (is-berlin ?to) (berlin_count ?b1) (bnext ?b1 ?b2))
    :effect (and
              (not (at ?from ?d1))
              (at ?to ?d2)
              (visited ?to)
              (not (berlin_count ?b1))
              (berlin_count ?b2)
            )
  )

  (:action porto_stay_in_porto
    :parameters (?c - city ?d1 - day ?d2 - day ?p1 - pcount ?p2 - pcount)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2) (is-porto ?c) (porto_count ?p1) (pnext ?p1 ?p2))
    :effect (and
              (not (at ?c ?d1))
              (at ?c ?d2)
              (visited ?c)
              (not (porto_count ?p1))
              (porto_count ?p2)
            )
  )

  (:action fly_to_porto
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day ?p1 - pcount ?p2 - pcount)
    :precondition (and (at ?from ?d1) (direct ?from ?to) (next ?d1 ?d2) (is-porto ?to) (porto_count ?p1) (pnext ?p1 ?p2))
    :effect (and
              (not (at ?from ?d1))
              (at ?to ?d2)
              (visited ?to)
              (not (porto_count ?p1))
              (porto_count ?p2)
            )
  )

  (:action krakow_stay_in_krakow
    :parameters (?c - city ?d1 - day ?d2 - day ?k1 - kcount ?k2 - kcount)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2) (is-krakow ?c) (krakow_count ?k1) (knext ?k1 ?k2))
    :effect (and
      (not (at ?c ?d1))
      (at ?c ?d2)
      (visited ?c)
      (not (krakow_count ?k1))
      (krakow_count ?k2)
    )
  )

  (:action fly_to_krakow
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day ?k1 - kcount ?k2 - kcount)
    :precondition (and (at ?from ?d1) (direct ?from ?to) (next ?d1 ?d2) (is-krakow ?to) (krakow_count ?k1) (knext ?k1 ?k2))
    :effect (and
      (not (at ?from ?d1))
      (at ?to ?d2)
      (visited ?to)
      (not (krakow_count ?k1))
      (krakow_count ?k2)
    )
  )

  (:action generic_stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2) (not (is-berlin ?c)) (not (is-porto ?c)) (not (is-krakow ?c)))
    :effect (and
              (not (at ?c ?d1))
              (at ?c ?d2)
              (visited ?c)
            )
  )

  (:action generic_fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (direct ?from ?to) (next ?d1 ?d2) (not (is-berlin ?to)) (not (is-porto ?to)) (not (is-krakow ?to)))
    :effect (and
              (not (at ?from ?d1))
              (at ?to ?d2)
              (visited ?to)
            )
  )

  (:action attend_wedding
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (is-porto ?c) (wedding_day ?d) (not (attended-wedding)))
    :effect (and (attended-wedding))
  )
)