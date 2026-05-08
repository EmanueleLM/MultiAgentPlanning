(define (domain direct_flight_itinerary)
  (:requirements :typing :negative-preconditions :strips)
  (:types day city)

  (:predicates
    (at ?d - day ?c - city)
    (suc ?d1 - day ?d2 - day)
    (edge ?c1 - city ?c2 - city)
  )

  ; stay actions: remain in same city from day ?d to successor ?d2
  (:action stay-seville
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (at ?d seville)
      (suc ?d ?d2)
      (not (at ?d2 seville))
      (not (at ?d2 munich))
      (not (at ?d2 tallinn))
    )
    :effect (and
      (at ?d2 seville)
    )
  )

  (:action stay-munich
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

  (:action stay-tallinn
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

  ; flight actions: move along a direct edge from day ?d to successor ?d2
  (:action fly-seville-munich
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

  (:action fly-munich-seville
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

  (:action fly-munich-tallinn
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

  (:action fly-tallinn-munich
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