(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (current ?d - day)
    (first ?d - day)
    (next ?d1 - day ?d2 - day)

    (unassigned ?d - day)
    (assigned ?d - day ?c - city)
    (visited ?c - city)

    (flight ?from - city ?to - city)

    (show_day ?d - day)
    (attended ?d - day)
  )

  ;; --- First-day assignment actions ---
  (:action assign_first_berlin_show
    :parameters (?d - day)
    :precondition (and (current ?d) (first ?d) (unassigned ?d) (show_day ?d))
    :effect (and
      (assigned ?d berlin)
      (visited berlin)
      (attended ?d)
      (not (unassigned ?d))
    )
  )

  (:action assign_first_berlin_noshow
    :parameters (?d - day)
    :precondition (and (current ?d) (first ?d) (unassigned ?d) (not (show_day ?d)))
    :effect (and
      (assigned ?d berlin)
      (visited berlin)
      (not (unassigned ?d))
    )
  )

  (:action assign_first_frankfurt
    :parameters (?d - day)
    :precondition (and (current ?d) (first ?d) (unassigned ?d))
    :effect (and
      (assigned ?d frankfurt)
      (visited frankfurt)
      (not (unassigned ?d))
    )
  )

  (:action assign_first_bucharest
    :parameters (?d - day)
    :precondition (and (current ?d) (first ?d) (unassigned ?d))
    :effect (and
      (assigned ?d bucharest)
      (visited bucharest)
      (not (unassigned ?d))
    )
  )

  ;; --- Stay in the same city actions ---
  (:action assign_stay_berlin_show
    :parameters (?prev - day ?d - day)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev berlin) (unassigned ?d) (show_day ?d))
    :effect (and
      (assigned ?d berlin)
      (visited berlin)
      (attended ?d)
      (not (unassigned ?d))
    )
  )

  (:action assign_stay_berlin_noshow
    :parameters (?prev - day ?d - day)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev berlin) (unassigned ?d) (not (show_day ?d)))
    :effect (and
      (assigned ?d berlin)
      (visited berlin)
      (not (unassigned ?d))
    )
  )

  (:action assign_stay_frankfurt
    :parameters (?prev - day ?d - day)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev frankfurt) (unassigned ?d))
    :effect (and
      (assigned ?d frankfurt)
      (visited frankfurt)
      (not (unassigned ?d))
    )
  )

  (:action assign_stay_bucharest
    :parameters (?prev - day ?d - day)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev bucharest) (unassigned ?d))
    :effect (and
      (assigned ?d bucharest)
      (visited bucharest)
      (not (unassigned ?d))
    )
  )

  ;; --- Move actions (change city) ---
  ;; Move to Berlin (show / no-show variants)
  (:action assign_move_to_berlin_show
    :parameters (?prev - day ?d - day ?cold - city)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev ?cold) (flight ?cold berlin) (unassigned ?d) (show_day ?d))
    :effect (and
      (assigned ?d berlin)
      (visited berlin)
      (attended ?d)
      (not (unassigned ?d))
    )
  )

  (:action assign_move_to_berlin_noshow
    :parameters (?prev - day ?d - day ?cold - city)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev ?cold) (flight ?cold berlin) (unassigned ?d) (not (show_day ?d)))
    :effect (and
      (assigned ?d berlin)
      (visited berlin)
      (not (unassigned ?d))
    )
  )

  ;; Move to Frankfurt
  (:action assign_move_to_frankfurt
    :parameters (?prev - day ?d - day ?cold - city)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev ?cold) (flight ?cold frankfurt) (unassigned ?d))
    :effect (and
      (assigned ?d frankfurt)
      (visited frankfurt)
      (not (unassigned ?d))
    )
  )

  ;; Move to Bucharest
  (:action assign_move_to_bucharest
    :parameters (?prev - day ?d - day ?cold - city)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev ?cold) (flight ?cold bucharest) (unassigned ?d))
    :effect (and
      (assigned ?d bucharest)
      (visited bucharest)
      (not (unassigned ?d))
    )
  )

  ;; Advance current day pointer; only allowed after the current day is assigned.
  (:action advance_day
    :parameters (?cur - day ?nxt - day)
    :precondition (and (current ?cur) (next ?cur ?nxt) (not (unassigned ?cur)))
    :effect (and
      (not (current ?cur))
      (current ?nxt)
    )
  )
)