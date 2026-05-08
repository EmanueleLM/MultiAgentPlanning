(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (city_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (has_flight ?c1 ?c2 - city)
  )

  ;; The 'stay' action represents staying in the current city for one more day.
  ;; This increments the current day and the count of days spent in that city.
  (:action stay
    :parameters (?c - city ?d1 ?d2 - day ?n1 ?n2 - count)
    :precondition (and 
      (at ?c) 
      (current_day ?d1) 
      (next_day ?d1 ?d2) 
      (city_count ?c ?n1) 
      (next_count ?n1 ?n2)
    )
    :effect (and 
      (not (current_day ?d1)) 
      (current_day ?d2) 
      (not (city_count ?c ?n1)) 
      (city_count ?c ?n2)
    )
  )

  ;; The 'fly' action represents commuting between cities.
  ;; A flight takes place on a transition day, counting as a day spent in both the origin and destination cities.
  (:action fly
    :parameters (?from - city ?to - city ?d1 ?d2 - day ?nf1 ?nf2 - count ?nt1 ?nt2 - count)
    :precondition (and 
      (at ?from) 
      (has_flight ?from ?to) 
      (current_day ?d1) 
      (next_day ?d1 ?d2) 
      (city_count ?from ?nf1) 
      (next_count ?nf1 ?nf2) 
      (city_count ?to ?nt1) 
      (next_count ?nt1 ?nt2)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (current_day ?d1)) 
      (current_day ?d2) 
      (not (city_count ?from ?nf1)) 
      (city_count ?from ?nf2) 
      (not (city_count ?to ?nt1)) 
      (city_count ?to ?nt2)
    )
  )
)