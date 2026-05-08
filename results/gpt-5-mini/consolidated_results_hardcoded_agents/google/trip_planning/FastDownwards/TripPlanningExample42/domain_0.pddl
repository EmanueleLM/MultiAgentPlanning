(define (domain multiagent-travel)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (met-friends)
  )

  ;; Actions from planner_paris
  (:action planner_paris_meet_friends_day1
    :precondition (and (at paris day1))
    :effect (and (met-friends))
  )

  (:action planner_paris_stay_paris_1_2
    :precondition (and (at paris day1))
    :effect (and (at paris day2))
  )

  (:action planner_paris_stay_paris_2_3
    :precondition (and (at paris day2))
    :effect (and (at paris day3))
  )

  (:action planner_paris_stay_paris_3_4
    :precondition (and (at paris day3))
    :effect (and (at paris day4))
  )

  (:action planner_paris_fly_paris_nice_4_5
    :precondition (and (at paris day4))
    :effect (and (at nice day5))
  )

  ;; Actions from planner_nice
  ;; Note: planner_nice requested 5 days, see problem-file comments about reconciliation.
  (:action planner_nice_stay_nice_5_6
    :precondition (and (at nice day5))
    :effect (and (at nice day6))
  )

  (:action planner_nice_stay_nice_6_7
    :precondition (and (at nice day6))
    :effect (and (at nice day7))
  )

  ;; Actions from planner_mykonos
  (:action planner_mykonos_fly_nice_mykonos_7_8
    :precondition (and (at nice day7))
    :effect (and (at mykonos day8))
  )

  (:action planner_mykonos_stay_mykonos_8_9
    :precondition (and (at mykonos day8))
    :effect (and (at mykonos day9))
  )

  (:action planner_mykonos_stay_mykonos_9_10
    :precondition (and (at mykonos day9))
    :effect (and (at mykonos day10))
  )

  (:action planner_mykonos_stay_mykonos_10_11
    :precondition (and (at mykonos day10))
    :effect (and (at mykonos day11))
  )
)