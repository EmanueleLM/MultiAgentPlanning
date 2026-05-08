(define (domain trip-planning-17)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types
    city - object
    day - object
  )

  (:predicates
    (at ?c - city)
    (connected ?c1 - city ?c2 - city)
    (day_is ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (city_finished ?c - city) ; Stay requirement met, ready to leave
    (cph_conference_day ?d - day) ; Marker for absolute days requiring conference (D01, D05)
    (conference_done ?d - day) ; Tracks if conference on that specific day is done
  )

  (:functions
    (stay_days ?c - city)
    (required_stay_days ?c - city)
    (total-cost) ; Tracks total days used (must reach 11)
  )

  ;; 1. Regular stay in a city (1 day duration)
  (:action regular_stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (day_is ?d1)
      (next_day ?d1 ?d2)
      ; Cannot be a designated CPH conference day if at CPH
      (or (not (= ?c cph)) (not (cph_conference_day ?d1)))
      (< (stay_days ?c) (required_stay_days ?c))
    )
    :effect (and
      (not (day_is ?d1))
      (day_is ?d2)
      (increase (stay_days ?c) 1)
      (increase (total-cost) 1)
    )
  )

  ;; 2. Attend fixed conference in Copenhagen (1 day duration)
  (:action attend_conference
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at cph)
      (day_is ?d1)
      (next_day ?d1 ?d2)
      (cph_conference_day ?d1)
      (not (conference_done ?d1))
    )
    :effect (and
      (not (day_is ?d1))
      (day_is ?d2)
      (conference_done ?d1)
      (increase (stay_days cph) 1)
      (increase (total-cost) 1)
    )
  )

  ;; 3. Travel between cities (1 day duration)
  (:action travel_to
    :parameters (?c_from - city ?c_to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c_from)
      (connected ?c_from ?c_to)
      (day_is ?d1)
      (next_day ?d1 ?d2)
      ; Stay duration requirement met for the city we are leaving
      (= (stay_days ?c_from) (required_stay_days ?c_from))
      (not (city_finished ?c_from)) 
      
      ; Specific constraint: If leaving CPH, conferences D01 and D05 must be done.
      (or (not (= ?c_from cph)) (and (conference_done d01) (conference_done d05)))
    )
    :effect (and
      (not (at ?c_from))
      (at ?c_to)
      (city_finished ?c_from)
      (not (day_is ?d1))
      (day_is ?d2)
      (increase (total-cost) 1) ; Travel day cost
    )
  )
)