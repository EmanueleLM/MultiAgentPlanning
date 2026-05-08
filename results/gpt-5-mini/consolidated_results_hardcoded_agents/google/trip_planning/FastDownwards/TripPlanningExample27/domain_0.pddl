(define (domain travel)
  (:requirements :strips)
  (:predicates
    ; day identifiers
    (day ?d)
    ; immediate successor relation between days (discrete time)
    (next ?d1 ?d2)
    ; direct flight availability between cities (only allowed direct links)
    (direct ?from ?to)
    ; traveller is in a city on a given day
    (at ?city ?day)
  )

  ;; Stay in the same city from one day to the next
  (:action stay
    :parameters (?city ?d1 ?d2)
    :precondition (and (at ?city ?d1) (next ?d1 ?d2))
    :effect (and (at ?city ?d2))
  )

  ;; Take a direct flight from one city to another between consecutive days.
  ;; Direct flights are allowed only where (direct ?from ?to) holds in the problem file.
  (:action fly
    :parameters (?from ?to ?d1 ?d2)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (direct ?from ?to))
    :effect (and (at ?to ?d2))
  )
)