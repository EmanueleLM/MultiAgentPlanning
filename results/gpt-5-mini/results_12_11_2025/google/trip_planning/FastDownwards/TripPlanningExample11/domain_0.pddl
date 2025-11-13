(define (domain travel-days)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city)                       ; current city occupancy (unique)
    (current_day ?d - day)               ; which day is current
    (next ?d - day ?d2 - day)            ; successor relation on days
    (direct ?c - city ?c2 - city)        ; direct flight edge
    (need ?d - day ?c - city)            ; required city for a given day
    (satisfied ?d - day)                 ; day requirement satisfied
  )

  ;; Mark the current day as satisfied when at the required city.
  (:action mark
    :parameters (?d - day ?c - city)
    :precondition (and
                    (current_day ?d)
                    (at ?c)
                    (need ?d ?c)
                    (not (satisfied ?d))
                   )
    :effect (and
              (satisfied ?d)
             )
  )

  ;; Stay in the same city and advance to the next day.
  ;; Advancing is allowed only after the current day has been satisfied.
  (:action stay
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
                    (current_day ?d)
                    (next ?d ?d2)
                    (at ?c)
                    (satisfied ?d)
                   )
    :effect (and
              (not (current_day ?d))
              (current_day ?d2)
             )
  )

  ;; Fly via a direct flight to a different city and advance to the next day.
  ;; Flying is allowed only after the current day has been satisfied and only
  ;; when a direct edge exists between the two cities.
  (:action fly
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
                    (current_day ?d)
                    (next ?d ?d2)
                    (at ?from)
                    (direct ?from ?to)
                    (satisfied ?d)
                   )
    :effect (and
              (not (current_day ?d))
              (current_day ?d2)
              (not (at ?from))
              (at ?to)
             )
  )
)