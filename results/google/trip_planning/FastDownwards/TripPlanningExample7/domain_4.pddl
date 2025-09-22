(define (domain integrated-trip-planning)
  (:requirements :strips :typing :action-costs :equality)
  (:types traveler city daycount)
  (:predicates
    (at ?t - traveler ?c - city)
    (visited ?c - city)
    (direct ?from - city ?to - city)
    (reachable ?from - city ?to - city)
    (dayleft ?d - daycount)
    (next ?higher - daycount ?lower - daycount)
    (preferred ?c - city ?d - daycount)
  )

  ;; Traveler agent actions (kept distinct)
  (:action fly-ag1
    :parameters (?tr - traveler ?from - city ?to - city)
    :precondition (and (at ?tr ?from) (direct ?from ?to))
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
      (visited ?to)
    )
    :cost 0
  )

  (:action stay-one-day-ag1
    :parameters (?tr - traveler ?c - city ?d1 - daycount ?d2 - daycount)
    :precondition (and (at ?tr ?c) (dayleft ?d1) (next ?d1 ?d2))
    :effect (and
      (not (dayleft ?d1))
      (dayleft ?d2)
      (visited ?c)
    )
    :cost 1
  )

  ;; Flight-checker agent actions (kept distinct)
  (:action add-reachable-direct-ag2
    :parameters (?from - city ?to - city)
    :precondition (and (direct ?from ?to))
    :effect (reachable ?from ?to)
    :cost 0
  )

  (:action extend-reachable-ag2
    :parameters (?from - city ?mid - city ?to - city)
    :precondition (and (reachable ?from ?mid) (direct ?mid ?to))
    :effect (reachable ?from ?to)
    :cost 0
  )

  (:action add-reverse-direct-ag2
    :parameters (?from - city ?to - city)
    :precondition (direct ?from ?to)
    :effect (direct ?to ?from)
    :cost 0
  )
)