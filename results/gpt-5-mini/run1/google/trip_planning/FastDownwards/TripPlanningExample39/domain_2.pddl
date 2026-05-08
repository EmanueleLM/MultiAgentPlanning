(define (domain trip_planning_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day token)

  (:predicates
    (assigned ?d - day ?c - city)        ; day d is assigned to city c
    (unassigned ?d - day)               ; day d has not yet been assigned
    (day_succ ?p - day ?d - day)        ; p is predecessor of d (ordered days)
    (flight ?c1 - city ?c2 - city)      ; direct flight exists between cities
    (token_available ?t - token)        ; travel-day token is available (not yet used)
    (token_of ?t - token ?c - city)     ; token t is a token for city c
    (token_used ?t - token)             ; token t has been consumed (used)
    (relatives_visited)                 ; relatives in Porto were visited between day1 and day3
    (day_is_early ?d - day)             ; marker for days 1..3 (the "between day1 and day3" window)
  )

  ; -------------------------
  ; Assign day1 to a city (use one token of that city)
  ; For porto on an early day1 this also sets relatives_visited
  ; -------------------------
  (:action assign_day1_porto
    :parameters (?t - token)
    :precondition (and
      (unassigned day1)
      (token_available ?t)
      (token_of ?t porto)
      (day_is_early day1)
    )
    :effect (and
      (assigned day1 porto)
      (not (unassigned day1))
      (not (token_available ?t))
      (token_used ?t)
      (relatives_visited)
    )
  )

  (:action assign_day1_porto_nonearly
    :parameters (?t - token)
    :precondition (and
      (unassigned day1)
      (token_available ?t)
      (token_of ?t porto)
      (not (day_is_early day1))
    )
    :effect (and
      (assigned day1 porto)
      (not (unassigned day1))
      (not (token_available ?t))
      (token_used ?t)
    )
  )

  (:action assign_day1_barcelona
    :parameters (?t - token)
    :precondition (and
      (unassigned day1)
      (token_available ?t)
      (token_of ?t barcelona)
    )
    :effect (and
      (assigned day1 barcelona)
      (not (unassigned day1))
      (not (token_available ?t))
      (token_used ?t)
    )
  )

  (:action assign_day1_florence
    :parameters (?t - token)
    :precondition (and
      (unassigned day1)
      (token_available ?t)
      (token_of ?t florence)
    )
    :effect (and
      (assigned day1 florence)
      (not (unassigned day1))
      (not (token_available ?t))
      (token_used ?t)
    )
  )

  ; -------------------------
  ; Stay in same city from one day to the successor day
  ; If staying in porto on an early day, set relatives_visited
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
  ; Flying into porto on an early day sets relatives_visited
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