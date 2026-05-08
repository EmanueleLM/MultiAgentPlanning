(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city day count
  )
  (:predicates
    (at ?c - city ?d - day)
    (visited ?c - city ?d - day)
    (count ?c - city ?n - count)
    (next ?d1 - day ?d2 - day)
    (flight ?c1 - city ?c2 - city)
    (succ ?n1 - count ?n2 - count)
  )

  ;; The stay action represents staying in a city for a full day.
  ;; It increments the stay count for that city and marks it as visited on that day.
  (:action stay
    :parameters (?c - city ?d - day ?dn - day ?n - count ?nn - count)
    :precondition (and 
      (at ?c ?d) 
      (next ?d ?dn) 
      (count ?c ?n) 
      (succ ?n ?nn)
    )
    :effect (and 
      (not (at ?c ?d)) 
      (at ?c ?dn) 
      (not (count ?c ?n)) 
      (count ?c ?nn) 
      (visited ?c ?d)
    )
  )

  ;; The fly action represents traveling between cities on a specific day.
  ;; In this model, a travel day counts toward the stay requirement of both the origin 
  ;; and the destination city (reflecting the 3+3+4=10 days in an 8-day trip logic).
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dn - day ?nf - count ?nnf - count ?nt - count ?nnt - count)
    :precondition (and 
      (at ?from ?d) 
      (next ?d ?dn) 
      (flight ?from ?to) 
      (count ?from ?nf) 
      (succ ?nf ?nnf) 
      (count ?to ?nt) 
      (succ ?nt ?nnt)
    )
    :effect (and 
      (not (at ?from ?d)) 
      (at ?to ?dn) 
      (not (count ?from ?nf)) 
      (count ?from ?nnf) 
      (not (count ?to ?nt)) 
      (count ?to ?nnt) 
      (visited ?from ?d) 
      (visited ?to ?d)
    )
  )
)