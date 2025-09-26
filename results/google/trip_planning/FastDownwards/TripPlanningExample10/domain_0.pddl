(define (domain eu_trip)
  (:requirements :typing)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (next ?d - day ?d2 - day)
    (link ?c1 - city ?c2 - city)
  )

  ;; Stay actions for each city (distinct per-city actions as requested)
  (:action stay-oslo
    :parameters (?d - day ?d2 - day)
    :precondition (and (at oslo ?d) (next ?d ?d2))
    :effect (and (at oslo ?d2))
  )

  (:action stay-dublin
    :parameters (?d - day ?d2 - day)
    :precondition (and (at dublin ?d) (next ?d ?d2))
    :effect (and (at dublin ?d2))
  )

  (:action stay-valencia
    :parameters (?d - day ?d2 - day)
    :precondition (and (at valencia ?d) (next ?d ?d2))
    :effect (and (at valencia ?d2))
  )

  ;; Flight actions limited to direct links; actions are kept distinct per directed link
  (:action fly-oslo-dublin
    :parameters (?d - day ?d2 - day)
    :precondition (and (at oslo ?d) (next ?d ?d2) (link oslo dublin))
    :effect (and (at dublin ?d2))
  )

  (:action fly-dublin-oslo
    :parameters (?d - day ?d2 - day)
    :precondition (and (at dublin ?d) (next ?d ?d2) (link dublin oslo))
    :effect (and (at oslo ?d2))
  )

  (:action fly-dublin-valencia
    :parameters (?d - day ?d2 - day)
    :precondition (and (at dublin ?d) (next ?d ?d2) (link dublin valencia))
    :effect (and (at valencia ?d2))
  )

  (:action fly-valencia-dublin
    :parameters (?d - day ?d2 - day)
    :precondition (and (at valencia ?d) (next ?d ?d2) (link valencia dublin))
    :effect (and (at dublin ?d2))
  )
)