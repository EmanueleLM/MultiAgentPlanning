(define (domain travel-integrated)
  (:requirements :strips :typing :fluents)
  (:types city)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (checked ?from - city ?to - city)
  )

  (:functions
    (days-used)               ; total days consumed so far
    (total-days)              ; total days planned (constant)
    (days-in ?c - city)       ; days spent in a given city
    (desired ?c - city)       ; desired (maximum) days for a given city (from traveler private info)
  )

  ; Traveler actions (prefix traveler_)
  (:action traveler_fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct ?from ?to))
    :effect (and (not (at ?from)) (at ?to))
  )

  (:action traveler_stay
    :parameters (?c - city)
    :precondition (and
                    (at ?c)
                    (<= (+ (days-used) 1) (total-days))      ; do not exceed total days
                    (< (days-in ?c) (desired ?c))           ; respect the desired-per-city cap
                  )
    :effect (and
              (increase (days-used) 1)
              (increase (days-in ?c) 1)
            )
  )

  ; Flight checker agent actions (prefix flight_checker_)
  (:action flight_checker_check_direct
    :parameters (?from - city ?to - city)
    :precondition (direct ?from ?to)
    :effect (checked ?from ?to)
  )
)