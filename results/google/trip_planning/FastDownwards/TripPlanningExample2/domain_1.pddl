(define (domain integrated-trip-domain)
  (:requirements :strips :typing :negative-preconditions :conditional-effects :action-costs)
  (:types city day rreq vreq)

  (:predicates
    (assigned ?d - day)
    (in-vienna ?d - day)
    (in-venice ?d - day)
    (in-reykjavik ?d - day)
    (consecutive ?d1 - day ?d2 - day)
    (direct ?c1 - city ?c2 - city)
    (wedding-day ?d - day)
    (wedding-attended)
    (is-reykjavik ?c - city)
    (rreq-available ?r - rreq)
    (rreq-used ?r - rreq)
    (vreq-available ?v - vreq)
    (vreq-used ?v - vreq)
  )

  (:functions (total-cost))

  ;; Reykjavik single-day assignment: consumes one Reykjavik requirement token
  (:action assign-reykjavik-day
    :parameters (?d - day ?r - rreq ?c - city)
    :precondition (and
      (not (assigned ?d))
      (rreq-available ?r)
      (is-reykjavik ?c)
    )
    :effect (and
      (assigned ?d)
      (in-reykjavik ?d)
      (not (rreq-available ?r))
      (rreq-used ?r)
      (increase (total-cost) 1)
    )
  )

  ;; Reykjavik two consecutive days: consumes two Reykjavik tokens
  (:action assign-reykjavik-reykjavik
    :parameters (?d1 - day ?d2 - day ?r1 - rreq ?r2 - rreq ?c - city)
    :precondition (and
      (consecutive ?d1 ?d2)
      (not (assigned ?d1)) (not (assigned ?d2))
      (rreq-available ?r1) (rreq-available ?r2)
      (is-reykjavik ?c)
    )
    :effect (and
      (assigned ?d1) (assigned ?d2)
      (in-reykjavik ?d1) (in-reykjavik ?d2)
      (not (rreq-available ?r1)) (rreq-used ?r1)
      (not (rreq-available ?r2)) (rreq-used ?r2)
      (increase (total-cost) 2)
    )
  )

  ;; Reykjavik then Vienna on consecutive days (requires direct flight). Consumes one Reykjavik token and one Vienna token.
  (:action assign-reykjavik-vienna
    :parameters (?d1 - day ?d2 - day ?r - rreq ?v - vreq ?rc - city ?vc - city)
    :precondition (and
      (consecutive ?d1 ?d2)
      (not (assigned ?d1)) (not (assigned ?d2))
      (rreq-available ?r)
      (vreq-available ?v)
      (is-reykjavik ?rc)
      (direct ?rc ?vc)
      ;; ensure the destination is Vienna
      (not (is-reykjavik ?vc))
    )
    :effect (and
      (assigned ?d1) (assigned ?d2)
      (in-reykjavik ?d1) (in-vienna ?d2)
      (not (rreq-available ?r)) (rreq-used ?r)
      (not (vreq-available ?v)) (vreq-used ?v)
      (when (wedding-day ?d2) (wedding-attended))
      (increase (total-cost) 2)
    )
  )

  ;; Vienna then Reykjavik on consecutive days (requires direct Vienna->Reykjavik). Consumes one Vienna token and one Reykjavik token.
  (:action assign-vienna-reykjavik
    :parameters (?d1 - day ?d2 - day ?v - vreq ?r - rreq ?rc - city ?vc - city)
    :precondition (and
      (consecutive ?d1 ?d2)
      (not (assigned ?d1)) (not (assigned ?d2))
      (vreq-available ?v)
      (rreq-available ?r)
      (is-reykjavik ?rc)
      (direct ?vc ?rc)
    )
    :effect (and
      (assigned ?d1) (assigned ?d2)
      (in-vienna ?d1) (in-reykjavik ?d2)
      (not (vreq-available ?v)) (vreq-used ?v)
      (not (rreq-available ?r)) (rreq-used ?r)
      (increase (total-cost) 2)
    )
  )

  ;; Assign a single day to Vienna; consumes one Vienna token
  (:action assign-vienna-day
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
      (increase (total-cost) 1)
    )
  )

  ;; Assign a single day to Venice
  (:action assign-venice-day
    :parameters (?d - day)
    :precondition (not (assigned ?d))
    :effect (and
      (assigned ?d)
      (in-venice ?d)
      (increase (total-cost) 1)
    )
  )

  ;; Two consecutive Vienna days consuming two Vienna tokens
  (:action assign-vienna-vienna
    :parameters (?d1 - day ?d2 - day ?v1 - vreq ?v2 - vreq)
    :precondition (and
      (consecutive ?d1 ?d2)
      (not (assigned ?d1)) (not (assigned ?d2))
      (vreq-available ?v1) (vreq-available ?v2)
    )
    :effect (and
      (assigned ?d1) (assigned ?d2)
      (in-vienna ?d1) (in-vienna ?d2)
      (not (vreq-available ?v1)) (vreq-used ?v1)
      (not (vreq-available ?v2)) (vreq-used ?v2)
      (increase (total-cost) 2)
    )
  )

  ;; Vienna then Venice on consecutive days (requires direct Vienna->Venice). Consumes one Vienna token.
  (:action assign-vienna-venice
    :parameters (?d1 - day ?d2 - day ?v - vreq ?vc1 - city ?vc2 - city)
    :precondition (and
      (consecutive ?d1 ?d2)
      (not (assigned ?d1)) (not (assigned ?d2))
      (vreq-available ?v)
      (direct ?vc1 ?vc2)
    )
    :effect (and
      (assigned ?d1) (assigned ?d2)
      (in-vienna ?d1) (in-venice ?d2)
      (not (vreq-available ?v)) (vreq-used ?v)
      (when (wedding-day ?d2) (wedding-attended))
      (increase (total-cost) 2)
    )
  )

  ;; Venice then Vienna on consecutive days (requires direct Venice->Vienna). Consumes one Vienna token.
  (:action assign-venice-vienna
    :parameters (?d1 - day ?d2 - day ?v - vreq ?vc1 - city ?vc2 - city)
    :precondition (and
      (consecutive ?d1 ?d2)
      (not (assigned ?d1)) (not (assigned ?d2))
      (vreq-available ?v)
      (direct ?vc1 ?vc2)
    )
    :effect (and
      (assigned ?d1) (assigned ?d2)
      (in-venice ?d1) (in-vienna ?d2)
      (not (vreq-available ?v)) (vreq-used ?v)
      (when (wedding-day ?d1) (wedding-attended))
      (increase (total-cost) 2)
    )
  )

  ;; Two consecutive Venice days
  (:action assign-venice-venice
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (consecutive ?d1 ?d2)
      (not (assigned ?d1)) (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d1) (assigned ?d2)
      (in-venice ?d1) (in-venice ?d2)
      (when (wedding-day ?d1) (wedding-attended))
      (when (wedding-day ?d2) (wedding-attended))
      (increase (total-cost) 2)
    )
  )

  ;; Attend wedding explicitly if on a Venice wedding day
  (:action attend-wedding
    :parameters (?d - day)
    :precondition (and (in-venice ?d) (wedding-day ?d) (not (wedding-attended)))
    :effect (and (wedding-attended) (increase (total-cost) 1))
  )

)