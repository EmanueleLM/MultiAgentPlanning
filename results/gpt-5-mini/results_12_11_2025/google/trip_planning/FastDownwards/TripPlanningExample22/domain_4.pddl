(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (current ?d - day)
    (next ?d1 - day ?d2 - day)
    (unassigned ?d - day)
    (assigned ?d - day ?c - city)
    (visited ?c - city)
    (flight ?from - city ?to - city)
    (show_day ?d - day)
    (attended ?d - day)
  )

  ;; --- Initial assignment to day1 ---
  (:action assign_initial_berlin_show
    :parameters (?d - day)
    :precondition (and (current ?d) (unassigned ?d) (show_day ?d))
    :effect (and
      (assigned ?d berlin)
      (visited berlin)
      (attended ?d)
      (not (unassigned ?d))
    )
  )

  (:action assign_initial_berlin_noshow
    :parameters (?d - day)
    :precondition (and (current ?d) (unassigned ?d) (not (show_day ?d)))
    :effect (and
      (assigned ?d berlin)
      (visited berlin)
      (not (unassigned ?d))
    )
  )

  (:action assign_initial_frankfurt
    :parameters (?d - day)
    :precondition (and (current ?d) (unassigned ?d))
    :effect (and
      (assigned ?d frankfurt)
      (visited frankfurt)
      (not (unassigned ?d))
    )
  )

  (:action assign_initial_bucharest
    :parameters (?d - day)
    :precondition (and (current ?d) (unassigned ?d))
    :effect (and
      (assigned ?d bucharest)
      (visited bucharest)
      (not (unassigned ?d))
    )
  )

  ;; --- Stay in the same city between consecutive days ---
  (:action stay_berlin_show
    :parameters (?prev - day ?d - day)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev berlin) (unassigned ?d) (show_day ?d))
    :effect (and
      (assigned ?d berlin)
      (visited berlin)
      (attended ?d)
      (not (unassigned ?d))
    )
  )

  (:action stay_berlin_noshow
    :parameters (?prev - day ?d - day)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev berlin) (unassigned ?d) (not (show_day ?d)))
    :effect (and
      (assigned ?d berlin)
      (visited berlin)
      (not (unassigned ?d))
    )
  )

  (:action stay_frankfurt
    :parameters (?prev - day ?d - day)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev frankfurt) (unassigned ?d))
    :effect (and
      (assigned ?d frankfurt)
      (visited frankfurt)
      (not (unassigned ?d))
    )
  )

  (:action stay_bucharest
    :parameters (?prev - day ?d - day)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev bucharest) (unassigned ?d))
    :effect (and
      (assigned ?d bucharest)
      (visited bucharest)
      (not (unassigned ?d))
    )
  )

  ;; --- Move between different cities (requires direct flight) ---
  ;; Move to Berlin (show / no-show)
  (:action move_to_berlin_show
    :parameters (?prev - day ?d - day ?fromc - city)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev ?fromc) (flight ?fromc berlin) (unassigned ?d) (show_day ?d))
    :effect (and
      (assigned ?d berlin)
      (visited berlin)
      (attended ?d)
      (not (unassigned ?d))
    )
  )

  (:action move_to_berlin_noshow
    :parameters (?prev - day ?d - day ?fromc - city)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev ?fromc) (flight ?fromc berlin) (unassigned ?d) (not (show_day ?d)))
    :effect (and
      (assigned ?d berlin)
      (visited berlin)
      (not (unassigned ?d))
    )
  )

  ;; Move to Frankfurt
  (:action move_to_frankfurt
    :parameters (?prev - day ?d - day ?fromc - city)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev ?fromc) (flight ?fromc frankfurt) (unassigned ?d))
    :effect (and
      (assigned ?d frankfurt)
      (visited frankfurt)
      (not (unassigned ?d))
    )
  )

  ;; Move to Bucharest
  (:action move_to_bucharest
    :parameters (?prev - day ?d - day ?fromc - city)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev ?fromc) (flight ?fromc bucharest) (unassigned ?d))
    :effect (and
      (assigned ?d bucharest)
      (visited bucharest)
      (not (unassigned ?d))
    )
  )

  ;; Advance current day pointer; only allowed after current day is assigned.
  (:action advance_day
    :parameters (?cur - day ?nxt - day)
    :precondition (and (current ?cur) (next ?cur ?nxt) (not (unassigned ?cur)))
    :effect (and
      (not (current ?cur))
      (current ?nxt)
    )
  )
)