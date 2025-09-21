(define (domain integrated-itinerary)
  (:requirements :typing :negative-preconditions)
  (:types city day token tokenf tokena tokenr - token)

  (:predicates
    (is-day ?d - day)
    (next ?d1 - day ?d2 - day)
    (free ?d - day)
    (in ?c - city ?d - day)
    (assigned ?d - day)
    (flight ?c1 - city ?c2 - city)
    (is-token ?t - token)
    (consumed ?t - token)
    (workshop-done)
    (in-workshop-range ?d - day)
    (visited ?c - city)
  )

  (:action assign-day1-florence
    :parameters (?d - day ?t - tokenf)
    :precondition (and (is-day ?d) (free ?d) (not (assigned ?d)) (is-token ?t) (in-workshop-range ?d))
    :effect (and (not (free ?d)) (in florence ?d) (assigned ?d) (not (is-token ?t)) (consumed ?t) (workshop-done) (visited florence))
  )

  (:action assign-day1-amsterdam
    :parameters (?d - day ?t - tokena)
    :precondition (and (is-day ?d) (free ?d) (not (assigned ?d)) (is-token ?t))
    :effect (and (not (free ?d)) (in amsterdam ?d) (assigned ?d) (not (is-token ?t)) (consumed ?t) (visited amsterdam))
  )

  (:action assign-day1-riga
    :parameters (?d - day ?t - tokenr)
    :precondition (and (is-day ?d) (free ?d) (not (assigned ?d)) (is-token ?t))
    :effect (and (not (free ?d)) (in riga ?d) (assigned ?d) (not (is-token ?t)) (consumed ?t) (visited riga))
  )

  (:action assign-next-stay-florence
    :parameters (?dprev - day ?d - day ?t - tokenf)
    :precondition (and (next ?dprev ?d) (free ?d) (in florence ?dprev) (is-token ?t))
    :effect (and (not (free ?d)) (in florence ?d) (assigned ?d) (not (is-token ?t)) (consumed ?t) (visited florence))
  )

  (:action assign-next-stay-florence-workshop
    :parameters (?dprev - day ?d - day ?t - tokenf)
    :precondition (and (next ?dprev ?d) (free ?d) (in florence ?dprev) (is-token ?t) (in-workshop-range ?d))
    :effect (and (not (free ?d)) (in florence ?d) (assigned ?d) (not (is-token ?t)) (consumed ?t) (workshop-done) (visited florence))
  )

  (:action assign-next-stay-amsterdam
    :parameters (?dprev - day ?d - day ?t - tokena)
    :precondition (and (next ?dprev ?d) (free ?d) (in amsterdam ?dprev) (is-token ?t))
    :effect (and (not (free ?d)) (in amsterdam ?d) (assigned ?d) (not (is-token ?t)) (consumed ?t) (visited amsterdam))
  )

  (:action assign-next-stay-riga
    :parameters (?dprev - day ?d - day ?t - tokenr)
    :precondition (and (next ?dprev ?d) (free ?d) (in riga ?dprev) (is-token ?t))
    :effect (and (not (free ?d)) (in riga ?d) (assigned ?d) (not (is-token ?t)) (consumed ?t) (visited riga))
  )

  (:action assign-next-fly-florence-to-amsterdam
    :parameters (?dprev - day ?d - day ?t - tokena)
    :precondition (and (next ?dprev ?d) (free ?d) (in florence ?dprev) (flight florence amsterdam) (is-token ?t))
    :effect (and (not (free ?d)) (in amsterdam ?d) (assigned ?d) (not (is-token ?t)) (consumed ?t) (visited amsterdam))
  )

  (:action assign-next-fly-amsterdam-to-florence
    :parameters (?dprev - day ?d - day ?t - tokenf)
    :precondition (and (next ?dprev ?d) (free ?d) (in amsterdam ?dprev) (flight amsterdam florence) (is-token ?t))
    :effect (and (not (free ?d)) (in florence ?d) (assigned ?d) (not (is-token ?t)) (consumed ?t) (visited florence))
  )

  (:action assign-next-fly-amsterdam-to-riga
    :parameters (?dprev - day ?d - day ?t - tokenr)
    :precondition (and (next ?dprev ?d) (free ?d) (in amsterdam ?dprev) (flight amsterdam riga) (is-token ?t))
    :effect (and (not (free ?d)) (in riga ?d) (assigned ?d) (not (is-token ?t)) (consumed ?t) (visited riga))
  )

  (:action assign-next-fly-riga-to-amsterdam
    :parameters (?dprev - day ?d - day ?t - tokena)
    :precondition (and (next ?dprev ?d) (free ?d) (in riga ?dprev) (flight riga amsterdam) (is-token ?t))
    :effect (and (not (free ?d)) (in amsterdam ?d) (assigned ?d) (not (is-token ?t)) (consumed ?t) (visited amsterdam))
  )

  (:action assign-next-fly-amsterdam-to-florence-workshop
    :parameters (?dprev - day ?d - day ?t - tokenf)
    :precondition (and (next ?dprev ?d) (free ?d) (in amsterdam ?dprev) (flight amsterdam florence) (is-token ?t) (in-workshop-range ?d))
    :effect (and (not (free ?d)) (in florence ?d) (assigned ?d) (not (is-token ?t)) (consumed ?t) (workshop-done) (visited florence))
  )
)