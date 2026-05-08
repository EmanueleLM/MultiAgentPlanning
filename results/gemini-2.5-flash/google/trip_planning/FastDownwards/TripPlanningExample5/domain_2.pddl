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
  (action stay_preferential
    :parameters (?c - city ?d_current ?d_next - day ?n_current ?n_next ?n_preferred - duration_count)
    :precondition (and
                    (current_day ?d_current)
                    (next_day ?d_current ?d_next)
                    (at ?c)
                    (city_current_stay_duration ?c ?n_current)
                    (succeeds ?n_current ?n_next)
                    (city_preferred_duration ?c ?n_preferred)
                    (not (succeeds ?n_preferred ?n_current)) ; ?n_current is less than or equal to ?n_preferred
                    (or (not (current_day day12)) (conference_day_12_attended)) ; If it's day 12, conference must be attended
                    (or (not (current_day day16)) (conference_day_16_attended)) ; If it's day 16, conference must be attended
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
  (action stay_extended
    :parameters (?c - city ?d_current ?d_next - day ?n_current ?n_next ?n_preferred - duration_count)
    :precondition (and
                    (current_day ?d_current)
                    (next_day ?d_current ?d_next)
                    (at ?c)
                    (city_current_stay_duration ?c ?n_current)
                    (succeeds ?n_current ?n_next)
                    (city_preferred_duration ?c ?n_preferred)
                    (succeeds ?n_preferred ?n_current) ; ?n_current is strictly greater than ?n_preferred
                    (or (not (current_day day12)) (conference_day_12_attended))
                    (or (not (current_day day16)) (conference_day_16_attended))
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
  (action travel
    :parameters (?from ?to - city ?d_current ?d_next - day ?n_from_curr - duration_count)
    :precondition (and
                    (current_day ?d_current)
                    (next_day ?d_current ?d_next)
                    (at ?from)
                    (has_flight ?from ?to)
                    (not (at ?to))
                    (city_current_stay_duration ?from ?n_from_curr)
                    (city_current_stay_duration ?to d0) ; Ensure target city currently has 0 days stayed
                    (or (not (current_day day12)) (conference_day_12_attended))
                    (or (not (current_day day16)) (conference_day_16_attended))
                  )
    :effect (and
              (not (at ?from))
              (at ?to)
              (not (current_day ?d_current))
              (current_day ?d_next)
              (not (city_current_stay_duration ?from ?n_from_curr))
              (city_current_stay_duration ?from d0) ; Reset stay duration for the city just left
              (not (city_current_stay_duration ?to d0))
              (city_current_stay_duration ?to d1) ; Arriving in new city counts as first day
              (visited_city_at_least_once ?to)
              (increase (total_cost) 0.5) ; Small cost for travel
            )
  )

  ;; Actions to mark conference attendance
  (action attend_conference_day12
    :precondition (and (current_day day12) (at dubrovnik) (not (conference_day_12_attended)))
    :effect (conference_day_12_attended)
  )

  (action attend_conference_day16
    :precondition (and (current_day day16) (at dubrovnik) (not (conference_day_16_attended)))
    :effect (conference_day_16_attended)
  )
)