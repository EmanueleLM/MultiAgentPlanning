(define (domain jack_of_all_trades_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?d - day ?c - city)
    (assigned ?d - day)
    (connected ?c1 - city ?c2 - city)
    (next ?d1 - day ?d2 - day)
  )

  ;; assign the city for day1
  (:action assign_day1
    :parameters (?c - city)
    :precondition (and (not (assigned day1)))
    :effect (and (at day1 ?c) (assigned day1))
  )

  ;; stay in the same city from one day to its successor
  (:action stay_to_next
    :parameters (?dt - day ?dn - day ?c - city)
    :precondition (and (next ?dt ?dn) (at ?dt ?c) (not (assigned ?dn)))
    :effect (and (at ?dn ?c) (assigned ?dn))
  )

  ;; take a direct flight from one city on day ?dt to another city on successor day ?dn
  (:action fly_to_next
    :parameters (?dt - day ?dn - day ?cf - city ?ct - city)
    :precondition (and (next ?dt ?dn) (at ?dt ?cf) (connected ?cf ?ct) (not (assigned ?dn)))
    :effect (and (at ?dn ?ct) (assigned ?dn))
  )
)