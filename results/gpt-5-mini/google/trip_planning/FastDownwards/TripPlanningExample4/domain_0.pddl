(define (domain direct-flight-itinerary)
  (:requirements :typing :negative-preconditions :strips)
  (:types day city)

  (:predicates
    (at ?d - day ?c - city)       ; presence at the start of day ?d in city ?c
    (suc ?d1 - day ?d2 - day)     ; successor relation between days
    (edge ?c1 - city ?c2 - city)  ; direct-flight edge (can be used by flight actions)
  )

  ;----------------------------
  ; Traveler actions (distinct action names for the conceptual traveler agent)
  ; Actions are explicit per city/city-pair to allow concrete negative preconditions
  ; that prevent multiple assignments for the same day object.
  ;----------------------------

  ; Staying actions: remain in the same city from day ?d to its successor ?d2
  (:action traveler-stay-seville
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (at ?d seville)
      (suc ?d ?d2)
      ; ensure the successor day is not already assigned to any city
      (not (at ?d2 seville))
      (not (at ?d2 munich))
      (not (at ?d2 tallinn))
    )
    :effect (and
      (at ?d2 seville)
    )
  )

  (:action traveler-stay-munich
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (at ?d munich)
      (suc ?d ?d2)
      (not (at ?d2 seville))
      (not (at ?d2 munich))
      (not (at ?d2 tallinn))
    )
    :effect (and
      (at ?d2 munich)
    )
  )

  (:action traveler-stay-tallinn
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (at ?d tallinn)
      (suc ?d ?d2)
      (not (at ?d2 seville))
      (not (at ?d2 munich))
      (not (at ?d2 tallinn))
    )
    :effect (and
      (at ?d2 tallinn)
    )
  )

  ; Flight actions: move along an allowed direct edge from day ?d to successor ?d2.
  ; All direct-flight moves consume the transition between successive days.
  (:action traveler-fly-seville-munich
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (at ?d seville)
      (suc ?d ?d2)
      (edge seville munich)
      (not (at ?d2 seville))
      (not (at ?d2 munich))
      (not (at ?d2 tallinn))
    )
    :effect (and
      (at ?d2 munich)
    )
  )

  (:action traveler-fly-munich-seville
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (at ?d munich)
      (suc ?d ?d2)
      (edge munich seville)
      (not (at ?d2 seville))
      (not (at ?d2 munich))
      (not (at ?d2 tallinn))
    )
    :effect (and
      (at ?d2 seville)
    )
  )

  (:action traveler-fly-munich-tallinn
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (at ?d munich)
      (suc ?d ?d2)
      (edge munich tallinn)
      (not (at ?d2 seville))
      (not (at ?d2 munich))
      (not (at ?d2 tallinn))
    )
    :effect (and
      (at ?d2 tallinn)
    )
  )

  (:action traveler-fly-tallinn-munich
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (at ?d tallinn)
      (suc ?d ?d2)
      (edge tallinn munich)
      (not (at ?d2 seville))
      (not (at ?d2 munich))
      (not (at ?d2 tallinn))
    )
    :effect (and
      (at ?d2 munich)
    )
  )
)