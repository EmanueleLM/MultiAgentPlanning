(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (stay_count ?c - city ?v - count)
    (visited ?c - city)
    (can_fly ?c1 ?c2 - city)
    (next_day ?d1 ?d2 - day)
    (next_count ?v1 ?v2 - count)
    (conference_at ?c - city ?d - day)
    (conference_done ?d - day)
  )

  ;; Attend a conference at a city on a specific calendar day.
  (:action attend_conference
    :parameters (?c - city ?d - day)
    :precondition (and 
      (at ?c) 
      (current_day ?d) 
      (conference_at ?c ?d)
    )
    :effect (conference_done ?d)
  )

  ;; Stay in the current city and advance to the next calendar day.
  ;; This increments the stay count for the city the person is currently in.
  (:action stay
    :parameters (?c - city ?d_old ?d_new - day ?v_old ?v_new - count)
    :precondition (and 
      (at ?c) 
      (current_day ?d_old) 
      (next_day ?d_old ?d_new) 
      (stay_count ?c ?v_old) 
      (next_count ?v_old ?v_new)
    )
    :effect (and 
      (not (current_day ?d_old)) 
      (current_day ?d_new) 
      (not (stay_count ?c ?v_old)) 
      (stay_count ?c ?v_new)
    )
  )

  ;; Fly from one city to another on the same calendar day.
  ;; The travel day counts as a stay day for both the origin (already incremented via previous 'stay' or 'init')
  ;; and the destination (incremented here from v0 to v1).
  ;; The 'not (visited ?to)' constraint ensures cities are visited in contiguous blocks and not revisited.
  (:action fly
    :parameters (?from ?to - city ?d - day ?v_zero ?v_new - count)
    :precondition (and 
      (at ?from) 
      (current_day ?d) 
      (can_fly ?from ?to) 
      (not (visited ?to)) 
      (stay_count ?to ?v_zero) 
      (next_count ?v_zero ?v_new)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (visited ?to)
      (not (stay_count ?to ?v_zero)) 
      (stay_count ?to ?v_new)
    )
  )
)