(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    day ; Represents a discrete point in time, e.g., 'start of day X'
    day-count ; Represents the number of days spent in a city
  )
  (:predicates
    (at ?c - city)
    (connected ?c1 ?c2 - city)
    (friend_met)
    (current-day ?d - day) ; Tracks the current day in the trip
    (next-day ?d1 ?d2 - day) ; Defines the sequence of days
    (days-spent-in ?c - city ?dc - day-count) ; Tracks days spent in each city
    (next-day-count ?dc1 ?dc2 - day-count) ; Defines the sequence of day counts for duration
    (can-meet-friend ?d - day) ; Pre-computed predicate for days when friend meeting is allowed
  )

  ;; Action to fly between cities
  (:action fly
    :parameters (?from ?to - city)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (connected ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  ;; Action to stay in Berlin for a day, advancing the global day counter and Berlin's specific day counter
  (:action stay-in-berlin
    :parameters (?current_day ?next_day - day ?current_dc ?next_dc - day-count)
    :precondition (and
      (at berlin)
      (current-day ?current_day)
      (next-day ?current_day ?next_day)
      (days-spent-in berlin ?current_dc)
      (next-day-count ?current_dc ?next_dc)
    )
    :effect (and
      (not (current-day ?current_day))
      (current-day ?next_day)
      (not (days-spent-in berlin ?current_dc))
      (days-spent-in berlin ?next_dc)
    )
  )

  ;; Action to stay in Warsaw for a day, advancing the global day counter and Warsaw's specific day counter
  (:action stay-in-warsaw
    :parameters (?current_day ?next_day - day ?current_dc ?next_dc - day-count)
    :precondition (and
      (at warsaw)
      (current-day ?current_day)
      (next-day ?current_day ?next_day)
      (days-spent-in warsaw ?current_dc)
      (next-day-count ?current_dc ?next_dc)
    )
    :effect (and
      (not (current-day ?current_day))
      (current-day ?next_day)
      (not (days-spent-in warsaw ?current_dc))
      (days-spent-in warsaw ?next_dc)
    )
  )

  ;; Action to stay in Bucharest for a day, advancing the global day counter and Bucharest's specific day counter
  (:action stay-in-bucharest
    :parameters (?current_day ?next_day - day ?current_dc ?next_dc - day-count)
    :precondition (and
      (at bucharest)
      (current-day ?current_day)
      (next-day ?current_day ?next_day)
      (days-spent-in bucharest ?current_dc)
      (next-day-count ?current_dc ?next_dc)
    )
    :effect (and
      (not (current-day ?current_day))
      (current-day ?next_day)
      (not (days-spent-in bucharest ?current_dc))
      (days-spent-in bucharest ?next_dc)
    )
  )

  ;; Action to meet a friend in Bucharest, only possible on specific days
  (:action meet-friend-in-bucharest
    :parameters (?d - day)
    :precondition (and
      (at bucharest)
      (not (friend_met))
      (current-day ?d)
      (can-meet-friend ?d) ; Allows meeting on specific days (Day 5 or Day 6)
    )
    :effect (and
      (friend_met)
    )
  )
)