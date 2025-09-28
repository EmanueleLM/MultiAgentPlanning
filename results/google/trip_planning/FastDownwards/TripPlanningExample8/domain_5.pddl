(define (domain itinerary)
  (:requirements :typing :negative-preconditions)
  (:types city day krtoken zutoken athtoken)
  (:predicates
    (at ?c - city ?d - day)
    (unassigned ?d - day)
    (flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (kr-token-available ?t - krtoken)
    (kr-token-used ?t - krtoken)
    (zu-token-available ?t - zutoken)
    (zu-token-used ?t - zutoken)
    (ath-token-available ?t - athtoken)
    (ath-token-used ?t - athtoken)
  )

  (:action assign-stay-krakow
    :parameters (?d1 - day ?d2 - day ?t - krtoken)
    :precondition (and (at krakow ?d1) (next ?d1 ?d2) (unassigned ?d2) (kr-token-available ?t))
    :effect (and
      (not (unassigned ?d2))
      (at krakow ?d2)
      (not (kr-token-available ?t))
      (kr-token-used ?t)
    )
  )

  (:action assign-fly-to-krakow
    :parameters (?from - city ?d1 - day ?d2 - day ?t - krtoken)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (unassigned ?d2) (flight ?from krakow) (kr-token-available ?t))
    :effect (and
      (not (unassigned ?d2))
      (at krakow ?d2)
      (not (kr-token-available ?t))
      (kr-token-used ?t)
    )
  )

  (:action assign-stay-zurich
    :parameters (?d1 - day ?d2 - day ?t - zutoken)
    :precondition (and (at zurich ?d1) (next ?d1 ?d2) (unassigned ?d2) (zu-token-available ?t))
    :effect (and
      (not (unassigned ?d2))
      (at zurich ?d2)
      (not (zu-token-available ?t))
      (zu-token-used ?t)
    )
  )

  (:action assign-fly-to-zurich
    :parameters (?from - city ?d1 - day ?d2 - day ?t - zutoken)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (unassigned ?d2) (flight ?from zurich) (zu-token-available ?t))
    :effect (and
      (not (unassigned ?d2))
      (at zurich ?d2)
      (not (zu-token-available ?t))
      (zu-token-used ?t)
    )
  )

  (:action assign-stay-athens
    :parameters (?d1 - day ?d2 - day ?t - athtoken)
    :precondition (and (at athens ?d1) (next ?d1 ?d2) (unassigned ?d2) (ath-token-available ?t))
    :effect (and
      (not (unassigned ?d2))
      (at athens ?d2)
      (not (ath-token-available ?t))
      (ath-token-used ?t)
    )
  )

  (:action assign-fly-to-athens
    :parameters (?from - city ?d1 - day ?d2 - day ?t - athtoken)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (unassigned ?d2) (flight ?from athens) (ath-token-available ?t))
    :effect (and
      (not (unassigned ?d2))
      (at athens ?d2)
      (not (ath-token-available ?t))
      (ath-token-used ?t)
    )
  )
)