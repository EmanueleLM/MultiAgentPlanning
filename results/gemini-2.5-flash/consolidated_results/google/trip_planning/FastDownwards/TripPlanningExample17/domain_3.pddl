(define (domain trip-planning-17)
  (:requirements :typing :negative-preconditions :action-costs :equality)
  (:types
    day - object
    city - object
  )

  (:constants
    cph vie lys - city
  )

  (:predicates
    (at ?c - city)
    (connected ?c1 - city ?c2 - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (city_finished ?c - city)
    
    (conference_required ?d - day ?c - city)
    (conference_attended ?d - day) 
    (all_conferences_done) 
    (required_stay_met ?c - city) 
  )

  (:functions
    (stay_count ?c - city)
    (required_stay ?c - city)
    (total-duration)
  )
  
  ;; 1. Attend Fixed Conference (Day 1 or Day 5 in CPH)
  (:action attend_conference
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at cph)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (conference_required ?d1 cph)
      (not (conference_attended ?d1))
      (< (stay_count cph) (required_stay cph))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (conference_attended ?d1)
      (increase (stay_count cph) 1)
      (increase (total-duration) 1)
    )
  )

  ;; 2. Regular stay in a city (1 day duration)
  (:action regular_stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      
      ; If at CPH, ensure it's not a required conference day
      (or (not (= ?c cph)) (not (conference_required ?d1 cph)))
      
      ; Ensure stay goal is not met yet
      (< (stay_count ?c) (required_stay ?c))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (increase (stay_count ?c) 1)
      (increase (total-duration) 1)
    )
  )

  ;; 3. Finalize CPH requirements (Duration + Conferences)
  (:action finalize_cph_requirements
    :parameters ()
    :precondition (and
      (not (required_stay_met cph))
      (conference_attended d01) 
      (conference_attended d05) 
      (= (stay_count cph) (required_stay cph)) ; Must be 5 days total
    )
    :effect (and
      (all_conferences_done)
      (required_stay_met cph)
    )
  )
  
  ;; 4. Finalize general city stay (Duration only, for VIE and LYS)
  (:action finalize_city_stay
    :parameters (?c - city)
    :precondition (and
      (not (required_stay_met ?c))
      (not (= ?c cph)) 
      (= (stay_count ?c) (required_stay ?c))
    )
    :effect (and
      (required_stay_met ?c)
    )
  )

  ;; 5. Travel between cities (1 day duration)
  (:action travel
    :parameters (?c_from - city ?c_to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c_from)
      (connected ?c_from ?c_to)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      
      ; Stay duration/activity requirement met for the city we are leaving
      (required_stay_met ?c_from)
      (not (city_finished ?c_from)) 
    )
    :effect (and
      (not (at ?c_from))
      (at ?c_to)
      (city_finished ?c_from)
      (not (current_day ?d1))
      (current_day ?d2)
      (increase (total-duration) 1)
    )
  )
)