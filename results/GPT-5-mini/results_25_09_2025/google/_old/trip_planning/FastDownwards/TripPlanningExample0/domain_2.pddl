(define (domain combined-trip-domain)
  (:requirements :strips :typing :negative-preconditions :action-costs :equality)
  (:types city day sf sb sh)

  (:predicates
    (at ?c - city)
    (link ?from - city ?to - city)
    (visited ?c - city)
    (met)

    (day ?d - day)
    (next-day ?d1 - day ?d2 - day)

    (spent-florence ?s - sf)
    (next-sf ?s1 - sf ?s2 - sf)

    (spent-barcelona ?s - sb)
    (next-sb ?s1 - sb ?s2 - sb)

    (spent-helsinki ?s - sh)
    (next-sh ?s1 - sh ?s2 - sh)

    (window9to14 ?d - day)
  )

  ;; Traveler stay actions increment the symbolic day and the per-city spent counter
  (:action traveler-stay-florence
    :parameters (?d1 - day ?d2 - day ?s1 - sf ?s2 - sf)
    :precondition (and (at florence) (day ?d1) (next-day ?d1 ?d2) (spent-florence ?s1) (next-sf ?s1 ?s2))
    :effect (and
              (not (day ?d1)) (day ?d2)
              (not (spent-florence ?s1)) (spent-florence ?s2)
            )
    :cost 1
  )

  (:action traveler-stay-barcelona
    :parameters (?d1 - day ?d2 - day ?s1 - sb ?s2 - sb)
    :precondition (and (at barcelona) (day ?d1) (next-day ?d1 ?d2) (spent-barcelona ?s1) (next-sb ?s1 ?s2))
    :effect (and
              (not (day ?d1)) (day ?d2)
              (not (spent-barcelona ?s1)) (spent-barcelona ?s2)
            )
    :cost 1
  )

  (:action traveler-stay-helsinki
    :parameters (?d1 - day ?d2 - day ?s1 - sh ?s2 - sh)
    :precondition (and (at helsinki) (day ?d1) (next-day ?d1 ?d2) (spent-helsinki ?s1) (next-sh ?s1 ?s2))
    :effect (and
              (not (day ?d1)) (day ?d2)
              (not (spent-helsinki ?s1)) (spent-helsinki ?s2)
            )
    :cost 1
  )

  ;; Meeting action must occur while in Florence and on a day in the window 9..14
  (:action traveler-meet-in-florence
    :parameters (?d - day)
    :precondition (and (at florence) (day ?d) (window9to14 ?d) (not (met)))
    :effect (and (met))
    :cost 1
  )

  ;; Flight actions consume a day and move the traveler between directly linked cities
  (:action flight-fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from) (link ?from ?to) (day ?d1) (next-day ?d1 ?d2))
    :effect (and
              (not (at ?from)) (at ?to)
              (visited ?to)
              (not (day ?d1)) (day ?d2)
            )
    :cost 1
  )
)