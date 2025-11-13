(define (domain trip-17days)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)
  (:predicates
    (next ?d - day ?dn - day)
    (lastday ?d - day)
    (current ?d - day)
    (unassigned ?d - day)
    (scheduled ?d - day)
    (assigned ?d - day ?c - city)
    (started)
    (last ?c - city)
    (flight ?c1 - city ?c2 - city)
    (require-lyon ?d - day)
    (is-lyon ?c - city)
  )

  ; Non-Lyon day: first assignment on a mid (non-final) day, city must not be Lyon
  (:action assign-first-nonlyon-mid
    :parameters (?d - day ?c - city ?dn - day)
    :precondition (and (current ?d) (unassigned ?d) (not (started))
                       (not (require-lyon ?d)) (not (lastday ?d)) (next ?d ?dn)
                       (not (is-lyon ?c)))
    :effect (and (assigned ?d ?c) (scheduled ?d) (not (unassigned ?d))
                 (started) (last ?c) (not (current ?d)) (current ?dn))
  )

  ; Non-Lyon day: first assignment on the final day (edge case if final not Lyon-required)
  (:action assign-first-nonlyon-final
    :parameters (?d - day ?c - city)
    :precondition (and (current ?d) (unassigned ?d) (not (started))
                       (not (require-lyon ?d)) (lastday ?d)
                       (not (is-lyon ?c)))
    :effect (and (assigned ?d ?c) (scheduled ?d) (not (unassigned ?d))
                 (started) (last ?c) (not (current ?d)))
  )

  ; Non-Lyon day: stay in same city on a mid day
  (:action assign-same-nonlyon-mid
    :parameters (?d - day ?c - city ?dn - day)
    :precondition (and (started) (current ?d) (unassigned ?d)
                       (last ?c) (not (require-lyon ?d))
                       (not (is-lyon ?c))
                       (not (lastday ?d)) (next ?d ?dn))
    :effect (and (assigned ?d ?c) (scheduled ?d) (not (unassigned ?d))
                 (not (current ?d)) (current ?dn))
  )

  ; Non-Lyon day: stay in same city on the final day
  (:action assign-same-nonlyon-final
    :parameters (?d - day ?c - city)
    :precondition (and (started) (current ?d) (unassigned ?d)
                       (last ?c) (not (require-lyon ?d))
                       (not (is-lyon ?c))
                       (lastday ?d))
    :effect (and (assigned ?d ?c) (scheduled ?d) (not (unassigned ?d))
                 (not (current ?d)))
  )

  ; Non-Lyon day: change city with required direct flight on a mid day
  (:action assign-change-nonlyon-mid
    :parameters (?d - day ?prev - city ?c - city ?dn - day)
    :precondition (and (started) (current ?d) (unassigned ?d)
                       (last ?prev) (not (last ?c)) (flight ?prev ?c)
                       (not (require-lyon ?d))
                       (not (is-lyon ?c))
                       (not (lastday ?d)) (next ?d ?dn))
    :effect (and (assigned ?d ?c) (scheduled ?d) (not (unassigned ?d))
                 (not (last ?prev)) (last ?c)
                 (not (current ?d)) (current ?dn))
  )

  ; Non-Lyon day: change city with required direct flight on the final day
  (:action assign-change-nonlyon-final
    :parameters (?d - day ?prev - city ?c - city)
    :precondition (and (started) (current ?d) (unassigned ?d)
                       (last ?prev) (not (last ?c)) (flight ?prev ?c)
                       (not (require-lyon ?d))
                       (not (is-lyon ?c))
                       (lastday ?d))
    :effect (and (assigned ?d ?c) (scheduled ?d) (not (unassigned ?d))
                 (not (last ?prev)) (last ?c)
                 (not (current ?d)))
  )

  ; Lyon-required day: first assignment on a mid day (must assign Lyon)
  (:action assign-first-lyon-mid
    :parameters (?d - day ?dn - day)
    :precondition (and (current ?d) (unassigned ?d) (not (started))
                       (require-lyon ?d) (not (lastday ?d)) (next ?d ?dn))
    :effect (and (assigned ?d lyon) (scheduled ?d) (not (unassigned ?d))
                 (started) (last lyon) (not (current ?d)) (current ?dn))
  )

  ; Lyon-required day: first assignment on the final day (must assign Lyon)
  (:action assign-first-lyon-final
    :parameters (?d - day)
    :precondition (and (current ?d) (unassigned ?d) (not (started))
                       (require-lyon ?d) (lastday ?d))
    :effect (and (assigned ?d lyon) (scheduled ?d) (not (unassigned ?d))
                 (started) (last lyon) (not (current ?d)))
  )

  ; Lyon-required day: stay in Lyon on a mid day
  (:action assign-same-lyon-mid
    :parameters (?d - day ?dn - day)
    :precondition (and (started) (current ?d) (unassigned ?d)
                       (require-lyon ?d) (last lyon)
                       (not (lastday ?d)) (next ?d ?dn))
    :effect (and (assigned ?d lyon) (scheduled ?d) (not (unassigned ?d))
                 (not (current ?d)) (current ?dn))
  )

  ; Lyon-required day: stay in Lyon on the final day
  (:action assign-same-lyon-final
    :parameters (?d - day)
    :precondition (and (started) (current ?d) (unassigned ?d)
                       (require-lyon ?d) (last lyon) (lastday ?d))
    :effect (and (assigned ?d lyon) (scheduled ?d) (not (unassigned ?d))
                 (not (current ?d)))
  )

  ; Lyon-required day: change into Lyon with required direct flight on a mid day
  (:action assign-change-to-lyon-mid
    :parameters (?d - day ?prev - city ?dn - day)
    :precondition (and (started) (current ?d) (unassigned ?d)
                       (require-lyon ?d) (last ?prev) (not (last lyon))
                       (flight ?prev lyon)
                       (not (lastday ?d)) (next ?d ?dn))
    :effect (and (assigned ?d lyon) (scheduled ?d) (not (unassigned ?d))
                 (not (last ?prev)) (last lyon)
                 (not (current ?d)) (current ?dn))
  )

  ; Lyon-required day: change into Lyon with required direct flight on the final day
  (:action assign-change-to-lyon-final
    :parameters (?d - day ?prev - city)
    :precondition (and (started) (current ?d) (unassigned ?d)
                       (require-lyon ?d) (last ?prev) (not (last lyon))
                       (flight ?prev lyon)
                       (lastday ?d))
    :effect (and (assigned ?d lyon) (scheduled ?d) (not (unassigned ?d))
                 (not (last ?prev)) (last lyon)
                 (not (current ?d)))
  )
)