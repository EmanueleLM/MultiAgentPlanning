(define (domain integrated-trip-domain)
  (:requirements :strips :typing :negative-preconditions :equality :adl :action-costs)
  (:types city day num)

  (:predicates
    (direct ?from - city ?to - city)
    (at ?city - city ?day - day)
    (today ?d - day)
    (next ?d - day ?d2 - day)
    (attended1)
    (attended5)
    (counted ?d - day)
    (spent-cph ?n - num)
    (spent-vie ?n - num)
    (spent-lys ?n - num)
    (nextnum ?n - num ?n2 - num)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (direct ?from ?to) (at ?from ?d) (next ?d ?d2))
    :effect (and
              (not (at ?from ?d))
              (at ?to ?d2)
            )
  )

  (:action stay
    :parameters (?city - city ?d - day ?d2 - day)
    :precondition (and (at ?city ?d) (next ?d ?d2))
    :effect (and
              (not (at ?city ?d))
              (at ?city ?d2)
            )
  )

  (:action advance-day-copenhagen
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (today ?d1) (next ?d1 ?d2) (at copenhagen ?d1))
    :effect (and
              (not (today ?d1)) (today ?d2)
              (not (at copenhagen ?d1)) (at copenhagen ?d2)
            )
  )

  (:action advance-day-vienna
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (today ?d1) (next ?d1 ?d2) (at vienna ?d1))
    :effect (and
              (not (today ?d1)) (today ?d2)
              (not (at vienna ?d1)) (at vienna ?d2)
            )
  )

  (:action advance-day-lyon
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (today ?d1) (next ?d1 ?d2) (at lyon ?d1))
    :effect (and
              (not (today ?d1)) (today ?d2)
              (not (at lyon ?d1)) (at lyon ?d2)
            )
  )

  (:action fly-cph-to-vie-traveler
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (today ?d1) (next ?d1 ?d2) (at copenhagen ?d1) (direct copenhagen vienna))
    :effect (and
              (not (today ?d1)) (today ?d2)
              (not (at copenhagen ?d1)) (at vienna ?d2)
            )
  )

  (:action fly-vie-to-cph-traveler
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (today ?d1) (next ?d1 ?d2) (at vienna ?d1) (direct vienna copenhagen))
    :effect (and
              (not (today ?d1)) (today ?d2)
              (not (at vienna ?d1)) (at copenhagen ?d2)
            )
  )

  (:action fly-vie-to-lyon-traveler
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (today ?d1) (next ?d1 ?d2) (at vienna ?d1) (direct vienna lyon))
    :effect (and
              (not (today ?d1)) (today ?d2)
              (not (at vienna ?d1)) (at lyon ?d2)
            )
  )

  (:action fly-lyon-to-vie-traveler
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (today ?d1) (next ?d1 ?d2) (at lyon ?d1) (direct lyon vienna))
    :effect (and
              (not (today ?d1)) (today ?d2)
              (not (at lyon ?d1)) (at vienna ?d2)
            )
  )

  (:action mark-spent-copenhagen
    :parameters (?d - day ?n - num ?n2 - num)
    :precondition (and (today ?d) (at copenhagen ?d) (not (counted ?d)) (spent-cph ?n) (nextnum ?n ?n2))
    :effect (and (not (spent-cph ?n)) (spent-cph ?n2) (counted ?d))
  )

  (:action mark-spent-vienna
    :parameters (?d - day ?n - num ?n2 - num)
    :precondition (and (today ?d) (at vienna ?d) (not (counted ?d)) (spent-vie ?n) (nextnum ?n ?n2))
    :effect (and (not (spent-vie ?n)) (spent-vie ?n2) (counted ?d))
  )

  (:action mark-spent-lyon
    :parameters (?d - day ?n - num ?n2 - num)
    :precondition (and (today ?d) (at lyon ?d) (not (counted ?d)) (spent-lys ?n) (nextnum ?n ?n2))
    :effect (and (not (spent-lys ?n)) (spent-lys ?n2) (counted ?d))
  )

  (:action attend-conference-day1
    :parameters ()
    :precondition (and (today day1) (at copenhagen day1))
    :effect (attended1)
  )

  (:action attend-conference-day5
    :parameters ()
    :precondition (and (today day5) (at copenhagen day5))
    :effect (attended5)
  )
)