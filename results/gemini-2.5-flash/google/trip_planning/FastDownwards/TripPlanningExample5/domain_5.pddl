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
    (less_than ?n1 ?n2 - duration_count) ; n1 < n2
    (ge_than ?n1 ?n2 - duration_count)   ; n1 >= n2
    (city_current_stay_duration ?c - city ?n - duration_count) ; Current consecutive days in a city
    (city_preferred_duration ?c - city ?n - duration_count)    ; Static fact for preferred days
    (visited_city_at_least_once ?c - city)
  )

  (:functions
    (total_cost)
  )

  ;; Action to stay in the current city, while current consecutive stay is strictly less than preferred
  (:action stay_below_preferred
    :parameters (?c - city ?d_current ?d_next - day ?n_current ?n_next ?n_preferred - duration_count)
    :precondition (and
                    (current_day ?d_current)
                    (next_day ?d_current ?d_next)
                    (at ?c)
                    (city_current_stay_duration ?c ?n_current)
                    (succeeds ?n_current ?n_next)
                    (city_preferred_duration ?c ?n_preferred)
                    (less_than ?n_current ?n_preferred) ; ?n_current is strictly less than ?n_preferred
                    ; Block if in Dubrovnik on Day 12 and conference not attended
                    (not (and (current_day day12) (= ?c dubrovnik) (not (conference_day_12_attended))))
                    ; Block if in Dubrovnik on Day 16 and conference not attended
                    (not (and (current_day day16) (= ?c dubrovnik) (not (conference_day_16_attended))))
                  )
    :effect (and
              (not (current_day ?d_current))
              (current_day ?d_next)
              (not (city_current_stay_duration ?c ?n_current))
              (city_current_stay_duration ?c ?n_next)
              (increase (total_cost) 0) ; No cost for staying below preferred duration
            )
  )

  ;; Action to stay in the current city, while current consecutive stay is at or above preferred duration
  (:action stay_at_or_above_preferred
    :parameters (?c - city ?d_current ?d_next - day ?n_current ?n_next ?n_preferred - duration_count)
    :precondition (and
                    (current_day ?d_current)
                    (next_day ?d_current ?d_next)
                    (at ?c)
                    (city_current_stay_duration ?c ?n_current)
                    (succeeds ?n_current ?n_next)
                    (city_preferred_duration ?c ?n_preferred)
                    (ge_than ?n_current ?n_preferred) ; ?n_current is greater than or equal to ?n_preferred
                    ; Block if in Dubrovnik on Day 12 and conference not attended
                    (not (and (current_day day12) (= ?c dubrovnik) (not (conference_day_12_attended))))
                    ; Block if in Dubrovnik on Day 16 and conference not attended
                    (not (and (current_day day16) (= ?c dubrovnik) (not (conference_day_16_attended))))
                  )
    :effect (and
              (not (current_day ?d_current))
              (current_day ?d_next)
              (not (city_current_stay_duration ?c ?n_current))
              (city_current_stay_duration ?c ?n_next)
              (increase (total_cost) 1) ; Penalty for staying at or exceeding preferred duration
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
                    (not (and (current_day day12) (= ?from dubrovnik) (not (conference_day_12_attended))))
                    ; Block if travelling from Dubrovnik on Day 16 and conference not attended
                    (not (and (current_day day16) (= ?from dubrovnik) (not (conference_day_16_attended))))
                  )
    :effect (and
              (not (at ?from))
              (at ?to)
              (not (current_day ?d_current))
              (current_day ?d_next)
              (not (city_current_stay_duration ?from ?n_from_curr))
              (city_current_stay_duration ?from d0) ; Reset stay duration for the city just left
              (city_current_stay_duration ?to d1) ; Arriving in new city counts as first day
              (visited_city_at_least_once ?to)
              (increase (total_cost) 1) ; Cost for travel
            )
  )

  ;; Specialized action for staying in Dubrovnik and attending conference on Day 12 (below preferred duration)
  (:action stay_at_dubrovnik_conference_below_preferred_day12
    :parameters (?d_current - day ?d_next - day ?n_current ?n_next ?n_preferred - duration_count)
    :precondition (and
                    (current_day day12)
                    (next_day day12 ?d_next)
                    (at dubrovnik)
                    (not (conference_day_12_attended))
                    (city_current_stay_duration dubrovnik ?n_current)
                    (succeeds ?n_current ?n_next)
                    (city_preferred_duration dubrovnik ?n_preferred)
                    (less_than ?n_current ?n_preferred) ; below preferred
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

  ;; Specialized action for staying in Dubrovnik and attending conference on Day 12 (at or above preferred duration)
  (:action stay_at_dubrovnik_conference_at_or_above_preferred_day12
    :parameters (?d_current - day ?d_next - day ?n_current ?n_next ?n_preferred - duration_count)
    :precondition (and
                    (current_day day12)
                    (next_day day12 ?d_next)
                    (at dubrovnik)
                    (not (conference_day_12_attended))
                    (city_current_stay_duration dubrovnik ?n_current)
                    (succeeds ?n_current ?n_next)
                    (city_preferred_duration dubrovnik ?n_preferred)
                    (ge_than ?n_current ?n_preferred) ; at or above preferred
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

  ;; Specialized action for staying in Dubrovnik and attending conference on Day 16 (below preferred duration)
  (:action stay_at_dubrovnik_conference_below_preferred_day16
    :parameters (?d_current - day ?d_next - day ?n_current ?n_next ?n_preferred - duration_count)
    :precondition (and
                    (current_day day16)
                    (next_day day16 ?d_next)
                    (at dubrovnik)
                    (not (conference_day_16_attended))
                    (city_current_stay_duration dubrovnik ?n_current)
                    (succeeds ?n_current ?n_next)
                    (city_preferred_duration dubrovnik ?n_preferred)
                    (less_than ?n_current ?n_preferred) ; below preferred
                  )
    :effect (and
              (not (current_day day16))
              (current_day ?d_next)
              (not (city_current_stay_duration dubrovnik ?n_current))
              (city_current_stay_duration dubrovnik ?n_next)
              (conference_day_16_attended)
              (increase (total_cost) 0)
            )
  )

  ;; Specialized action for staying in Dubrovnik and attending conference on Day 16 (at or above preferred duration)
  (:action stay_at_dubrovnik_conference_at_or_above_preferred_day16
    :parameters (?d_current - day ?d_next - day ?n_current ?n_next ?n_preferred - duration_count)
    :precondition (and
                    (current_day day16)
                    (next_day day16 ?d_next)
                    (at dubrovnik)
                    (not (conference_day_16_attended))
                    (city_current_stay_duration dubrovnik ?n_current)
                    (succeeds ?n_current ?n_next)
                    (city_preferred_duration dubrovnik ?n_preferred)
                    (ge_than ?n_current ?n_preferred) ; at or above preferred
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