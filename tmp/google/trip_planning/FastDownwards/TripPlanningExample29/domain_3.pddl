(define (domain integrated_trip_fd)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types city day kcount)

  (:predicates
    (at ?c - city)
    (visited ?c - city)
    (unstarted)
    (wedding-in ?c - city)
    (wedding-held)
    (direct ?from - city ?to - city)
    (day ?d - day)
    (next ?d1 - day ?d2 - day)
    (krakow-count ?k - kcount)
    (next-k ?k1 - kcount ?k2 - kcount)
  )

  (:action start-in-krakow
    :parameters (?d - day ?d' - day ?k - kcount ?k' - kcount)
    :precondition (and (unstarted) (day ?d) (next ?d ?d') (krakow-count ?k) (next-k ?k ?k'))
    :effect (and
      (not (unstarted))
      (not (day ?d)) (day ?d')
      (at krakow)
      (visited krakow)
      (not (krakow-count ?k)) (krakow-count ?k')
    )
  )

  (:action start-in-frankfurt
    :parameters (?d - day ?d' - day)
    :precondition (and (unstarted) (day ?d) (next ?d ?d'))
    :effect (and
      (not (unstarted))
      (not (day ?d)) (day ?d')
      (at frankfurt)
      (visited frankfurt)
    )
  )

  (:action start-in-dubrovnik
    :parameters (?d - day ?d' - day)
    :precondition (and (unstarted) (day ?d) (next ?d ?d'))
    :effect (and
      (not (unstarted))
      (not (day ?d)) (day ?d')
      (at dubrovnik)
      (visited dubrovnik)
    )
  )

  (:action stay-in-krakow
    :parameters (?d - day ?d' - day ?k - kcount ?k' - kcount)
    :precondition (and (at krakow) (day ?d) (next ?d ?d') (krakow-count ?k) (next-k ?k ?k'))
    :effect (and
      (not (day ?d)) (day ?d')
      (visited krakow)
      (not (krakow-count ?k)) (krakow-count ?k')
    )
  )

  (:action stay-in-other
    :parameters (?c - city ?d - day ?d' - day)
    :precondition (and (at ?c) (day ?d) (next ?d ?d') (not (= ?c krakow)))
    :effect (and
      (not (day ?d)) (day ?d')
      (visited ?c)
    )
  )

  (:action fly-to-krakow
    :parameters (?from - city ?d - day ?d' - day ?k - kcount ?k' - kcount)
    :precondition (and (at ?from) (direct ?from krakow) (day ?d) (next ?d ?d') (krakow-count ?k) (next-k ?k ?k'))
    :effect (and
      (not (at ?from))
      (at krakow)
      (visited krakow)
      (not (day ?d)) (day ?d')
      (not (krakow-count ?k)) (krakow-count ?k')
    )
  )

  (:action fly-other
    :parameters (?from - city ?to - city ?d - day ?d' - day)
    :precondition (and (at ?from) (direct ?from ?to) (day ?d) (next ?d ?d') (not (= ?to krakow)))
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?to)
      (not (day ?d)) (day ?d')
    )
  )

  (:action hold-wedding-day9
    :parameters ()
    :precondition (and (at krakow) (wedding-in krakow) (day d9))
    :effect (and
      (wedding-held)
    )
  )

  (:action hold-wedding-day10
    :parameters ()
    :precondition (and (at krakow) (wedding-in krakow) (day d10))
    :effect (and
      (wedding-held)
    )
  )
)