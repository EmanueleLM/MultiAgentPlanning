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

  ;-------------------------
  ; First-day assignment actions (start of trip)
  ; Separate actions per city so that Zurich-day-in-window can add wedding-attended.
  ;-------------------------

  (:action assign-first-rome
    :parameters (?t - token ?d - day ?dnext - day ?rome - city)
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

  ;-------------------------
  ; Transition assignment actions (assign city on day D given previous day D-1 city)
  ; These enforce that movement between different cities is only allowed when (can-move prev city) holds.
  ; There are separate actions for Rome, Lyon, Zurich; Zurich actions split on wedding-window predicate.
  ;-------------------------

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

  ; no other actions are provided: moving between cities not listed as can-move is forbidden by absence of can-move facts.
)