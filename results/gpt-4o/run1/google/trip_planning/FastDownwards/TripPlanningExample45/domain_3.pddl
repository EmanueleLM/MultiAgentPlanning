(define (domain city_visit_redesigned)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at_city ?c - city ?d - day)
    (direct_flight ?from ?to - city)
    (successor ?d1 ?d2 - day)
    (conferenceday ?c - city ?d - day)
  )
  (:action fly
    :parameters (?from ?to - city ?d-depart ?d-arrive - day)
    :precondition (and
      (at_city ?from ?d-depart)
      (direct_flight ?from ?to)
      (successor ?d-depart ?d-arrive)
    )
    :effect (and
      (not (at_city ?from ?d-depart))
      (at_city ?to ?d-arrive)
    )
  )
  (:action stay
    :parameters (?c - city ?d-depart ?d-stay - day)
    :precondition (and
      (at_city ?c ?d-depart)
      (successor ?d-depart ?d-stay)
    )
    :effect (and
      (not (at_city ?c ?d-depart))
      (at_city ?c ?d-stay)
    )
  )
)