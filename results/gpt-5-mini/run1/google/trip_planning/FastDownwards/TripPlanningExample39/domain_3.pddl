(define (domain trip_planning_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day token)

  (:predicates
    (unassigned ?d - day)
    (assigned ?d - day ?c - city)
    (day_succ ?p - day ?d - day)
    (first_day ?d - day)
    (day_is_early ?d - day)

    (flight ?c1 - city ?c2 - city)

    (token_available ?t - token)
    (token_of ?t - token ?c - city)
    (token_used ?t - token)

    (relatives_visited)
  )

  ; -------------------------
  ; Assign the first day to any city (general)
  ; If assigning porto on an early first day use the porto_early variant below
  ; -------------------------
  (:action assign_first_day
    :parameters (?d - day ?t - token ?c - city)
    :precondition (and
      (first_day ?d)
      (unassigned ?d)
      (token_available ?t)
      (token_of ?t ?c)
    )
    :effect (and
      (assigned ?d ?c)
      (not (unassigned ?d))
      (not (token_available ?t))
      (token_used ?t)
    )
  )

  (:action assign_first_day_porto_early
    :parameters (?d - day ?t - token)
    :precondition (and
      (first_day ?d)
      (unassigned ?d)
      (day_is_early ?d)
      (token_available ?t)
      (token_of ?t porto)
    )
    :effect (and
      (assigned ?d porto)
      (not (unassigned ?d))
      (not (token_available ?t))
      (token_used ?t)
      (relatives_visited)
    )
  )

  ; -------------------------
  ; Stay in same city from one day to the successor day (general)
  ; -------------------------
  (:action assign_day_stay
    :parameters (?prev - day ?d - day ?t - token ?c - city)
    :precondition (and
      (day_succ ?prev ?d)
      (assigned ?prev ?c)
      (unassigned ?d)
      (token_available ?t)
      (token_of ?t ?c)
    )
    :effect (and
      (assigned ?d ?c)
      (not (unassigned ?d))
      (not (token_available ?t))
      (token_used ?t)
    )
  )

  (:action assign_day_stay_porto_early
    :parameters (?prev - day ?d - day ?t - token)
    :precondition (and
      (day_succ ?prev ?d)
      (assigned ?prev porto)
      (unassigned ?d)
      (day_is_early ?d)
      (token_available ?t)
      (token_of ?t porto)
    )
    :effect (and
      (assigned ?d porto)
      (not (unassigned ?d))
      (not (token_available ?t))
      (token_used ?t)
      (relatives_visited)
    )
  )

  ; -------------------------
  ; Fly from one city to another (requires a direct flight)
  ; -------------------------
  (:action assign_day_fly
    :parameters (?prev - day ?d - day ?t - token ?from - city ?to - city)
    :precondition (and
      (day_succ ?prev ?d)
      (assigned ?prev ?from)
      (flight ?from ?to)
      (unassigned ?d)
      (token_available ?t)
      (token_of ?t ?to)
    )
    :effect (and
      (assigned ?d ?to)
      (not (unassigned ?d))
      (not (token_available ?t))
      (token_used ?t)
    )
  )

  (:action assign_day_fly_to_porto_early
    :parameters (?prev - day ?d - day ?t - token ?from - city)
    :precondition (and
      (day_succ ?prev ?d)
      (assigned ?prev ?from)
      (flight ?from porto)
      (unassigned ?d)
      (day_is_early ?d)
      (token_available ?t)
      (token_of ?t porto)
    )
    :effect (and
      (assigned ?d porto)
      (not (unassigned ?d))
      (not (token_available ?t))
      (token_used ?t)
      (relatives_visited)
    )
  )
)