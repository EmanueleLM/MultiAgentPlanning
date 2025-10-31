(define (domain integrated-itinerary)
  (:requirements :typing :negative-preconditions)
  (:types city day token tokenf tokena tokenr)

  (:predicates
    ;; Traveler predicates
    (day ?d - day)
    (next ?d1 - day ?d2 - day)
    (free ?d - day)
    (in ?c - city ?d - day)
    (assigned ?d - day)
    (flight ?c1 - city ?c2 - city)
    (token ?t - token)
    (consumed ?t - token)
    (workshop-done)
    (in-workshop-range ?d - day)

    ;; Flight-planner predicates
    (at ?c - city)
    (visited ?c - city)
    (direct ?c1 - city ?c2 - city)
    (day-now ?d - day)
    (earlier-of ?prev - day ?next - day)
  )

  ;; -----------------------
  ;; Traveler agent actions
  ;; -----------------------

  ;; Assign day1 to Florence (uses one Florence token)
  (:action assign-day1-florence
    :parameters (?d - day ?t - tokenf)
    :precondition (and (day ?d) (free ?d) (not (assigned ?d)) (token ?t))
    :effect (and (not (free ?d)) (in florence ?d) (assigned ?d) (not (token ?t)) (consumed ?t) (workshop-done))
  )

  ;; Assign day1 to Amsterdam (uses one Amsterdam token)
  (:action assign-day1-amsterdam
    :parameters (?d - day ?t - tokena)
    :precondition (and (day ?d) (free ?d) (not (assigned ?d)) (token ?t))
    :effect (and (not (free ?d)) (in amsterdam ?d) (assigned ?d) (not (token ?t)) (consumed ?t))
  )

  ;; Assign day1 to Riga (uses one Riga token)
  (:action assign-day1-riga
    :parameters (?d - day ?t - tokenr)
    :precondition (and (day ?d) (free ?d) (not (assigned ?d)) (token ?t))
    :effect (and (not (free ?d)) (in riga ?d) (assigned ?d) (not (token ?t)) (consumed ?t))
  )

  ;; Stay in same city for next day: Florence
  (:action assign-next-stay-florence
    :parameters (?dprev - day ?d - day ?t - tokenf)
    :precondition (and (next ?dprev ?d) (free ?d) (in florence ?dprev) (token ?t))
    :effect (and (not (free ?d)) (in florence ?d) (assigned ?d) (not (token ?t)) (consumed ?t))
  )

  ;; Stay in same city for next day: Amsterdam
  (:action assign-next-stay-amsterdam
    :parameters (?dprev - day ?d - day ?t - tokena)
    :precondition (and (next ?dprev ?d) (free ?d) (in amsterdam ?dprev) (token ?t))
    :effect (and (not (free ?d)) (in amsterdam ?d) (assigned ?d) (not (token ?t)) (consumed ?t))
  )

  ;; Stay in same city for next day: Riga
  (:action assign-next-stay-riga
    :parameters (?dprev - day ?d - day ?t - tokenr)
    :precondition (and (next ?dprev ?d) (free ?d) (in riga ?dprev) (token ?t))
    :effect (and (not (free ?d)) (in riga ?d) (assigned ?d) (not (token ?t)) (consumed ?t))
  )

  ;; Fly from Florence to Amsterdam (consumes Amsterdam token)
  (:action assign-next-fly-florence-to-amsterdam
    :parameters (?dprev - day ?d - day ?t - tokena)
    :precondition (and (next ?dprev ?d) (free ?d) (in florence ?dprev) (flight florence amsterdam) (token ?t))
    :effect (and (not (free ?d)) (in amsterdam ?d) (assigned ?d) (not (token ?t)) (consumed ?t))
  )

  ;; Fly from Amsterdam to Florence (consumes Florence token)
  (:action assign-next-fly-amsterdam-to-florence
    :parameters (?dprev - day ?d - day ?t - tokenf)
    :precondition (and (next ?dprev ?d) (free ?d) (in amsterdam ?dprev) (flight amsterdam florence) (token ?t))
    :effect (and (not (free ?d)) (in florence ?d) (assigned ?d) (not (token ?t)) (consumed ?t) (workshop-done))
  )

  ;; Fly from Amsterdam to Riga (consumes Riga token)
  (:action assign-next-fly-amsterdam-to-riga
    :parameters (?dprev - day ?d - day ?t - tokenr)
    :precondition (and (next ?dprev ?d) (free ?d) (in amsterdam ?dprev) (flight amsterdam riga) (token ?t))
    :effect (and (not (free ?d)) (in riga ?d) (assigned ?d) (not (token ?t)) (consumed ?t))
  )

  ;; Fly from Riga to Amsterdam (consumes Amsterdam token)
  (:action assign-next-fly-riga-to-amsterdam
    :parameters (?dprev - day ?d - day ?t - tokena)
    :precondition (and (next ?dprev ?d) (free ?d) (in riga ?dprev) (flight riga amsterdam) (token ?t))
    :effect (and (not (free ?d)) (in amsterdam ?d) (assigned ?d) (not (token ?t)) (consumed ?t))
  )

  ;; Additional variants to set workshop when assigning Florence on days in workshop range.
  (:action assign-next-stay-florence-workshop
    :parameters (?dprev - day ?d - day ?t - tokenf)
    :precondition (and (next ?dprev ?d) (free ?d) (in florence ?dprev) (token ?t) (in-workshop-range ?d))
    :effect (and (not (free ?d)) (in florence ?d) (assigned ?d) (not (token ?t)) (consumed ?t) (workshop-done))
  )

  (:action assign-next-fly-amsterdam-to-florence-workshop
    :parameters (?dprev - day ?d - day ?t - tokenf)
    :precondition (and (next ?dprev ?d) (free ?d) (in amsterdam ?dprev) (flight amsterdam florence) (token ?t) (in-workshop-range ?d))
    :effect (and (not (free ?d)) (in florence ?d) (assigned ?d) (not (token ?t)) (consumed ?t) (workshop-done))
  )

  ;; -----------------------
  ;; Flight planner actions
  ;; -----------------------

  ; Fly only if there is an explicit direct connection.
  ; Each flight consumes exactly one day (moves day-now from ?cur to ?prev).
  (:action fly
    :parameters (?from - city ?to - city ?cur - day ?prev - day)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (day-now ?cur)
      (earlier-of ?prev ?cur)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?to)
      (not (day-now ?cur))
      (day-now ?prev)
    )
  )

)