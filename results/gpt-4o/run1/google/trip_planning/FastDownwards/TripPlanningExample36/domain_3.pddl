(define (domain european_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  
  (:predicates
    (at ?city - city ?day - day)
    (visited ?city - city)
    (next ?current - day ?next - day)
  )

  (:action fly
    :parameters (?from - city ?to - city ?current_day - day ?next_day - day)
    :precondition (and (at ?from ?current_day) (next ?current_day ?next_day)
                       ;; Define direct flight connections explicitly
                       (or (and (= ?from florence) 
                                (or (= ?to munich) (= ?to warsaw)))
                           (and (= ?from munich) (= ?to florence))
                           (and (= ?from warsaw) (= ?to florence))))
    :effect (and (not (at ?from ?current_day)) (at ?to ?next_day))
  )

  (:action stay
    :parameters (?city - city ?current_day - day ?next_day - day)
    :precondition (and (at ?city ?current_day) (next ?current_day ?next_day))
    :effect (and (not (at ?city ?current_day)) (at ?city ?next_day) (visited ?city))
  )
)