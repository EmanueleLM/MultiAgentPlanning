(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)

  (:predicates
    (at ?c - city)                   ;; Current location of the traveler
    (current_day ?d - day)           ;; The current calendar day
    (next_day ?d1 ?d2 - day)         ;; Succession relationship between days
    (stay_count ?c - city ?n - count);; Current number of days stayed in a city
    (next_count ?n1 ?n2 - count)     ;; Succession relationship between count values
    (visited ?c - city ?d - day)     ;; Tracks if a city stay has been recorded on a specific day
    (can_fly ?c1 ?c2 - city)         ;; Available direct flight routes
    (show_at ?c - city ?d - day)     ;; Indicates a show occurs in a city on a specific day
    (attended ?d - day)              ;; Tracks if the show on a specific day was attended
    (can_fly_today)                  ;; Flag to limit flight actions to once per calendar day
  )

  ;; Advance to the next calendar day and reset the daily flight flag
  (:action advance_day
    :parameters (?d_old ?d_new - day)
    :precondition (and (current_day ?d_old) (next_day ?d_old ?d_new))
    :effect (and 
      (not (current_day ?d_old)) 
      (current_day ?d_new) 
      (can_fly_today)
    )
  )

  ;; Move between cities if a direct flight exists and the daily flight limit isn't reached
  (:action fly
    :parameters (?from ?to - city)
    :precondition (and 
      (at ?from) 
      (can_fly ?from ?to) 
      (can_fly_today)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (can_fly_today))
    )
  )

  ;; Increment the stay counter for the current city on the current day
  ;; Each city can be recorded at most once per calendar day
  (:action record_stay
    :parameters (?c - city ?d - day ?n_old ?n_new - count)
    :precondition (and 
      (at ?c) 
      (current_day ?d) 
      (stay_count ?c ?n_old) 
      (next_count ?n_old ?n_new) 
      (not (visited ?c ?d))
    )
    :effect (and 
      (not (stay_count ?c ?n_old)) 
      (stay_count ?c ?n_new) 
      (visited ?c ?d)
    )
  )

  ;; Attend the annual show if present in the correct city on the correct day
  (:action attend_show
    :parameters (?c - city ?d - day)
    :precondition (and 
      (at ?c) 
      (current_day ?d) 
      (show_at ?c ?d)
    )
    :effect (attended ?d)
  )
)