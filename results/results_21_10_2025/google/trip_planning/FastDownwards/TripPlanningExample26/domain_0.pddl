(define (domain travel-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)             ; at city on a specific day
    (occupied ?d - day)                ; indicates the day has been assigned/occupied
    (day-next ?d1 - day ?d2 - day)     ; temporal successor relation between days
    (flight ?from - city ?to - city)   ; direct flight availability between cities
  )

  ;; Actions to "stay/occupy" the next calendar day in a specific city
  (:action porto_visit
    :parameters (?dprev - day ?d - day)
    :precondition (and (at porto ?dprev) (day-next ?dprev ?d) (not (occupied ?d)))
    :effect (and (at porto ?d) (occupied ?d))
  )

  (:action berlin_visit
    :parameters (?dprev - day ?d - day)
    :precondition (and (at berlin ?dprev) (day-next ?dprev ?d) (not (occupied ?d)))
    :effect (and (at berlin ?d) (occupied ?d))
  )

  (:action reykjavik_visit
    :parameters (?dprev - day ?d - day)
    :precondition (and (at reykjavik ?dprev) (day-next ?dprev ?d) (not (occupied ?d)))
    :effect (and (at reykjavik ?d) (occupied ?d))
  )

  ;; Actions to travel along allowed direct flights (one-day travel, arriving counts as occupancy on arrival day)
  (:action porto_to_berlin
    :parameters (?dprev - day ?d - day)
    :precondition (and (at porto ?dprev) (day-next ?dprev ?d) (not (occupied ?d)) (flight porto berlin))
    :effect (and (at berlin ?d) (occupied ?d))
  )

  (:action berlin_to_porto
    :parameters (?dprev - day ?d - day)
    :precondition (and (at berlin ?dprev) (day-next ?dprev ?d) (not (occupied ?d)) (flight berlin porto))
    :effect (and (at porto ?d) (occupied ?d))
  )

  (:action berlin_to_reykjavik
    :parameters (?dprev - day ?d - day)
    :precondition (and (at berlin ?dprev) (day-next ?dprev ?d) (not (occupied ?d)) (flight berlin reykjavik))
    :effect (and (at reykjavik ?d) (occupied ?d))
  )

  (:action reykjavik_to_berlin
    :parameters (?dprev - day ?d - day)
    :precondition (and (at reykjavik ?dprev) (day-next ?dprev ?d) (not (occupied ?d)) (flight reykjavik berlin))
    :effect (and (at berlin ?d) (occupied ?d))
  )
)