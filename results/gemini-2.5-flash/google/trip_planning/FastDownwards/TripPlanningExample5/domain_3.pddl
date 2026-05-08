(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    city - object
    day - object
    duration_count - object
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (at ?c - city)
    (has_flight ?c1 ?c2 - city)
    (conference_day_12_attended)
    (conference_day_16_attended)
    (succeeds ?n1 ?n2 - duration_count) ; n2 is n1 + 1
    (city_current_stay_duration ?c - city ?n - duration_count) ; Current consecutive days in a city
    (city_preferred_duration ?c - city ?n - duration_count)    ; Static fact for preferred days
    (visited_city_at_least_once ?c - city)
  )

  (:functions
    (total_cost)
  )

  ;; Action to stay in the current city, within or at preferred duration
  ;; This action is blocked if it's a conference day in Dubrovnik and the conference hasn't been attended.
  (:action stay_preferential
    :parameters (?c - city ?d_current ?d_next - day ?n_current ?n_next ?n_preferred - duration_count)
    :precondition (and
                    (current_day ?d_current)
                    (next_day ?d_current ?d_next)
                    (at ?c)
                    (city_current_stay_duration ?c ?n_current)
                    (succeeds ?n_current ?n_next)
                    (city_preferred_duration ?c ?n_preferred)
                    (not (succeeds ?n_preferred ?n_current)) ; ?n_current is less than or equal to ?n_preferred
                    ; Block if in Dubrovnik on Day 12 and conference not attended
                    (not (and (current_day day12) (at ?c) (= ?c dubrovnik) (not (conference_day_12_attended))))
                    ; Block if in Dubrovnik on Day 16 and conference not attended
                    (not (and (current_day day16) (at ?c) (= ?c dubrovnik) (not (conference_day_16_attended))))
                  )
    :effect (and
              (not (current_day ?d_current))
              (current_day ?d_next)
              (not (city_current_stay_duration ?c ?n_current))
              (city_current_stay_duration ?c ?n_next)
              (increase (total_cost) 0) ; No cost for staying within or at preferred duration
            )
  )

  ;; Action to stay in the current city, exceeding preferred duration
  ;; This action is blocked if it's a conference day in Dubrovnik and the conference hasn't been attended.
  (:action stay_extended
    :parameters (?c - city ?d_current ?d_next - day ?n_current ?n_next ?n_preferred - duration_count)
    :precondition (and
                    (current_day ?d_current)
                    (next_day ?d_current ?d_next)
                    (at ?c)
                    (city_current_stay_duration ?c ?n_current)
                    (succeeds ?n_current ?n_next)
                    (city_preferred_duration ?c ?n_preferred)
                    (succeeds ?n_preferred ?n_current) ; ?n_current is strictly greater than ?n_preferred
                    ; Block if in Dubrovnik on Day 12 and conference not attended
                    (not (and (current_day day12) (at ?c) (= ?c dubrovnik) (not (conference_day_12_attended))))
                    ; Block if in Dubrovnik on Day 16 and conference not attended
                    (not (and (current_day day16) (at ?c) (= ?c dubrovnik) (not (conference_day_16_attended))))
                  )
    :effect (and
              (not (current_day ?d_current))
              (current_day ?d_next)
              (not (city_current_stay_duration ?c ?n_current))
              (city_current_stay_duration ?c ?n_next)
              (increase (total_cost) 1) ; Penalty for exceeding preferred duration
            )
  )

  ;; Action to travel from one city to another
  ;; This action is blocked if travelling from Dubrovnik on a conference day and conference not attended.
  (:action travel
    :parameters (?from ?to - city ?d_current ?d_next - day ?n_from_curr - duration_count)
    :precondition (and
                    (current_day ?d_current)
                    (next_day ?d_current ?d_next)
                    (at ?from)
                    (has_flight ?from ?to)
                    (not (at ?to)) ; Must not already be at destination
                    (city_current_stay_duration ?from ?n_from_curr) ; Check duration in current city
                    (city_current_stay_duration ?to d0) ; Ensure target city currently has 0 days stayed
                    ; Block if travelling from Dubrovnik on Day 12 and conference not attended
                    (not (and (current_day day12) (at ?from) (= ?from dubrovnik) (not (conference_day_12_attended))))
                    ; Block if travelling from Dubrovnik on Day 16 and conference not attended
                    (not (and (current_day day16) (at ?from) (= ?from dubrovnik) (not (conference_day_16_attended))))
                  )
    :effect (and
              (not (at ?from))
              (at ?to)
              (not (current_day ?d_current))
              (current_day ?d_next)
              (not (city_current_stay_duration ?from ?n_from_curr))
              (city_current_stay_duration ?from d0) ; Reset stay duration for the city just left
              ;(not (city_current_stay_duration ?to d0)) ; Redundant, city_current_stay_duration ?to d1 replaces it
              (city_current_stay_duration ?to d1) ; Arriving in new city counts as first day
              (visited_city_at_least_once ?to)
              (increase (total_cost) 0.5) ; Small cost for travel
            )
  )

  ;; Specialized action for staying in Dubrovnik and attending conference on Day 12 (preferential duration)
  (:action stay_at_dubrovnik_conference_preferential_day12
    :parameters (?d_current - day ?d_next - day ?n_current ?n_next ?n_preferred - duration_count)
    :precondition (and
                    (current_day day12)
                    (next_day day12 ?d_next)
                    (at dubrovnik)
                    (not (conference_day_12_attended))
                    (city_current_stay_duration dubrovnik ?n_current)
                    (succeeds ?n_current ?n_next)
                    (city_preferred_duration dubrovnik ?n_preferred)
                    (not (succeeds ?n_preferred ?n_current)) ; within or at preferred
                  )
    :effect (and
              (not (current_day day12))
              (current_day ?d_next)
              (not (city_current_stay_duration dubrovnik ?n_current))
              (city_current_stay_duration dubrovnik ?n_next)
              (conference_day_12_attended)
              (increase (total_cost) 0)
            )
  )

  ;; Specialized action for staying in Dubrovnik and attending conference on Day 12 (extended duration)
  (:action stay_at_dubrovnik_conference_extended_day12
    :parameters (?d_current - day ?d_next - day ?n_current ?n_next ?n_preferred - duration_count)
    :precondition (and
                    (current_day day12)
                    (next_day day12 ?d_next)
                    (at dubrovnik)
                    (not (conference_day_12_attended))
                    (city_current_stay_duration dubrovnik ?n_current)
                    (succeeds ?n_current ?n_next)
                    (city_preferred_duration dubrovnik ?n_preferred)
                    (succeeds ?n_preferred ?n_current) ; exceeding preferred
                  )
    :effect (and
              (not (current_day day12))
              (current_day ?d_next)
              (not (city_current_stay_duration dubrovnik ?n_current))
              (city_current_stay_duration dubrovnik ?n_next)
              (conference_day_12_attended)
              (increase (total_cost) 1)
            )
  )

  ;; Specialized action for staying in Dubrovnik and attending conference on Day 16 (preferential duration)
  (:action stay_at_dubrovnik_conference_preferential_day16
    :parameters (?d_current - day ?d_next - day ?n_current ?n_next ?n_preferred - duration_count)
    :precondition (and
                    (current_day day16)
                    (next_day day16 ?d_next) ; This won't exist but is okay as day16 is the end day.
                    (at dubrovnik)
                    (not (conference_day_16_attended))
                    (city_current_stay_duration dubrovnik ?n_current)
                    (succeeds ?n_current ?n_next)
                    (city_preferred_duration dubrovnik ?n_preferred)
                    (not (succeeds ?n_preferred ?n_current)) ; within or at preferred
                  )
    :effect (and
              (not (current_day day16))
              (current_day ?d_next) ; This will remove day16 and make day17 current, effectively ending the trip.
              (not (city_current_stay_duration dubrovnik ?n_current))
              (city_current_stay_duration dubrovnik ?n_next)
              (conference_day_16_attended)
              (increase (total_cost) 0)
            )
  )

  ;; Specialized action for staying in Dubrovnik and attending conference on Day 16 (extended duration)
  (:action stay_at_dubrovnik_conference_extended_day16
    :parameters (?d_current - day ?d_next - day ?n_current ?n_next ?n_preferred - duration_count)
    :precondition (and
                    (current_day day16)
                    (next_day day16 ?d_next)
                    (at dubrovnik)
                    (not (conference_day_16_attended))
                    (city_current_stay_duration dubrovnik ?n_current)
                    (succeeds ?n_current ?n_next)
                    (city_preferred_duration dubrovnik ?n_preferred)
                    (succeeds ?n_preferred ?n_current) ; exceeding preferred
                  )
    :effect (and
              (not (current_day day16))
              (current_day ?d_next)
              (not (city_current_stay_duration dubrovnik ?n_current))
              (city_current_stay_duration dubrovnik ?n_next)
              (conference_day_16_attended)
              (increase (total_cost) 1)
            )
  )
)