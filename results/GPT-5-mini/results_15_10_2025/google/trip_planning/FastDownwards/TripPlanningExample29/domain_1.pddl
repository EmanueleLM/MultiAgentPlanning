(define (domain travel-multiagent)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types city day)
  (:constants dubrovnik frankfurt krakow - city)
  (:predicates
    (in ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
  )

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

  (:action traveler-fly-dubrovnik-to-frankfurt
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (in dubrovnik ?d1) (next ?d1 ?d2)
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