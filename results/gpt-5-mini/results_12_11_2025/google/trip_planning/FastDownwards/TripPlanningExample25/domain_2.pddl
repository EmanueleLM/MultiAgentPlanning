(define (domain itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (next ?d1 - day ?d2 - day)
    (today ?d - day)
    (flight ?c1 - city ?c2 - city)
    (at-day ?d - day ?c - city)
  )

  ;; Choose the city for the initial day.
  ;; Disallow assigning a city to a day that already has any city assigned
  ;; by checking negative preconditions for every city in the domain.
  (:action choose-start
    :parameters (?d - day ?c - city)
    :precondition (and
                    (today ?d)
                    (not (at-day ?d valencia))
                    (not (at-day ?d lyon))
                    (not (at-day ?d split))
                  )
    :effect (at-day ?d ?c)
  )

  ;; Stay in the same city from one day to the next.
  ;; Requires that the source day has the city and the target day has no assignment yet.
  (:action stay-same
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
                    (next ?d ?d2)
                    (at-day ?d ?c)
                    (not (at-day ?d2 valencia))
                    (not (at-day ?d2 lyon))
                    (not (at-day ?d2 split))
                  )
    :effect (at-day ?d2 ?c)
  )

  ;; Move between different cities on successive days; allowed only when a direct flight exists.
  ;; Also require the target day has no assignment yet.
  (:action move
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
                    (next ?d ?d2)
                    (at-day ?d ?from)
                    (flight ?from ?to)
                    (not (at-day ?d2 valencia))
                    (not (at-day ?d2 lyon))
                    (not (at-day ?d2 split))
                  )
    :effect (at-day ?d2 ?to)
  )
)