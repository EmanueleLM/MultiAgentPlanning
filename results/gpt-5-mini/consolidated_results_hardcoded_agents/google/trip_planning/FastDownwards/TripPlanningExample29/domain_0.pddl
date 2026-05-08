(define (domain travel-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (in ?c - city ?d - day)        ; being in city on a given day
    (next ?d1 - day ?d2 - day)    ; successor day relation
  )

  ;; STAY actions (remain in same city from dayN to dayN+1)
  (:action traveler-stay-dubrovnik
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (in dubrovnik ?d1) (next ?d1 ?d2)
                       (not (in frankfurt ?d2)) (not (in krakow ?d2)))
    :effect (and (in dubrovnik ?d2))
  )

  (:action traveler-stay-frankfurt
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (in frankfurt ?d1) (next ?d1 ?d2)
                       (not (in dubrovnik ?d2)) (not (in krakow ?d2)))
    :effect (and (in frankfurt ?d2))
  )

  (:action traveler-stay-krakow
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (in krakow ?d1) (next ?d1 ?d2)
                       (not (in dubrovnik ?d2)) (not (in frankfurt ?d2)))
    :effect (and (in krakow ?d2))
  )

  ;; FLIGHT actions (only allowed direct legs)
  (:action traveler-fly-dubrovnik-to-frankfurt
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (in dubrovnik ?d1) (next ?d1 ?d2)
                       ;; ensure day ?d2 is not already assigned to another city
                       (not (in krakow ?d2)) (not (in dubrovnik ?d2)))
    :effect (and (in frankfurt ?d2))
  )

  (:action traveler-fly-frankfurt-to-krakow
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (in frankfurt ?d1) (next ?d1 ?d2)
                       (not (in dubrovnik ?d2)) (not (in frankfurt ?d2)))
    :effect (and (in krakow ?d2))
  )

)