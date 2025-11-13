(define (domain trip-itinerary)
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
    (available-ctoken ?t - ctoken)
    (available-vtoken ?t - vtoken)
    (available-ltoken ?t - ltoken)
    (accounted-vienna ?d - day)
    (accounted-lyon ?d - day)
  )
  (:functions
    (total-cost)
  )

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
      (assigned ?nd)
      (at ?nd copenhagen)
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
      (assigned ?nd)
      (at ?nd vienna)
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
      (assigned ?nd)
      (at ?nd lyon)
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
      (assigned ?nd)
      (at ?nd vienna)
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
      (assigned ?nd)
      (at ?nd copenhagen)
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
      (assigned ?nd)
      (at ?nd lyon)
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
      (assigned ?nd)
      (at ?nd vienna)
    )
  )

  (:action finalize-schedule
    :parameters (?ld - day)
    :precondition (and
      (last ?ld)
      (assigned ?ld)
      (not (finished))
    )
    :effect (finished)
  )

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