(define (domain travel-domain)
  (:requirements :strips :typing)
  (:types agent city day)
  (:predicates
    (at ?a - agent ?c - city ?d - day)   ; agent a is in city c on day d
    (next ?d1 - day ?d2 - day)          ; d2 is the immediate successor of d1
  )

  ;; Stay in the same city from one day to the next
  (:action stay
    :parameters (?a - agent ?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?a ?c ?d1) (next ?d1 ?d2))
    :effect (and (not (at ?a ?c ?d1)) (at ?a ?c ?d2))
  )

  ;; Direct flights allowed only between Amsterdam <-> Santorini and
  ;; Amsterdam <-> Istanbul. Each flight consumes one day (moves from day d to day d+1).
  ;; No direct Santorini <-> Istanbul flight is provided (must route via Amsterdam).

  (:action fly-amsterdam-to-santorini
    :parameters (?a - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?a amsterdam ?d1) (next ?d1 ?d2))
    :effect (and (not (at ?a amsterdam ?d1)) (at ?a santorini ?d2))
  )

  (:action fly-santorini-to-amsterdam
    :parameters (?a - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?a santorini ?d1) (next ?d1 ?d2))
    :effect (and (not (at ?a santorini ?d1)) (at ?a amsterdam ?d2))
  )

  (:action fly-amsterdam-to-istanbul
    :parameters (?a - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?a amsterdam ?d1) (next ?d1 ?d2))
    :effect (and (not (at ?a amsterdam ?d1)) (at ?a istanbul ?d2))
  )

  (:action fly-istanbul-to-amsterdam
    :parameters (?a - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?a istanbul ?d1) (next ?d1 ?d2))
    :effect (and (not (at ?a istanbul ?d1)) (at ?a amsterdam ?d2))
  )
)