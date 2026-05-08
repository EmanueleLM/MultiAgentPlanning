(define (domain trip_planning_instance)
  (:requirements :typing :negative-preconditions :strips)
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

  ; assign the first day to a city (consumes a city token)
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

  ; special variant: if the first day is an early day and city is porto, mark relatives visited
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

  ; stay in the same city from prev day to next day (consume a token for that city)
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

  ; special stay variant: if the new day is early and city is porto, mark relatives visited
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

  ; fly from one city to another (requires direct flight and consumes a token for destination)
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

  ; fly-to-porto on an early day should mark relatives visited
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