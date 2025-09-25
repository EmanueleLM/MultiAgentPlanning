(define (domain multiagent-trip)
  (:requirements :strips :typing :fluents :numeric-fluents)
  (:types agent city)

  (:predicates
    (at ?ag - agent ?c - city)
    (visited ?c - city)
    (direct ?c1 - city ?c2 - city)
    (met-friend)
  )

  (:functions
    (day) ; current day, integer-valued
  )

  ;; Traveler's stay actions (distinct per agent: traveler_)
  ;; Porto stays (1..7)
  (:action traveler_stay_porto_1
    :parameters (?trav - agent ?c - city)
    :precondition (and (at ?trav porto) (<= (+ (day) 1) 16))
    :effect (and (increase (day) 1) (visited porto))
  )
  (:action traveler_stay_porto_2
    :parameters (?trav - agent ?c - city)
    :precondition (and (at ?trav porto) (<= (+ (day) 2) 16))
    :effect (and (increase (day) 2) (visited porto))
  )
  (:action traveler_stay_porto_3
    :parameters (?trav - agent ?c - city)
    :precondition (and (at ?trav porto) (<= (+ (day) 3) 16))
    :effect (and (increase (day) 3) (visited porto))
  )
  (:action traveler_stay_porto_4
    :parameters (?trav - agent ?c - city)
    :precondition (and (at ?trav porto) (<= (+ (day) 4) 16))
    :effect (and (increase (day) 4) (visited porto))
  )
  (:action traveler_stay_porto_5
    :parameters (?trav - agent ?c - city)
    :precondition (and (at ?trav porto) (<= (+ (day) 5) 16))
    :effect (and (increase (day) 5) (visited porto))
  )
  (:action traveler_stay_porto_6
    :parameters (?trav - agent ?c - city)
    :precondition (and (at ?trav porto) (<= (+ (day) 6) 16))
    :effect (and (increase (day) 6) (visited porto))
  )
  (:action traveler_stay_porto_7
    :parameters (?trav - agent ?c - city)
    :precondition (and (at ?trav porto) (<= (+ (day) 7) 16))
    :effect (and (increase (day) 7) (visited porto))
  )

  ;; Berlin stays (1..6)
  (:action traveler_stay_berlin_1
    :parameters (?trav - agent)
    :precondition (and (at ?trav berlin) (<= (+ (day) 1) 16))
    :effect (and (increase (day) 1) (visited berlin))
  )
  (:action traveler_stay_berlin_2
    :parameters (?trav - agent)
    :precondition (and (at ?trav berlin) (<= (+ (day) 2) 16))
    :effect (and (increase (day) 2) (visited berlin))
  )
  (:action traveler_stay_berlin_3
    :parameters (?trav - agent)
    :precondition (and (at ?trav berlin) (<= (+ (day) 3) 16))
    :effect (and (increase (day) 3) (visited berlin))
  )
  (:action traveler_stay_berlin_4
    :parameters (?trav - agent)
    :precondition (and (at ?trav berlin) (<= (+ (day) 4) 16))
    :effect (and (increase (day) 4) (visited berlin))
  )
  (:action traveler_stay_berlin_5
    :parameters (?trav - agent)
    :precondition (and (at ?trav berlin) (<= (+ (day) 5) 16))
    :effect (and (increase (day) 5) (visited berlin))
  )
  (:action traveler_stay_berlin_6
    :parameters (?trav - agent)
    :precondition (and (at ?trav berlin) (<= (+ (day) 6) 16))
    :effect (and (increase (day) 6) (visited berlin))
  )

  ;; Reykjavik stays (1..5)
  (:action traveler_stay_reyk_1
    :parameters (?trav - agent)
    :precondition (and (at ?trav reykjavik) (<= (+ (day) 1) 16))
    :effect (and (increase (day) 1) (visited reykjavik))
  )
  (:action traveler_stay_reyk_2
    :parameters (?trav - agent)
    :precondition (and (at ?trav reykjavik) (<= (+ (day) 2) 16))
    :effect (and (increase (day) 2) (visited reykjavik))
  )
  (:action traveler_stay_reyk_3
    :parameters (?trav - agent)
    :precondition (and (at ?trav reykjavik) (<= (+ (day) 3) 16))
    :effect (and (increase (day) 3) (visited reykjavik))
  )
  (:action traveler_stay_reyk_4
    :parameters (?trav - agent)
    :precondition (and (at ?trav reykjavik) (<= (+ (day) 4) 16))
    :effect (and (increase (day) 4) (visited reykjavik))
  )
  (:action traveler_stay_reyk_5
    :parameters (?trav - agent)
    :precondition (and (at ?trav reykjavik) (<= (+ (day) 5) 16))
    :effect (and (increase (day) 5) (visited reykjavik))
  )

  ;; Meeting action (traveler)
  (:action traveler_meet_friend_reyk
    :parameters (?trav - agent)
    :precondition (and (at ?trav reykjavik) (>= (day) 12) (<= (day) 16))
    :effect (met-friend)
  )

  ;; Flight actions provided by flights_agent (distinct action names)
  ;; Direct flights exist only for Porto <-> Berlin and Berlin <-> Reykjavik
  ;; Flights do not consume days (instantaneous in this model)
  (:action flights_agent_fly_porto_to_berlin
    :parameters (?trav - agent)
    :precondition (and (at ?trav porto) (direct porto berlin))
    :effect (and (not (at ?trav porto)) (at ?trav berlin) (visited berlin))
  )

  (:action flights_agent_fly_berlin_to_porto
    :parameters (?trav - agent)
    :precondition (and (at ?trav berlin) (direct berlin porto))
    :effect (and (not (at ?trav berlin)) (at ?trav porto) (visited porto))
  )

  (:action flights_agent_fly_berlin_to_reyk
    :parameters (?trav - agent)
    :precondition (and (at ?trav berlin) (direct berlin reykjavik))
    :effect (and (not (at ?trav berlin)) (at ?trav reykjavik) (visited reykjavik))
  )

  (:action flights_agent_fly_reyk_to_berlin
    :parameters (?trav - agent)
    :precondition (and (at ?trav reykjavik) (direct reykjavik berlin))
    :effect (and (not (at ?trav reykjavik)) (at ?trav berlin) (visited berlin))
  )
)