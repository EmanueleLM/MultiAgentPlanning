(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    ;; The traveler is in a city at the end of a given day.
    (at ?c - city ?d - day)
    ;; A city was visited at some point during the given day.
    (spent ?c - city ?d - day)
    ;; Sequential relationship between two days.
    (next ?d1 - day ?d2 - day)
    ;; Direct flight connection between two cities.
    (conn ?c1 - city ?c2 - city)
  )

  ;; Staying in the same city for another day.
  (:action stay
    :parameters (?from - day ?to - day ?c - city)
    :precondition (and 
      (at ?c ?from) 
      (next ?from ?to)
    )
    :effect (and 
      (not (at ?c ?from)) 
      (at ?c ?to) 
      (spent ?c ?to)
    )
  )

  ;; Flying between cities on a specific day.
  ;; The travel day counts for both the origin city (departure) 
  ;; and the destination city (arrival).
  (:action fly
    :parameters (?from - day ?to - day ?c_from - city ?c_to - city)
    :precondition (and 
      (at ?c_from ?from) 
      (next ?from ?to) 
      (conn ?c_from ?c_to)
    )
    :effect (and 
      (not (at ?c_from ?from)) 
      (at ?c_to ?to) 
      (spent ?c_from ?to) 
      (spent ?c_to ?to)
    )
  )
)