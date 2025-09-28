(define (domain travel-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (day ?d - day)
    (city ?c - city)
    (next ?d1 - day ?d2 - day)           ; successor relation between days
    (flight ?from - city ?to - city)     ; available direct flights (one-way as listed)
    (in ?c - city ?d - day)              ; spending that day in that city
    (unassigned ?d - day)                ; day has not yet been assigned a city
    (current ?d - day)                   ; pointer to current day to assign next day
    (meeting-window ?d - day)            ; days allowed to meet friends in Paris (1..4)
    (met ?c - city ?d - day)             ; met friends in city on day
  )

  ; Actions provided by planner_paris
  (:action planner_paris_stay_paris
    :parameters (?d - day ?dnext - day)
    :precondition (and (current ?d) (next ?d ?dnext) (unassigned ?dnext) (in paris ?d))
    :effect (and (not (unassigned ?dnext)) (in paris ?dnext) (not (current ?d)) (current ?dnext))
  )

  (:action planner_paris_fly_paris_to_nice
    :parameters (?d - day ?dnext - day)
    :precondition (and (current ?d) (next ?d ?dnext) (unassigned ?dnext) (in paris ?d) (flight paris nice))
    :effect (and (not (unassigned ?dnext)) (in nice ?dnext) (not (current ?d)) (current ?dnext))
  )

  (:action planner_paris_meet_friends
    :parameters (?d - day)
    :precondition (and (in paris ?d) (meeting-window ?d))
    :effect (met paris ?d)
  )

  ; Actions provided by planner_nice
  (:action planner_nice_stay_nice
    :parameters (?d - day ?dnext - day)
    :precondition (and (current ?d) (next ?d ?dnext) (unassigned ?dnext) (in nice ?d))
    :effect (and (not (unassigned ?dnext)) (in nice ?dnext) (not (current ?d)) (current ?dnext))
  )

  (:action planner_nice_fly_nice_to_mykonos
    :parameters (?d - day ?dnext - day)
    :precondition (and (current ?d) (next ?d ?dnext) (unassigned ?dnext) (in nice ?d) (flight nice mykonos))
    :effect (and (not (unassigned ?dnext)) (in mykonos ?dnext) (not (current ?d)) (current ?dnext))
  )

  ; Actions provided by planner_mykonos
  (:action planner_mykonos_stay_mykonos
    :parameters (?d - day ?dnext - day)
    :precondition (and (current ?d) (next ?d ?dnext) (unassigned ?dnext) (in mykonos ?d))
    :effect (and (not (unassigned ?dnext)) (in mykonos ?dnext) (not (current ?d)) (current ?dnext))
  )
)