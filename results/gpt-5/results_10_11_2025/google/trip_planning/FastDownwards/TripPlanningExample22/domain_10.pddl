(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types city day slot)
  (:predicates
    (start)
    (current-day ?d - day)
    (next ?d1 - day ?d2 - day)
    (assigned ?d - day)
    (unassigned ?d - day)
    (at ?c - city ?d - day)
    (last ?c - city)
    (visited ?c - city)
    (flight ?from - city ?to - city)
    (show-day ?d - day)
    (show-city ?c - city)
    (attended ?d - day)
    (satisfied-show ?d - day)
    (unclaimed-slot ?s - slot)
    (claimed-slot ?s - slot)
    (waived-slot ?s - slot)
    (slot-closed ?s - slot)
    (slot-city ?s - slot ?c - city)
    (day-claimed ?d - day)
  )
  (:functions (total-cost))

  (:action assign_first_day
    :parameters (?c - city ?d - day)
    :precondition (and (start) (current-day ?d) (unassigned ?d))
    :effect (and
      (assigned ?d)
      (not (unassigned ?d))
      (at ?c ?d)
      (visited ?c)
      (last ?c)
      (not (start))
    )
  )

  (:action assign_stay
    :parameters (?c - city ?d - day)
    :precondition (and (not (start)) (current-day ?d) (unassigned ?d) (last ?c))
    :effect (and
      (assigned ?d)
      (not (unassigned ?d))
      (at ?c ?d)
    )
  )

  (:action assign_move
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (not (start)) (current-day ?d) (unassigned ?d) (last ?from) (flight ?from ?to))
    :effect (and
      (assigned ?d)
      (not (unassigned ?d))
      (at ?to ?d)
      (visited ?to)
      (not (last ?from))
      (last ?to)
    )
  )

  (:action satisfy_show_day
    :parameters (?d - day ?c - city)
    :precondition (and (current-day ?d) (assigned ?d) (show-day ?d) (show-city ?c) (at ?c ?d) (not (satisfied-show ?d)))
    :effect (and
      (attended ?d)
      (satisfied-show ?d)
    )
  )

  (:action waive_show_day
    :parameters (?d - day)
    :precondition (and (current-day ?d) (assigned ?d) (show-day ?d) (not (satisfied-show ?d)))
    :effect (and
      (satisfied-show ?d)
      (increase (total-cost) 100)
    )
  )

  (:action claim_city_slot
    :parameters (?s - slot ?c - city ?d - day)
    :precondition (and (current-day ?d) (assigned ?d) (at ?c ?d) (unclaimed-slot ?s) (slot-city ?s ?c) (not (slot-closed ?s)) (not (day-claimed ?d)))
    :effect (and
      (claimed-slot ?s)
      (not (unclaimed-slot ?s))
      (slot-closed ?s)
      (day-claimed ?d)
    )
  )

  (:action waive_city_slot
    :parameters (?s - slot)
    :precondition (and (unclaimed-slot ?s) (not (slot-closed ?s)))
    :effect (and
      (waived-slot ?s)
      (not (unclaimed-slot ?s))
      (slot-closed ?s)
      (increase (total-cost) 10)
    )
  )

  (:action advance_day_show
    :parameters (?d - day ?d2 - day)
    :precondition (and (current-day ?d) (assigned ?d) (show-day ?d) (satisfied-show ?d) (next ?d ?d2))
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
    )
  )

  (:action advance_day_nonshow
    :parameters (?d - day ?d2 - day)
    :precondition (and (current-day ?d) (assigned ?d) (not (show-day ?d)) (next ?d ?d2))
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
    )
  )
)