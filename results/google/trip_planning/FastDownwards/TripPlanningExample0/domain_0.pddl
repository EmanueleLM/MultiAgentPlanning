(define (domain trip14days)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types city day level)
  (:predicates
    (at ?c - city ?d - day)
    (assigned ?d - day)
    (next ?d1 - day ?d2 - day)
    (first ?d - day)
    (last ?d - day)
    (in-window ?d - day)
    (direct ?c1 - city ?c2 - city)
    (met)
    (sealed)
    (quota-closed ?c - city)
    (current-count ?c - city ?l - level)
    (max-level ?c - city ?l - level)
    (succ ?l1 - level ?l2 - level)
    (is-florence ?c - city)
    (is-barcelona ?c - city)
    (is-helsinki ?c - city)
  )
  (:functions (total-cost))

  ; Start on day 1 in some city, consuming one unit of that city's quota (within-quota start)
  (:action start-day1
    :parameters (?c - city ?d - day ?l1 - level ?l2 - level)
    :precondition (and
      (first ?d)
      (not (assigned ?d))
      (current-count ?c ?l1)
      (succ ?l1 ?l2)
      (not (max-level ?c ?l1))
    )
    :effect (and
      (assigned ?d)
      (at ?c ?d)
      (not (current-count ?c ?l1))
      (current-count ?c ?l2)
    )
  )

  ; Stay in the same city to the next day, within-quota (no cost)
  (:action stay-next-within
    :parameters (?c - city ?dprev - day ?dnext - day ?l1 - level ?l2 - level)
    :precondition (and
      (next ?dprev ?dnext)
      (assigned ?dprev)
      (at ?c ?dprev)
      (not (assigned ?dnext))
      (current-count ?c ?l1)
      (succ ?l1 ?l2)
      (not (max-level ?c ?l1))
    )
    :effect (and
      (assigned ?dnext)
      (at ?c ?dnext)
      (not (current-count ?c ?l1))
      (current-count ?c ?l2)
    )
  )

  ; Fly from one city to another city for the next day, within-quota (only along direct edges, no cost)
  (:action fly-next-within
    :parameters (?from - city ?to - city ?dprev - day ?dnext - day ?l1 - level ?l2 - level)
    :precondition (and
      (next ?dprev ?dnext)
      (assigned ?dprev)
      (at ?from ?dprev)
      (direct ?from ?to)
      (not (assigned ?dnext))
      (current-count ?to ?l1)
      (succ ?l1 ?l2)
      (not (max-level ?to ?l1))
    )
    :effect (and
      (assigned ?dnext)
      (at ?to ?dnext)
      (not (current-count ?to ?l1))
      (current-count ?to ?l2)
    )
  )

  ; Stay over-quota in Florence (adds cost 4 per extra Florence day)
  (:action stay-next-over-florence
    :parameters (?c - city ?dprev - day ?dnext - day ?l - level)
    :precondition (and
      (is-florence ?c)
      (next ?dprev ?dnext)
      (assigned ?dprev)
      (at ?c ?dprev)
      (not (assigned ?dnext))
      (current-count ?c ?l)
      (max-level ?c ?l)
    )
    :effect (and
      (assigned ?dnext)
      (at ?c ?dnext)
      (increase (total-cost) 4)
    )
  )

  ; Stay over-quota in Barcelona (adds cost 3 per extra Barcelona day)
  (:action stay-next-over-barcelona
    :parameters (?c - city ?dprev - day ?dnext - day ?l - level)
    :precondition (and
      (is-barcelona ?c)
      (next ?dprev ?dnext)
      (assigned ?dprev)
      (at ?c ?dprev)
      (not (assigned ?dnext))
      (current-count ?c ?l)
      (max-level ?c ?l)
    )
    :effect (and
      (assigned ?dnext)
      (at ?c ?dnext)
      (increase (total-cost) 3)
    )
  )

  ; Stay over-quota in Helsinki (adds cost 3 per extra Helsinki day)
  (:action stay-next-over-helsinki
    :parameters (?c - city ?dprev - day ?dnext - day ?l - level)
    :precondition (and
      (is-helsinki ?c)
      (next ?dprev ?dnext)
      (assigned ?dprev)
      (at ?c ?dprev)
      (not (assigned ?dnext))
      (current-count ?c ?l)
      (max-level ?c ?l)
    )
    :effect (and
      (assigned ?dnext)
      (at ?c ?dnext)
      (increase (total-cost) 3)
    )
  )

  ; Fly over-quota into Florence (adds cost 4 per extra Florence day)
  (:action fly-next-over-florence
    :parameters (?from - city ?to - city ?dprev - day ?dnext - day ?l - level)
    :precondition (and
      (is-florence ?to)
      (next ?dprev ?dnext)
      (assigned ?dprev)
      (at ?from ?dprev)
      (direct ?from ?to)
      (not (assigned ?dnext))
      (current-count ?to ?l)
      (max-level ?to ?l)
    )
    :effect (and
      (assigned ?dnext)
      (at ?to ?dnext)
      (increase (total-cost) 4)
    )
  )

  ; Fly over-quota into Barcelona (adds cost 3 per extra Barcelona day)
  (:action fly-next-over-barcelona
    :parameters (?from - city ?to - city ?dprev - day ?dnext - day ?l - level)
    :precondition (and
      (is-barcelona ?to)
      (next ?dprev ?dnext)
      (assigned ?dprev)
      (at ?from ?dprev)
      (direct ?from ?to)
      (not (assigned ?dnext))
      (current-count ?to ?l)
      (max-level ?to ?l)
    )
    :effect (and
      (assigned ?dnext)
      (at ?to ?dnext)
      (increase (total-cost) 3)
    )
  )

  ; Fly over-quota into Helsinki (adds cost 3 per extra Helsinki day)
  (:action fly-next-over-helsinki
    :parameters (?from - city ?to - city ?dprev - day ?dnext - day ?l - level)
    :precondition (and
      (is-helsinki ?to)
      (next ?dprev ?dnext)
      (assigned ?dprev)
      (at ?from ?dprev)
      (direct ?from ?to)
      (not (assigned ?dnext))
      (current-count ?to ?l)
      (max-level ?to ?l)
    )
    :effect (and
      (assigned ?dnext)
      (at ?to ?dnext)
      (increase (total-cost) 3)
    )
  )

  ; Meeting must occur in Florence within the window [day9..day14] while staying in Florence
  (:action meet-in-florence
    :parameters (?c - city ?d - day)
    :precondition (and
      (is-florence ?c)
      (in-window ?d)
      (at ?c ?d)
      (not (met))
    )
    :effect (met)
  )

  ; Seal schedule once last day is assigned (implies all days 1..14 have been assigned consecutively)
  (:action seal-schedule
    :parameters (?d - day)
    :precondition (and
      (last ?d)
      (assigned ?d)
      (not (sealed))
    )
    :effect (sealed)
  )

  ; Pay shortfall after sealing: add missing units up to the max for each city (penalized)
  (:action pay-shortfall-florence
    :parameters (?c - city ?l1 - level ?l2 - level)
    :precondition (and
      (sealed)
      (is-florence ?c)
      (current-count ?c ?l1)
      (succ ?l1 ?l2)
      (not (max-level ?c ?l1))
    )
    :effect (and
      (not (current-count ?c ?l1))
      (current-count ?c ?l2)
      (increase (total-cost) 4)
    )
  )

  (:action pay-shortfall-barcelona
    :parameters (?c - city ?l1 - level ?l2 - level)
    :precondition (and
      (sealed)
      (is-barcelona ?c)
      (current-count ?c ?l1)
      (succ ?l1 ?l2)
      (not (max-level ?c ?l1))
    )
    :effect (and
      (not (current-count ?c ?l1))
      (current-count ?c ?l2)
      (increase (total-cost) 3)
    )
  )

  (:action pay-shortfall-helsinki
    :parameters (?c - city ?l1 - level ?l2 - level)
    :precondition (and
      (sealed)
      (is-helsinki ?c)
      (current-count ?c ?l1)
      (succ ?l1 ?l2)
      (not (max-level ?c ?l1))
    )
    :effect (and
      (not (current-count ?c ?l1))
      (current-count ?c ?l2)
      (increase (total-cost) 3)
    )
  )

  ; Close quota per city after sealing, once current-count equals that city's max-level
  (:action close-quota
    :parameters (?c - city ?l - level)
    :precondition (and
      (sealed)
      (current-count ?c ?l)
      (max-level ?c ?l)
      (not (quota-closed ?c))
    )
    :effect (quota-closed ?c)
  )
)