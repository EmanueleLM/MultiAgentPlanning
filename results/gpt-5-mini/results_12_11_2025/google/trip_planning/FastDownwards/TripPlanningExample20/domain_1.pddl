(define (domain trip_planning_example20)
  :requirements :strips :negative-preconditions :typing
  :types city
  :predicates
    (at ?c - city)
    ;; Dubrovnik tokens
    (dub_needed_1) (dub_needed_2) (dub_needed_3)
    (dub_used_1) (dub_used_2) (dub_used_3)
    ;; Istanbul tokens
    (ist_needed_1) (ist_needed_2) (ist_needed_3) (ist_needed_4) (ist_needed_5)
    (ist_used_1) (ist_used_2) (ist_used_3) (ist_used_4) (ist_used_5)
    ;; Budapest tokens
    (bud_needed_1) (bud_needed_2) (bud_needed_3) (bud_needed_4)
    (bud_used_1) (bud_used_2) (bud_used_3) (bud_used_4)
  )

  ;; Stay actions for Dubrovnik (3 tokens)
  (:action stay_dubrovnik_1
    :parameters ()
    :precondition (and (at dubrovnik) (dub_needed_1))
    :effect (and (not (dub_needed_1)) (dub_used_1))
  )
  (:action stay_dubrovnik_2
    :parameters ()
    :precondition (and (at dubrovnik) (dub_needed_2))
    :effect (and (not (dub_needed_2)) (dub_used_2))
  )
  (:action stay_dubrovnik_3
    :parameters ()
    :precondition (and (at dubrovnik) (dub_needed_3))
    :effect (and (not (dub_needed_3)) (dub_used_3))
  )

  ;; Stay actions for Istanbul (5 tokens)
  (:action stay_istanbul_1
    :parameters ()
    :precondition (and (at istanbul) (ist_needed_1))
    :effect (and (not (ist_needed_1)) (ist_used_1))
  )
  (:action stay_istanbul_2
    :parameters ()
    :precondition (and (at istanbul) (ist_needed_2))
    :effect (and (not (ist_needed_2)) (ist_used_2))
  )
  (:action stay_istanbul_3
    :parameters ()
    :precondition (and (at istanbul) (ist_needed_3))
    :effect (and (not (ist_needed_3)) (ist_used_3))
  )
  (:action stay_istanbul_4
    :parameters ()
    :precondition (and (at istanbul) (ist_needed_4))
    :effect (and (not (ist_needed_4)) (ist_used_4))
  )
  (:action stay_istanbul_5
    :parameters ()
    :precondition (and (at istanbul) (ist_needed_5))
    :effect (and (not (ist_needed_5)) (ist_used_5))
  )

  ;; Stay actions for Budapest (4 tokens)
  (:action stay_budapest_1
    :parameters ()
    :precondition (and (at budapest) (bud_needed_1))
    :effect (and (not (bud_needed_1)) (bud_used_1))
  )
  (:action stay_budapest_2
    :parameters ()
    :precondition (and (at budapest) (bud_needed_2))
    :effect (and (not (bud_needed_2)) (bud_used_2))
  )
  (:action stay_budapest_3
    :parameters ()
    :precondition (and (at budapest) (bud_needed_3))
    :effect (and (not (bud_needed_3)) (bud_used_3))
  )
  (:action stay_budapest_4
    :parameters ()
    :precondition (and (at budapest) (bud_needed_4))
    :effect (and (not (bud_needed_4)) (bud_used_4))
  )

  ;; Flight actions (directed) - only allowed direct flights
  (:action fly_dubrovnik_to_istanbul
    :parameters ()
    :precondition (at dubrovnik)
    :effect (and (not (at dubrovnik)) (at istanbul))
  )

  (:action fly_istanbul_to_budapest
    :parameters ()
    :precondition (at istanbul)
    :effect (and (not (at istanbul)) (at budapest))
  )

  (:action fly_budapest_to_istanbul
    :parameters ()
    :precondition (at budapest)
    :effect (and (not (at budapest)) (at istanbul))
  )
)