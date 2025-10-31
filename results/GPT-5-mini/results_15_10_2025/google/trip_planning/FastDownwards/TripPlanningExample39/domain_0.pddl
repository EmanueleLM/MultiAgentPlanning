(define (domain trip-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (at ?d - day ?c - city)        ; traveler is in ?c on day ?d (morning of that day)
    (next ?d1 - day ?d2 - day)     ; temporal successor: ?d2 is the day after ?d1
    (flight ?c1 - city ?c2 - city) ; direct flight exists from ?c1 to ?c2
  )

  ;; Stay in the same city for the next day
  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and (at ?d1 ?c) (next ?d1 ?d2))
    :effect (and (not (at ?d1 ?c)) (at ?d2 ?c))
  )

  ;; Take a direct flight from one city to another between consecutive days
  ;; Only enabled when a direct flight (flight ?from ?to) fact exists in the problem.
  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and (at ?d1 ?from) (flight ?from ?to) (next ?d1 ?d2))
    :effect (and (not (at ?d1 ?from)) (at ?d2 ?to))
  )
)