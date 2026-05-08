(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (succ ?d1 - day ?d2 - day)
    (day-assigned ?d - day)
    (can-travel ?c1 - city ?c2 - city)
  )

  (:action stay_by_planner_frankfurt
    :parameters (?dprev - day ?d - day)
    :precondition (and
      (at frankfurt ?dprev)
      (succ ?dprev ?d)
      (not (day-assigned ?d))
    )
    :effect (and
      (at frankfurt ?d)
      (day-assigned ?d)
    )
  )

  (:action stay_by_planner_bucharest
    :parameters (?dprev - day ?d - day)
    :precondition (and
      (at bucharest ?dprev)
      (succ ?dprev ?d)
      (not (day-assigned ?d))
    )
    :effect (and
      (at bucharest ?d)
      (day-assigned ?d)
    )
  )

  (:action stay_by_planner_stuttgart
    :parameters (?dprev - day ?d - day)
    :precondition (and
      (at stuttgart ?dprev)
      (succ ?dprev ?d)
      (not (day-assigned ?d))
    )
    :effect (and
      (at stuttgart ?d)
      (day-assigned ?d)
    )
  )

  (:action move_by_planner_frankfurt
    :parameters (?to - city ?dprev - day ?d - day)
    :precondition (and
      (at frankfurt ?dprev)
      (succ ?dprev ?d)
      (not (day-assigned ?d))
      (can-travel frankfurt ?to)
    )
    :effect (and
      (at ?to ?d)
      (day-assigned ?d)
    )
  )

  (:action move_by_planner_bucharest
    :parameters (?to - city ?dprev - day ?d - day)
    :precondition (and
      (at bucharest ?dprev)
      (succ ?dprev ?d)
      (not (day-assigned ?d))
      (can-travel bucharest ?to)
    )
    :effect (and
      (at ?to ?d)
      (day-assigned ?d)
    )
  )

  (:action move_by_planner_stuttgart
    :parameters (?to - city ?dprev - day ?d - day)
    :precondition (and
      (at stuttgart ?dprev)
      (succ ?dprev ?d)
      (not (day-assigned ?d))
      (can-travel stuttgart ?to)
    )
    :effect (and
      (at ?to ?d)
      (day-assigned ?d)
    )
  )
)