(define (domain itinerary)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    day city ctoken vtoken ltoken
  )
  (:predicates
    (succ ?d - day ?nd - day)
    (last ?d - day)
    (assigned ?d - day)
    (at ?d - day ?c - city)
    (connected ?c1 - city ?c2 - city)
    (finished)
    (available-ctoken ?t - ctoken)     ; Copenhagen day-quota tokens (4 for D2..D11 => total 5 incl. D1)
    (available-vtoken ?t - vtoken)     ; Vienna preference tokens (4 target)
    (available-ltoken ?t - ltoken)     ; Lyon preference tokens (4 target)
    (accounted-vienna ?d - day)        ; to ensure each Vienna day is matched at most once
    (accounted-lyon ?d - day)          ; to ensure each Lyon day is matched at most once
  )
  (:functions
    (total-cost)
  )

  ;===== Day-to-day assignment actions (exactly one transition per day) =====

  (:action stay-copenhagen
    :parameters (?d - day ?nd - day ?t - ctoken)
    :precondition (and
      (succ ?d ?nd)
      (assigned ?d)
      (not (assigned ?nd))
      (at ?d copenhagen)
      (available-ctoken ?t)
      (not (finished))
    )
    :effect (and
      (at ?nd copenhagen)
      (assigned ?nd)
      (not (available-ctoken ?t))
    )
  )

  (:action stay-vienna
    :parameters (?d - day ?nd - day)
    :precondition (and
      (succ ?d ?nd)
      (assigned ?d)
      (not (assigned ?nd))
      (at ?d vienna)
      (not (finished))
    )
    :effect (and
      (at ?nd vienna)
      (assigned ?nd)
    )
  )

  (:action stay-lyon
    :parameters (?d - day ?nd - day)
    :precondition (and
      (succ ?d ?nd)
      (assigned ?d)
      (not (assigned ?nd))
      (at ?d lyon)
      (not (finished))
    )
    :effect (and
      (at ?nd lyon)
      (assigned ?nd)
    )
  )

  (:action fly-copenhagen-vienna
    :parameters (?d - day ?nd - day)
    :precondition (and
      (succ ?d ?nd)
      (assigned ?d)
      (not (assigned ?nd))
      (at ?d copenhagen)
      (connected copenhagen vienna)
      (not (finished))
    )
    :effect (and
      (at ?nd vienna)
      (assigned ?nd)
    )
  )

  (:action fly-vienna-copenhagen
    :parameters (?d - day ?nd - day ?t - ctoken)
    :precondition (and
      (succ ?d ?nd)
      (assigned ?d)
      (not (assigned ?nd))
      (at ?d vienna)
      (connected vienna copenhagen)
      (available-ctoken ?t)
      (not (finished))
    )
    :effect (and
      (at ?nd copenhagen)
      (assigned ?nd)
      (not (available-ctoken ?t))
    )
  )

  (:action fly-vienna-lyon
    :parameters (?d - day ?nd - day)
    :precondition (and
      (succ ?d ?nd)
      (assigned ?d)
      (not (assigned ?nd))
      (at ?d vienna)
      (connected vienna lyon)
      (not (finished))
    )
    :effect (and
      (at ?nd lyon)
      (assigned ?nd)
    )
  )

  (:action fly-lyon-vienna
    :parameters (?d - day ?nd - day)
    :precondition (and
      (succ ?d ?nd)
      (assigned ?d)
      (not (assigned ?nd))
      (at ?d lyon)
      (connected lyon vienna)
      (not (finished))
    )
    :effect (and
      (at ?nd vienna)
      (assigned ?nd)
    )
  )

  ;===== Finalization before soft-preference settlement =====

  (:action finalize-schedule
    :parameters (?ld - day)
    :precondition (and
      (last ?ld)
      (assigned ?ld)
      (not (finished))
    )
    :effect (finished)
  )

  ;===== Post-schedule accounting for Vienna/Lyon preference tokens =====
  ; Match each actual Vienna/Lyon day to one zero-cost token (up to 4).
  ; Any remaining tokens must be cleared by pay-* actions at cost 1 each.

  (:action account-vienna-day
    :parameters (?d - day ?t - vtoken)
    :precondition (and
      (finished)
      (at ?d vienna)
      (not (accounted-vienna ?d))
      (available-vtoken ?t)
    )
    :effect (and
      (accounted-vienna ?d)
      (not (available-vtoken ?t))
    )
  )

  (:action account-lyon-day
    :parameters (?d - day ?t - ltoken)
    :precondition (and
      (finished)
      (at ?d lyon)
      (not (accounted-lyon ?d))
      (available-ltoken ?t)
    )
    :effect (and
      (accounted-lyon ?d)
      (not (available-ltoken ?t))
    )
  )

  (:action pay-vienna-shortfall
    :parameters (?t - vtoken)
    :precondition (and
      (finished)
      (available-vtoken ?t)
    )
    :effect (and
      (not (available-vtoken ?t))
      (increase (total-cost) 1)
    )
  )

  (:action pay-lyon-shortfall
    :parameters (?t - ltoken)
    :precondition (and
      (finished)
      (available-ltoken ?t)
    )
    :effect (and
      (not (available-ltoken ?t))
      (increase (total-cost) 1)
    )
  )
)