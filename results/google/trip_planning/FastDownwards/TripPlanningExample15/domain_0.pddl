(define (domain multiagent-trip)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)           ; traveler is in city ?c on day ?d
    (present ?d - day)               ; day ?d is "occupied" in itinerary (ensures day progression)
    (next ?d1 - day ?d2 - day)       ; temporal successor relation between days
    (flight ?from - city ?to - city) ; direct flight exists (static)
    (visited ?c - city)              ; city was visited at least once
    (desired-stay ?c - city ?n)      ; agent-declared desired stay (kept as informational facts)
    (wedding ?c - city ?d - day)     ; wedding event occurs in city ?c on day ?d (static)
  )

  ; -----------------------------
  ; Actions belonging to berlin_agent
  ; -----------------------------
  (:action berlin_agent_stay_in_berlin
    :parameters (?d - day ?d2 - day ?from - city)
    :precondition (and (at berlin ?d) (next ?d ?d2))
    :effect (and (at berlin ?d2) (present ?d2) (visited berlin))
  )

  (:action berlin_agent_fly_berlin_to_porto
    :parameters (?d - day ?d2 - day)
    :precondition (and (at berlin ?d) (flight berlin porto) (next ?d ?d2))
    :effect (and (at porto ?d2) (present ?d2) (visited porto))
  )

  (:action berlin_agent_fly_berlin_to_krakow
    :parameters (?d - day ?d2 - day)
    :precondition (and (at berlin ?d) (flight berlin krakow) (next ?d ?d2))
    :effect (and (at krakow ?d2) (present ?d2) (visited krakow))
  )

  ; -----------------------------
  ; Actions belonging to porto_agent
  ; -----------------------------
  (:action porto_agent_stay_in_porto
    :parameters (?d - day ?d2 - day)
    :precondition (and (at porto ?d) (next ?d ?d2))
    :effect (and (at porto ?d2) (present ?d2) (visited porto))
  )

  (:action porto_agent_fly_porto_to_berlin
    :parameters (?d - day ?d2 - day)
    :precondition (and (at porto ?d) (flight porto berlin) (next ?d ?d2))
    :effect (and (at berlin ?d2) (present ?d2) (visited berlin))
  )

  ; -----------------------------
  ; Actions belonging to krakow_agent
  ; -----------------------------
  (:action krakow_agent_stay_in_krakow
    :parameters (?d - day ?d2 - day)
    :precondition (and (at krakow ?d) (next ?d ?d2))
    :effect (and (at krakow ?d2) (present ?d2) (visited krakow))
  )

  (:action krakow_agent_fly_krakow_to_berlin
    :parameters (?d - day ?d2 - day)
    :precondition (and (at krakow ?d) (flight krakow berlin) (next ?d ?d2))
    :effect (and (at berlin ?d2) (present ?d2) (visited berlin))
  )

)