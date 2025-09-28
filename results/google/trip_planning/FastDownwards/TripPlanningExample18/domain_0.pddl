(define (domain travel-multicity)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types city)
  (:predicates
    (at ?c - city)
    (met)
  )
  (:functions
    (days)                      ; elapsed trip days, integer
    (total-days)                ; target total (11)
    (rem-amsterdam)             ; remaining one-day stays to perform in Amsterdam
    (rem-vilnius)               ; remaining one-day stays to perform in Vilnius
    (rem-bucharest)             ; remaining one-day stays to perform in Bucharest
  )

  ;; Direct flight actions (only those explicitly provided)
  (:action fly_amsterdam_to_bucharest
    :parameters ()
    :precondition (and (at amsterdam))
    :effect (and (not (at amsterdam)) (at bucharest))
  )

  (:action fly_bucharest_to_amsterdam
    :parameters ()
    :precondition (and (at bucharest))
    :effect (and (not (at bucharest)) (at amsterdam))
  )

  (:action fly_vilnius_to_amsterdam
    :parameters ()
    :precondition (and (at vilnius))
    :effect (and (not (at vilnius)) (at amsterdam))
  )

  (:action fly_amsterdam_to_vilnius
    :parameters ()
    :precondition (and (at amsterdam))
    :effect (and (not (at amsterdam)) (at vilnius))
  )

  ;; One-day stay actions for each city. Each decreases the remaining count for that city by 1
  ;; and increases the global day counter by 1. They are only applicable if doing the day will
  ;; not exceed the total trip days.
  (:action stay_one_day_amsterdam
    :parameters ()
    :precondition (and (at amsterdam) (> (rem-amsterdam) 0) (<= (+ (days) 1) (total-days)))
    :effect (and
              (increase (days) 1)
              (decrease (rem-amsterdam) 1)
            )
  )

  (:action stay_one_day_vilnius
    :parameters ()
    :precondition (and (at vilnius) (> (rem-vilnius) 0) (<= (+ (days) 1) (total-days)))
    :effect (and
              (increase (days) 1)
              (decrease (rem-vilnius) 1)
            )
  )

  (:action stay_one_day_bucharest
    :parameters ()
    :precondition (and (at bucharest) (> (rem-bucharest) 0) (<= (+ (days) 1) (total-days)))
    :effect (and
              (increase (days) 1)
              (decrease (rem-bucharest) 1)
            )
  )

  ;; Meeting action in Bucharest. Must be performed while at Bucharest and when days is in [6,11].
  (:action meet_friends_in_bucharest
    :parameters ()
    :precondition (and (at bucharest) (not (met)) (>= (days) 6) (<= (days) 11))
    :effect (and (met))
  )
)