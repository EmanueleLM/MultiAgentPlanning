(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)

  (:predicates
    (at ?c - city)
    (at_start)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (count ?c - city ?n - count)
    (next_count ?n1 ?n2 - count)
    (visited ?c - city ?d - day)
    (can_fly ?c1 ?c2 - city)
  )

  ;; The trip starts on Day 1 in a chosen city. 
  ;; This action accounts for the first day's visit.
  (:action start_trip
    :parameters (?c - city ?d1 ?d2 - day ?c0 ?c1 - count)
    :precondition (and 
      (at_start)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (count ?c ?c0)
      (next_count ?c0 ?c1)
    )
    :effect (and 
      (at ?c)
      (not (at_start))
      (not (current_day ?d1))
      (current_day ?d2)
      (not (count ?c ?c0))
      (count ?c ?c1)
      (visited ?c ?d1)
    )
  )

  ;; Spend a day in the current city.
  (:action stay_in_city
    :parameters (?c - city ?d - day ?dn - day ?cb ?ca - count)
    :precondition (and 
      (at ?c)
      (current_day ?d)
      (next_day ?d ?dn)
      (count ?c ?cb)
      (next_count ?cb ?ca)
    )
    :effect (and 
      (not (current_day ?d))
      (current_day ?dn)
      (not (count ?c ?cb))
      (count ?c ?ca)
      (visited ?c ?d)
    )
  )

  ;; Fly from one city to another. This action consumes one day, 
  ;; but the traveler is considered to have visited both cities on that day.
  (:action fly_and_spend_day
    :parameters (?from ?to - city ?d - day ?dn - day ?cfb ?cfa - count ?ctb ?cta - count)
    :precondition (and 
      (at ?from)
      (can_fly ?from ?to)
      (current_day ?d)
      (next_day ?d ?dn)
      (count ?from ?cfb)
      (next_count ?cfb ?cfa)
      (count ?to ?ctb)
      (next_count ?ctb ?cta)
    )
    :effect (and 
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?dn)
      (not (count ?from ?cfb))
      (count ?from ?cfa)
      (not (count ?to ?ctb))
      (count ?to ?cta)
      (visited ?from ?d)
      (visited ?to ?d)
    )
  )
)