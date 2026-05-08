(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    city - object
    day - object
  )

  (:predicates
    (at ?c - city)
    (is_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (has_flight ?c1 ?c2 - city)
    (conference_day_12_met)
    (conference_day_16_met)
  )

  (:functions
    (days_spent_in ?c - city)
    (preferred_duration ?c - city)
    (total_cost)
    (actual_trip_days)
  )

  ;; Action to stay in the current city, within preferred duration
  (action stay_within_preference
    :parameters (?c - city ?d_current ?d_next - day)
    :precondition (and
                    (at ?c)
                    (is_day ?d_current)
                    (next_day ?d_current ?d_next)
                    ;; Conference on Day 12 must be met if we are on Day 12 and are about to advance past it
                    (or (not (is_day day12)) (conference_day_12_met))
                    ;; Conference on Day 16 must be met if we are on Day 16 and are about to advance past it
                    (or (not (is_day day16)) (conference_day_16_met))
                    (< (days_spent_in ?c) (preferred_duration ?c)) ; Still within preferred days for this city
                  )
    :effect (and
              (not (is_day ?d_current))
              (is_day ?d_next)
              (increase (days_spent_in ?c) 1)
              (increase (actual_trip_days) 1)
              ;; No cost increase; this action helps meet preferences, so it's desirable
            )
  )

  ;; Action to stay in the current city, exceeding preferred duration
  (action stay_exceeding_preference
    :parameters (?c - city ?d_current ?d_next - day)
    :precondition (and
                    (at ?c)
                    (is_day ?d_current)
                    (next_day ?d_current ?d_next)
                    (or (not (is_day day12)) (conference_day_12_met))
                    (or (not (is_day day16)) (conference_day_16_met))
                    (>= (days_spent_in ?c) (preferred_duration ?c)) ; Already met or exceeded preferred days
                  )
    :effect (and
              (not (is_day ?d_current))
              (is_day ?d_next)
              (increase (days_spent_in ?c) 1)
              (increase (actual_trip_days) 1)
              (increase (total_cost) 1) ; Penalty for exceeding preferred duration
            )
  )

  ;; Action to travel from one city to another
  (action travel
    :parameters (?from ?to - city ?d_current ?d_next - day)
    :precondition (and
                    (at ?from)
                    (has_flight ?from ?to)
                    (is_day ?d_current)
                    (next_day ?d_current ?d_next)
                    (not (at ?to)) ; Ensure not already in target city
                    (or (not (is_day day12)) (conference_day_12_met))
                    (or (not (is_day day16)) (conference_day_16_met))
                  )
    :effect (and
              (not (at ?from))
              (at ?to)
              (not (is_day ?d_current))
              (is_day ?d_next)
              (increase (days_spent_in ?to) 1)
              (increase (actual_trip_days) 1)
              (increase (total_cost) 0.5) ; Small cost for travel itself, to prefer fewer transfers
            )
  )

  ;; Actions to mark conference attendance (no cost associated with attendance itself, it's a hard requirement)
  (action attend_conference_day12
    :precondition (and (is_day day12) (at dubrovnik) (not (conference_day_12_met)))
    :effect (conference_day_12_met)
  )

  (action attend_conference_day16
    :precondition (and (is_day day16) (at dubrovnik) (not (conference_day_16_met)))
    :effect (conference_day_16_met)
  )
)