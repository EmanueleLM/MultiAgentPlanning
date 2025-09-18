(define (domain orchestrated_trip)
  (:requirements :strips :typing :fluents :negative-preconditions)
  (:types city day)

  (:predicates
    (in ?c - city ?d - day)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (occupied ?d - day)
    (meeting-allowed ?d - day)
    (is-nice ?c - city)
    (met-friends)
  )

  (:functions
    (total-days)
    (days-brussels)
    (days-valencia)
    (days-nice)
  )

  (:action stay-brussels
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (in brussels ?d1)
      (next ?d1 ?d2)
      (not (occupied ?d2))
    )
    :effect (and
      (not (in brussels ?d1))
      (in brussels ?d2)
      (occupied ?d2)
      (increase (days-brussels) 1)
      (increase (total-days) 1)
    )
  )

  (:action stay-valencia
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (in valencia ?d1)
      (next ?d1 ?d2)
      (not (occupied ?d2))
    )
    :effect (and
      (not (in valencia ?d1))
      (in valencia ?d2)
      (occupied ?d2)
      (increase (days-valencia) 1)
      (increase (total-days) 1)
    )
  )

  (:action stay-nice
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (in nice ?d1)
      (next ?d1 ?d2)
      (not (occupied ?d2))
    )
    :effect (and
      (not (in nice ?d1))
      (in nice ?d2)
      (occupied ?d2)
      (increase (days-nice) 1)
      (increase (total-days) 1)
    )
  )

  (:action fly-brussels-valencia
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (in brussels ?d1)
      (next ?d1 ?d2)
      (direct brussels valencia)
      (not (occupied ?d2))
    )
    :effect (and
      (not (in brussels ?d1))
      (in valencia ?d2)
      (occupied ?d2)
      (increase (days-valencia) 1)
      (increase (total-days) 1)
    )
  )

  (:action fly-valencia-brussels
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (in valencia ?d1)
      (next ?d1 ?d2)
      (direct valencia brussels)
      (not (occupied ?d2))
    )
    :effect (and
      (not (in valencia ?d1))
      (in brussels ?d2)
      (occupied ?d2)
      (increase (days-brussels) 1)
      (increase (total-days) 1)
    )
  )

  (:action fly-brussels-nice
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (in brussels ?d1)
      (next ?d1 ?d2)
      (direct brussels nice)
      (not (occupied ?d2))
    )
    :effect (and
      (not (in brussels ?d1))
      (in nice ?d2)
      (occupied ?d2)
      (increase (days-nice) 1)
      (increase (total-days) 1)
    )
  )

  (:action fly-nice-brussels
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (in nice ?d1)
      (next ?d1 ?d2)
      (direct nice brussels)
      (not (occupied ?d2))
    )
    :effect (and
      (not (in nice ?d1))
      (in brussels ?d2)
      (occupied ?d2)
      (increase (days-brussels) 1)
      (increase (total-days) 1)
    )
  )

  (:action meet-friends-in-nice
    :parameters (?d - day)
    :precondition (and
      (in nice ?d)
      (meeting-allowed ?d)
      (not (met-friends))
    )
    :effect (and
      (met-friends)
    )
  )
)