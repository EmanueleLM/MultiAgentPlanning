(define (domain trip-domain)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (succ ?d1 - day ?d2 - day)
    (conn ?c1 - city ?c2 - city)
  )

  ;; Stay actions (distinct per city)
  (:action stay-vienna
    :parameters (?d - day ?d2 - day)
    :precondition (and (at vienna ?d) (succ ?d ?d2))
    :effect (and (not (at vienna ?d)) (at vienna ?d2))
  )

  (:action stay-vilnius
    :parameters (?d - day ?d2 - day)
    :precondition (and (at vilnius ?d) (succ ?d ?d2))
    :effect (and (not (at vilnius ?d)) (at vilnius ?d2))
  )

  (:action stay-valencia
    :parameters (?d - day ?d2 - day)
    :precondition (and (at valencia ?d) (succ ?d ?d2))
    :effect (and (not (at valencia ?d)) (at valencia ?d2))
  )

  ;; Travel actions (distinct per directed leg, only allowed when conn exists)
  (:action travel-vienna-to-vilnius
    :parameters (?d - day ?d2 - day)
    :precondition (and (at vienna ?d) (succ ?d ?d2) (conn vienna vilnius))
    :effect (and (not (at vienna ?d)) (at vilnius ?d2))
  )

  (:action travel-vilnius-to-vienna
    :parameters (?d - day ?d2 - day)
    :precondition (and (at vilnius ?d) (succ ?d ?d2) (conn vilnius vienna))
    :effect (and (not (at vilnius ?d)) (at vienna ?d2))
  )

  (:action travel-vienna-to-valencia
    :parameters (?d - day ?d2 - day)
    :precondition (and (at vienna ?d) (succ ?d ?d2) (conn vienna valencia))
    :effect (and (not (at vienna ?d)) (at valencia ?d2))
  )

  (:action travel-valencia-to-vienna
    :parameters (?d - day ?d2 - day)
    :precondition (and (at valencia ?d) (succ ?d ?d2) (conn valencia vienna))
    :effect (and (not (at valencia ?d)) (at vienna ?d2))
  )

)