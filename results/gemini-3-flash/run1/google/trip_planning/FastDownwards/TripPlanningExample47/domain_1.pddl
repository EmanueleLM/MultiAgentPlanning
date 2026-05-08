(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city day count_step
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (count_paris ?s - count_step)
    (count_istanbul ?s - count_step)
    (count_salzburg ?s - count_step)
    (conn ?c1 ?c2 - city)
    (next_day ?d1 ?d2 - day)
    (next_count ?s1 ?s2 - count_step)
    (conference_attended)
  )

  ;; Action to mark that the traveler attended the conference in Paris on Day 2.
  ;; Day 1 is covered by the initial state (at paris, day1).
  (:action attend_conference
    :parameters ()
    :precondition (and (at paris) (current_day day2))
    :effect (conference_attended)
  )

  ;; Stay in Paris: advances day and increments Paris count
  (:action stay_paris
    :parameters (?d1 - day ?d2 - day ?c1 - count_step ?c2 - count_step)
    :precondition (and (at paris) (current_day ?d1) (next_day ?d1 ?d2) (count_paris ?c1) (next_count ?c1 ?c2))
    :effect (and (not (current_day ?d1)) (current_day ?d2) (not (count_paris ?c1)) (count_paris ?c2))
  )

  ;; Stay in Istanbul: advances day and increments Istanbul count
  (:action stay_istanbul
    :parameters (?d1 - day ?d2 - day ?c1 - count_step ?c2 - count_step)
    :precondition (and (at istanbul) (current_day ?d1) (next_day ?d1 ?d2) (count_istanbul ?c1) (next_count ?c1 ?c2))
    :effect (and (not (current_day ?d1)) (current_day ?d2) (not (count_istanbul ?c1)) (count_istanbul ?c2))
  )

  ;; Stay in Salzburg: advances day and increments Salzburg count
  (:action stay_salzburg
    :parameters (?d1 - day ?d2 - day ?c1 - count_step ?c2 - count_step)
    :precondition (and (at salzburg) (current_day ?d1) (next_day ?d1 ?d2) (count_salzburg ?c1) (next_count ?c1 ?c2))
    :effect (and (not (current_day ?d1)) (current_day ?d2) (not (count_salzburg ?c1)) (count_salzburg ?c2))
  )

  ;; Travel to Paris: increments Paris count and changes location
  (:action travel_to_paris
    :parameters (?from - city ?d1 - day ?d2 - day ?c1 - count_step ?c2 - count_step)
    :precondition (and (at ?from) (current_day ?d1) (next_day ?d1 ?d2) (conn ?from paris) (count_paris ?c1) (next_count ?c1 ?c2))
    :effect (and (not (at ?from)) (at paris) (not (current_day ?d1)) (current_day ?d2) (not (count_paris ?c1)) (count_paris ?c2))
  )

  ;; Travel to Istanbul: increments Istanbul count and changes location
  (:action travel_to_istanbul
    :parameters (?from - city ?d1 - day ?d2 - day ?c1 - count_step ?c2 - count_step)
    :precondition (and (at ?from) (current_day ?d1) (next_day ?d1 ?d2) (conn ?from istanbul) (count_istanbul ?c1) (next_count ?c1 ?c2))
    :effect (and (not (at ?from)) (at istanbul) (not (current_day ?d1)) (current_day ?d2) (not (count_istanbul ?c1)) (count_istanbul ?c2))
  )

  ;; Travel to Salzburg: increments Salzburg count and changes location
  (:action travel_to_salzburg
    :parameters (?from - city ?d1 - day ?d2 - day ?c1 - count_step ?c2 - count_step)
    :precondition (and (at ?from) (current_day ?d1) (next_day ?d1 ?d2) (conn ?from salzburg) (count_salzburg ?c1) (next_count ?c1 ?c2))
    :effect (and (not (at ?from)) (at salzburg) (not (current_day ?d1)) (current_day ?d2) (not (count_salzburg ?c1)) (count_salzburg ?c2))
  )
)