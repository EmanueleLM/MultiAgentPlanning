(define (domain integrated-trip-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day rreq vreq ereq)
  (:constants reykjavik vienna venice - city)

  (:predicates
    (assigned ?d - day)
    (in-reykjavik ?d - day)
    (in-vienna ?d - day)
    (in-venice ?d - day)
    (consecutive ?d1 - day ?d2 - day)
    (direct ?c1 - city ?c2 - city)
    (wedding-day ?d - day)
    (wedding-attended)
    (rreq-available ?r - rreq)
    (rreq-used ?r - rreq)
    (vreq-available ?v - vreq)
    (vreq-used ?v - vreq)
    (ereq-available ?e - ereq)
    (ereq-used ?e - ereq)
  )

  (:action assign-initial-reykjavik
    :parameters (?d - day ?r - rreq)
    :precondition (and
      (not (assigned ?d))
      (rreq-available ?r)
    )
    :effect (and
      (assigned ?d)
      (in-reykjavik ?d)
      (not (rreq-available ?r))
      (rreq-used ?r)
    )
  )

  (:action assign-initial-vienna
    :parameters (?d - day ?v - vreq)
    :precondition (and
      (not (assigned ?d))
      (vreq-available ?v)
    )
    :effect (and
      (assigned ?d)
      (in-vienna ?d)
      (not (vreq-available ?v))
      (vreq-used ?v)
    )
  )

  (:action assign-initial-venice
    :parameters (?d - day ?e - ereq)
    :precondition (and
      (not (assigned ?d))
      (ereq-available ?e)
    )
    :effect (and
      (assigned ?d)
      (in-venice ?d)
      (not (ereq-available ?e))
      (ereq-used ?e)
    )
  )

  (:action assign-after-reykjavik-reykjavik
    :parameters (?prev - day ?d - day ?r - rreq)
    :precondition (and
      (consecutive ?prev ?d)
      (assigned ?prev)
      (in-reykjavik ?prev)
      (not (assigned ?d))
      (rreq-available ?r)
    )
    :effect (and
      (assigned ?d)
      (in-reykjavik ?d)
      (not (rreq-available ?r))
      (rreq-used ?r)
    )
  )

  (:action assign-after-reykjavik-vienna
    :parameters (?prev - day ?d - day ?v - vreq)
    :precondition (and
      (consecutive ?prev ?d)
      (assigned ?prev)
      (in-reykjavik ?prev)
      (not (assigned ?d))
      (vreq-available ?v)
      (direct reykjavik vienna)
    )
    :effect (and
      (assigned ?d)
      (in-vienna ?d)
      (not (vreq-available ?v))
      (vreq-used ?v)
    )
  )

  (:action assign-after-vienna-vienna
    :parameters (?prev - day ?d - day ?v - vreq)
    :precondition (and
      (consecutive ?prev ?d)
      (assigned ?prev)
      (in-vienna ?prev)
      (not (assigned ?d))
      (vreq-available ?v)
    )
    :effect (and
      (assigned ?d)
      (in-vienna ?d)
      (not (vreq-available ?v))
      (vreq-used ?v)
    )
  )

  (:action assign-after-vienna-reykjavik
    :parameters (?prev - day ?d - day ?r - rreq)
    :precondition (and
      (consecutive ?prev ?d)
      (assigned ?prev)
      (in-vienna ?prev)
      (not (assigned ?d))
      (rreq-available ?r)
      (direct vienna reykjavik)
    )
    :effect (and
      (assigned ?d)
      (in-reykjavik ?d)
      (not (rreq-available ?r))
      (rreq-used ?r)
    )
  )

  (:action assign-after-vienna-venice
    :parameters (?prev - day ?d - day ?e - ereq)
    :precondition (and
      (consecutive ?prev ?d)
      (assigned ?prev)
      (in-vienna ?prev)
      (not (assigned ?d))
      (ereq-available ?e)
      (direct vienna venice)
    )
    :effect (and
      (assigned ?d)
      (in-venice ?d)
      (not (ereq-available ?e))
      (ereq-used ?e)
    )
  )

  (:action assign-after-venice-venice
    :parameters (?prev - day ?d - day ?e - ereq)
    :precondition (and
      (consecutive ?prev ?d)
      (assigned ?prev)
      (in-venice ?prev)
      (not (assigned ?d))
      (ereq-available ?e)
    )
    :effect (and
      (assigned ?d)
      (in-venice ?d)
      (not (ereq-available ?e))
      (ereq-used ?e)
    )
  )

  (:action assign-after-venice-vienna
    :parameters (?prev - day ?d - day ?v - vreq)
    :precondition (and
      (consecutive ?prev ?d)
      (assigned ?prev)
      (in-venice ?prev)
      (not (assigned ?d))
      (vreq-available ?v)
      (direct venice vienna)
    )
    :effect (and
      (assigned ?d)
      (in-vienna ?d)
      (not (vreq-available ?v))
      (vreq-used ?v)
    )
  )

  (:action attend-wedding
    :parameters (?d - day)
    :precondition (and (in-venice ?d) (wedding-day ?d) (not (wedding-attended)))
    :effect (and (wedding-attended))
  )
)