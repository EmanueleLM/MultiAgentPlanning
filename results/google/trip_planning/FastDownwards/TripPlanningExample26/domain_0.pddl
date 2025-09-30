(define (domain travel-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  ;; Predicates
  (:predicates
    (at ?d - day ?c - city)        ; traveler is in city ?c on day ?d
    (succ ?d1 - day ?d2 - day)     ; ?d2 is the successor of ?d1
    (occupied ?d - day)            ; day ?d has already been assigned a city
    (met ?d - day)                 ; meeting with friend on day ?d
  )

  ;; Note: action names are kept distinct for city-specific stay actions
  ;; and explicit flight actions for direct connections only.

  ;; Stay actions (city-specific)
  (:action porto_stay
    :parameters (?d ?dnext - day)
    :precondition (and (succ ?d ?dnext) (at ?d porto) (not (occupied ?dnext)))
    :effect (and (at ?dnext porto) (occupied ?dnext))
  )

  (:action berlin_stay
    :parameters (?d ?dnext - day)
    :precondition (and (succ ?d ?dnext) (at ?d berlin) (not (occupied ?dnext)))
    :effect (and (at ?dnext berlin) (occupied ?dnext))
  )

  (:action reykjavik_stay
    :parameters (?d ?dnext - day)
    :precondition (and (succ ?d ?dnext) (at ?d reykjavik) (not (occupied ?dnext)))
    :effect (and (at ?dnext reykjavik) (occupied ?dnext))
  )

  ;; Flight actions (only the direct connections provided)
  (:action flight_porto_berlin
    :parameters (?d ?dnext - day)
    :precondition (and (succ ?d ?dnext) (at ?d porto) (not (occupied ?dnext)))
    :effect (and (at ?dnext berlin) (occupied ?dnext))
  )

  (:action flight_berlin_porto
    :parameters (?d ?dnext - day)
    :precondition (and (succ ?d ?dnext) (at ?d berlin) (not (occupied ?dnext)))
    :effect (and (at ?dnext porto) (occupied ?dnext))
  )

  (:action flight_berlin_reykjavik
    :parameters (?d ?dnext - day)
    :precondition (and (succ ?d ?dnext) (at ?d berlin) (not (occupied ?dnext)))
    :effect (and (at ?dnext reykjavik) (occupied ?dnext))
  )

  (:action flight_reykjavik_berlin
    :parameters (?d ?dnext - day)
    :precondition (and (succ ?d ?dnext) (at ?d reykjavik) (not (occupied ?dnext)))
    :effect (and (at ?dnext berlin) (occupied ?dnext))
  )

  ;; Meeting action in Reykjavik (must occur on a day where traveler is in Reykjavik)
  (:action meet_in_reykjavik
    :parameters (?d - day)
    :precondition (and (at ?d reykjavik))
    :effect (met ?d)
  )
)