(define (domain travel-multiagent)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types city day token)

  (:predicates
    (current-day ?d - day)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (can-move ?from - city ?to - city)
    (available ?t - token)
    (consumed ?t - token)
    (token-of ?t - token ?c - city)
    (wedding-window ?d - day)
    (wedding-attended)
  )

  (:action assign-first-rome
    :parameters (?t - token ?d - day ?dnext - day)
    :precondition (and
      (current-day ?d)
      (next ?d ?dnext)
      (available ?t)
      (token-of ?t rome)
    )
    :effect (and
      (at rome ?d)
      (consumed ?t)
      (not (available ?t))
      (not (current-day ?d))
      (current-day ?dnext)
    )
  )

  (:action assign-first-lyon
    :parameters (?t - token ?d - day ?dnext - day)
    :precondition (and
      (current-day ?d)
      (next ?d ?dnext)
      (available ?t)
      (token-of ?t lyon)
    )
    :effect (and
      (at lyon ?d)
      (consumed ?t)
      (not (available ?t))
      (not (current-day ?d))
      (current-day ?dnext)
    )
  )

  (:action assign-first-zurich-window
    :parameters (?t - token ?d - day ?dnext - day)
    :precondition (and
      (current-day ?d)
      (next ?d ?dnext)
      (available ?t)
      (token-of ?t zurich)
      (wedding-window ?d)
    )
    :effect (and
      (at zurich ?d)
      (consumed ?t)
      (not (available ?t))
      (not (current-day ?d))
      (current-day ?dnext)
      (wedding-attended)
    )
  )

  (:action assign-first-zurich-nonwindow
    :parameters (?t - token ?d - day ?dnext - day)
    :precondition (and
      (current-day ?d)
      (next ?d ?dnext)
      (available ?t)
      (token-of ?t zurich)
      (not (wedding-window ?d))
    )
    :effect (and
      (at zurich ?d)
      (consumed ?t)
      (not (available ?t))
      (not (current-day ?d))
      (current-day ?dnext)
    )
  )

  (:action assign-rome-after
    :parameters (?prev - city ?t - token ?dprev - day ?d - day ?dnext - day)
    :precondition (and
      (current-day ?d)
      (next ?dprev ?d)
      (next ?d ?dnext)
      (at ?prev ?dprev)
      (can-move ?prev rome)
      (available ?t)
      (token-of ?t rome)
    )
    :effect (and
      (at rome ?d)
      (consumed ?t)
      (not (available ?t))
      (not (current-day ?d))
      (current-day ?dnext)
    )
  )

  (:action assign-lyon-after
    :parameters (?prev - city ?t - token ?dprev - day ?d - day ?dnext - day)
    :precondition (and
      (current-day ?d)
      (next ?dprev ?d)
      (next ?d ?dnext)
      (at ?prev ?dprev)
      (can-move ?prev lyon)
      (available ?t)
      (token-of ?t lyon)
    )
    :effect (and
      (at lyon ?d)
      (consumed ?t)
      (not (available ?t))
      (not (current-day ?d))
      (current-day ?dnext)
    )
  )

  (:action assign-zurich-after-window
    :parameters (?prev - city ?t - token ?dprev - day ?d - day ?dnext - day)
    :precondition (and
      (current-day ?d)
      (next ?dprev ?d)
      (next ?d ?dnext)
      (at ?prev ?dprev)
      (can-move ?prev zurich)
      (available ?t)
      (token-of ?t zurich)
      (wedding-window ?d)
    )
    :effect (and
      (at zurich ?d)
      (consumed ?t)
      (not (available ?t))
      (not (current-day ?d))
      (current-day ?dnext)
      (wedding-attended)
    )
  )

  (:action assign-zurich-after-nonwindow
    :parameters (?prev - city ?t - token ?dprev - day ?d - day ?dnext - day)
    :precondition (and
      (current-day ?d)
      (next ?dprev ?d)
      (next ?d ?dnext)
      (at ?prev ?dprev)
      (can-move ?prev zurich)
      (available ?t)
      (token-of ?t zurich)
      (not (wedding-window ?d))
    )
    :effect (and
      (at zurich ?d)
      (consumed ?t)
      (not (available ?t))
      (not (current-day ?d))
      (current-day ?dnext)
    )
  )
)