(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)               ; at city c at the end of day d
    (succ ?d1 - day ?d2 - day)           ; successor relation between days
    (day-assigned ?d - day)              ; marks that an end-of-day location has been chosen
    (can-travel ?c1 - city ?c2 - city)   ; direct flight exists from c1 to c2
  )

  ;; stay actions: one per local planner (agent-specific actions)
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

  ;; move actions: agent-specific move actions that respect direct-flight connectivity
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