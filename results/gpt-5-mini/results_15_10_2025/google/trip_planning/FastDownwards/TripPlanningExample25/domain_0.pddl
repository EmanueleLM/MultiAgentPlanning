(define (domain travel-domain)
  (:requirements :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)        ; traveler is at city ?c on day ?d
    (next ?d - day ?d2 - day)     ; temporal successor relation between days
    (connected ?c - city ?c2 - city) ; direct flight connection (informational)
  )

  ;; Stay actions (one-day forward transitions where traveler remains in same city)
  (:action stay-valencia
    :parameters (?d - day ?d2 - day)
    :precondition (and (at valencia ?d) (next ?d ?d2)
                       (not (at lyon ?d2)) (not (at split ?d2)))
    :effect (and (at valencia ?d2))
  )

  (:action stay-lyon
    :parameters (?d - day ?d2 - day)
    :precondition (and (at lyon ?d) (next ?d ?d2)
                       (not (at valencia ?d2)) (not (at split ?d2)))
    :effect (and (at lyon ?d2))
  )

  (:action stay-split
    :parameters (?d - day ?d2 - day)
    :precondition (and (at split ?d) (next ?d ?d2)
                       (not (at valencia ?d2)) (not (at lyon ?d2)))
    :effect (and (at split ?d2))
  )

  ;; Flight actions for each direct connection (one-day transitions)
  ;; Valencia <-> Lyon
  (:action fly-valencia-to-lyon
    :parameters (?d - day ?d2 - day)
    :precondition (and (at valencia ?d) (next ?d ?d2)
                       (not (at valencia ?d2)) (not (at split ?d2)))
    :effect (and (at lyon ?d2))
  )

  (:action fly-lyon-to-valencia
    :parameters (?d - day ?d2 - day)
    :precondition (and (at lyon ?d) (next ?d ?d2)
                       (not (at lyon ?d2)) (not (at split ?d2)))
    :effect (and (at valencia ?d2))
  )

  ;; Lyon <-> Split
  (:action fly-lyon-to-split
    :parameters (?d - day ?d2 - day)
    :precondition (and (at lyon ?d) (next ?d ?d2)
                       (not (at lyon ?d2)) (not (at valencia ?d2)))
    :effect (and (at split ?d2))
  )

  (:action fly-split-to-lyon
    :parameters (?d - day ?d2 - day)
    :precondition (and (at split ?d) (next ?d ?d2)
                       (not (at split ?d2)) (not (at valencia ?d2)))
    :effect (and (at lyon ?d2))
  )
)