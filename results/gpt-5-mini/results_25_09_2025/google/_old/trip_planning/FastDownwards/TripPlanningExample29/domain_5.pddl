(define (domain integrated_trip_fd)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types city day kcount)

  (:constants
    frankfurt krakow dubrovnik - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    k0 k1 k2 - kcount
  )

  (:predicates
    (at ?c - city)
    (visited ?c - city)
    (unstarted)
    (wedding-in ?c - city)
    (wedding-held)
    (direct ?from - city ?to - city)
    (current-day ?d - day)
    (next-day ?d1 - day ?d2 - day)
    (krakow-count ?k - kcount)
    (next-kcount ?k1 - kcount ?k2 - kcount)
  )

  (:action start-in-krakow
    :parameters (?d1 - day ?d2 - day ?k1 - kcount ?k2 - kcount)
    :precondition (and (unstarted) (current-day ?d1) (next-day ?d1 ?d2) (krakow-count ?k1) (next-kcount ?k1 ?k2))
    :effect (and
      (not (unstarted))
      (not (current-day ?d1)) (current-day ?d2)
      (at krakow)
      (visited krakow)
      (not (krakow-count ?k1)) (krakow-count ?k2)
    )
  )

  (:action start-in-frankfurt
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (unstarted) (current-day ?d1) (next-day ?d1 ?d2))
    :effect (and
      (not (unstarted))
      (not (current-day ?d1)) (current-day ?d2)
      (at frankfurt)
      (visited frankfurt)
    )
  )

  (:action start-in-dubrovnik
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (unstarted) (current-day ?d1) (next-day ?d1 ?d2))
    :effect (and
      (not (unstarted))
      (not (current-day ?d1)) (current-day ?d2)
      (at dubrovnik)
      (visited dubrovnik)
    )
  )

  (:action stay-in-krakow
    :parameters (?d1 - day ?d2 - day ?k1 - kcount ?k2 - kcount)
    :precondition (and (at krakow) (current-day ?d1) (next-day ?d1 ?d2) (krakow-count ?k1) (next-kcount ?k1 ?k2))
    :effect (and
      (not (current-day ?d1)) (current-day ?d2)
      (visited krakow)
      (not (krakow-count ?k1)) (krakow-count ?k2)
    )
  )

  (:action stay-in-other
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c) (current-day ?d1) (next-day ?d1 ?d2) (not (= ?c krakow)))
    :effect (and
      (not (current-day ?d1)) (current-day ?d2)
      (visited ?c)
    )
  )

  (:action fly-to-krakow
    :parameters (?from - city ?d1 - day ?d2 - day ?k1 - kcount ?k2 - kcount)
    :precondition (and (at ?from) (direct ?from krakow) (current-day ?d1) (next-day ?d1 ?d2) (krakow-count ?k1) (next-kcount ?k1 ?k2))
    :effect (and
      (not (at ?from))
      (at krakow)
      (visited krakow)
      (not (current-day ?d1)) (current-day ?d2)
      (not (krakow-count ?k1)) (krakow-count ?k2)
    )
  )

  (:action fly-other
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from) (direct ?from ?to) (current-day ?d1) (next-day ?d1 ?d2) (not (= ?to krakow)))
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?to)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )

  (:action hold-wedding-day9
    :parameters ()
    :precondition (and (at krakow) (wedding-in krakow) (current-day d9))
    :effect (and
      (wedding-held)
    )
  )

  (:action hold-wedding-day10
    :parameters ()
    :precondition (and (at krakow) (wedding-in krakow) (current-day d10))
    :effect (and
      (wedding-held)
    )
  )
)