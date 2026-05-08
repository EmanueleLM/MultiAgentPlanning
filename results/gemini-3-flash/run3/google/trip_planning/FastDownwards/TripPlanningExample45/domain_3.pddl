(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count status)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (stay_count ?c - city ?v - count)
    (status ?c - city ?s - status)
    (flight ?c1 ?c2 - city)
    (next_day ?d1 ?d2 - day)
    (next_count ?v1 ?v2 - count)
    (conf_day1_done)
    (conf_day7_done)
  )

  ;; Attend the conference on Day 1 in Copenhagen
  (:action attend_conference_day1
    :parameters ()
    :precondition (and (at copenhagen) (current_day day1))
    :effect (conf_day1_done)
  )

  ;; Attend the conference on Day 7 in Copenhagen
  (:action attend_conference_day7
    :parameters ()
    :precondition (and (at copenhagen) (current_day day7))
    :effect (conf_day7_done)
  )

  ;; Stay in the current city and advance to the next calendar day.
  ;; This increments the stay count for the city the person is currently in.
  (:action advance_day
    :parameters (?c - city ?d_old ?d_new - day ?v_old ?v_new - count)
    :precondition (and 
      (at ?c) 
      (current_day ?d_old) 
      (next_day ?d_old ?d_new) 
      (status ?c staying) 
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
  ;; The day of the flight counts as a stay day for both the origin (already counted)
  ;; and the destination (incremented here). Contiguity is maintained by tracking 
  ;; status: a city is visited once as a contiguous block.
  (:action fly
    :parameters (?from ?to - city ?d - day ?v_old ?v_new - count)
    :precondition (and 
      (at ?from) 
      (current_day ?d) 
      (status ?from staying) 
      (status ?to unvisited) 
      (flight ?from ?to) 
      (stay_count ?to ?v_old) 
      (next_count ?v_old ?v_new)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (status ?from finished) 
      (status ?to staying) 
      (not (stay_count ?to ?v_old)) 
      (stay_count ?to ?v_new)
    )
  )
)