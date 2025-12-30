(define (domain trip-planning-17)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    day - object
    city - object
    count - object
  )
  (:constants
    cph vie lys - city
  )

  (:predicates
    (at ?c - city)
    (connected ?c1 - city ?c2 - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    
    (cph_stay_count ?k - count)
    (vie_stay_count ?k - count)
    (lys_stay_count ?k - count)
    (successor ?k1 - count ?k2 - count)
    
    (city_finished ?c - city)
    (required_stay_met ?c - city) 
    
    (conference_required ?d - day ?c - city)
    (conference_attended ?d - day) 
  )
  
  ;; --- Stay Actions ---
  
  ;; 1. Attend Fixed Conference in CPH (Target c5)
  (:action attend_conference_cph
    :parameters (?d1 - day ?d2 - day ?k_from - count ?k_to - count)
    :precondition (and
      (at cph)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (conference_required ?d1 cph)
      (not (conference_attended ?d1))
      
      (cph_stay_count ?k_from)
      (successor ?k_from ?k_to)
      (not (required_stay_met cph)) 
      ; Constraint: Prevent stay if C5 is already reached
      (not (cph_stay_count c5))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (conference_attended ?d1)
      
      (not (cph_stay_count ?k_from))
      (cph_stay_count ?k_to)
    )
  )

  ;; 2a. Regular stay in CPH (Target c5)
  (:action regular_stay_cph
    :parameters (?d1 - day ?d2 - day ?k_from - count ?k_to - count)
    :precondition (and
      (at cph)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      
      ; Must NOT be a required conference day
      (not (conference_required ?d1 cph)) 
      
      (cph_stay_count ?k_from)
      (successor ?k_from ?k_to)
      (not (required_stay_met cph))
      ; Constraint: Prevent stay if C5 is already reached
      (not (cph_stay_count c5))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (cph_stay_count ?k_from))
      (cph_stay_count ?k_to)
    )
  )
  
  ;; 2b. Regular stay in VIE (Target c2)
  (:action regular_stay_vie
    :parameters (?d1 - day ?d2 - day ?k_from - count ?k_to - count)
    :precondition (and
      (at vie)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      
      (vie_stay_count ?k_from)
      (successor ?k_from ?k_to)
      (not (required_stay_met vie))
      ; Constraint: Prevent stay if C2 is already reached.
      (not (vie_stay_count c2)) 
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (vie_stay_count ?k_from))
      (vie_stay_count ?k_to)
    )
  )
  
  ;; 2c. Regular stay in LYS (Target c2)
  (:action regular_stay_lys
    :parameters (?d1 - day ?d2 - day ?k_from - count ?k_to - count)
    :precondition (and
      (at lys)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      
      (lys_stay_count ?k_from)
      (successor ?k_from ?k_to)
      (not (required_stay_met lys))
      ; Constraint: Prevent stay if C2 is already reached.
      (not (lys_stay_count c2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (lys_stay_count ?k_from))
      (lys_stay_count ?k_to)
    )
  )


  ;; --- Finalization Actions ---

  ;; 3. Finalize CPH requirements (Duration = 5 + Conferences attended on D01 and D05)
  (:action finalize_cph_requirements
    :parameters ()
    :precondition (and
      (not (required_stay_met cph))
      (conference_attended d01) 
      (conference_attended d05) 
      (cph_stay_count c5) ; Required count c5
      (at cph)
    )
    :effect (required_stay_met cph)
  )
  
  ;; 4a. Finalize VIE stay (Duration = 2)
  (:action finalize_vie_stay
    :parameters ()
    :precondition (and
      (not (required_stay_met vie))
      (vie_stay_count c2) ; Required count c2
      (at vie)
    )
    :effect (required_stay_met vie)
  )
  
  ;; 4b. Finalize LYS stay (Duration = 2)
  (:action finalize_lys_stay
    :parameters ()
    :precondition (and
      (not (required_stay_met lys))
      (lys_stay_count c2) ; Required count c2
      (at lys)
    )
    :effect (required_stay_met lys)
  )

  ;; --- Travel Action ---
  
  ;; 5. Travel between cities (1 day duration)
  (:action travel
    :parameters (?c_from - city ?c_to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c_from)
      (connected ?c_from ?c_to)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      
      (required_stay_met ?c_from)
      (not (city_finished ?c_from)) 
    )
    :effect (and
      (not (at ?c_from))
      (at ?c_to)
      (city_finished ?c_from)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)