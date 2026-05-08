(define (domain travel-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)        ; agent is in city ?c on day ?d
    (next ?d1 - day ?d2 - day)    ; temporal successor: ?d2 is the day after ?d1
    (occupied ?d - day)           ; day ?d has already been assigned (one city per day)
    (direct ?from - city ?to - city) ; direct flight leg available from -> to
  )

  ;; Stay action: remain in the same city from a day to its successor
  ;; Distinct action label for stays preserved: "stay"
  (:action stay
    :parameters (?c - city ?dprev - day ?dnext - day)
    :precondition (and
      (at ?c ?dprev)
      (next ?dprev ?dnext)
      (not (occupied ?dnext))
    )
    :effect (and
      (at ?c ?dnext)
      (occupied ?dnext)
    )
  )

  ;; Flight action: fly along a provided direct leg between successor days
  ;; Distinct action label for flights preserved: "fly"
  ;; This generic fly action is constrained at runtime by the problem-level (direct ...) facts.
  (:action fly
    :parameters (?from - city ?to - city ?dprev - day ?dnext - day)
    :precondition (and
      (at ?from ?dprev)
      (next ?dprev ?dnext)
      (direct ?from ?to)
      (not (occupied ?dnext))
    )
    :effect (and
      (at ?to ?dnext)
      (occupied ?dnext)
    )
  )
)