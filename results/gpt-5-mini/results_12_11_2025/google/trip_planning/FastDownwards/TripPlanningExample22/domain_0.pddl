(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types day city slot)

  (:predicates
    (current ?d - day)
    (first ?d - day)
    (next ?d1 - day ?d2 - day)
    (unassigned ?d - day)
    (assigned ?d - day ?c - city)
    (visited ?c - city)
    (flight ?from - city ?to - city)
    (show-day ?d - day)
    (attended ?d - day)
    (waived-show ?d - day)
    (show-handled ?d - day)            ;; true if either attended or waived for that show day
    (slot ?s - slot ?c - city)
    (slot-unclaimed ?s - slot)
    (claimed-slot ?s - slot)
    (waived-slot ?s - slot)
    (slot-handled ?s - slot)           ;; true if either claimed or waived
    (day-slot-available ?d - day)
  )

  (:functions
    (total-cost)                       ;; numeric total cost accumulated by waivers
  )

  ;; First-day assignment actions (day with predicate first)
  (:action assign_first_berlin_show
    :parameters (?d - day)
    :precondition (and (current ?d) (first ?d) (unassigned ?d) (show-day ?d))
    :effect (and
      (assigned ?d berlin)
      (not (unassigned ?d))
      (visited berlin)
      (attended ?d)
      (show-handled ?d)
    )
  )

  (:action assign_first_berlin_noshow
    :parameters (?d - day)
    :precondition (and (current ?d) (first ?d) (unassigned ?d) (not (show-day ?d)))
    :effect (and
      (assigned ?d berlin)
      (not (unassigned ?d))
      (visited berlin)
    )
  )

  (:action assign_first_frankfurt
    :parameters (?d - day)
    :precondition (and (current ?d) (first ?d) (unassigned ?d))
    :effect (and
      (assigned ?d frankfurt)
      (not (unassigned ?d))
      (visited frankfurt)
    )
  )

  (:action assign_first_bucharest
    :parameters (?d - day)
    :precondition (and (current ?d) (first ?d) (unassigned ?d))
    :effect (and
      (assigned ?d bucharest)
      (not (unassigned ?d))
      (visited bucharest)
    )
  )

  ;; Assign when staying in the same city (no flight required). Handles Berlin show-day attendance when relevant.
  (:action assign_stay_berlin_show
    :parameters (?prev - day ?d - day)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev berlin) (unassigned ?d) (show-day ?d))
    :effect (and
      (assigned ?d berlin)
      (not (unassigned ?d))
      (visited berlin)
      (attended ?d)
      (show-handled ?d)
    )
  )

  (:action assign_stay_berlin_noshow
    :parameters (?prev - day ?d - day)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev berlin) (unassigned ?d) (not (show-day ?d)))
    :effect (and
      (assigned ?d berlin)
      (not (unassigned ?d))
      (visited berlin)
    )
  )

  (:action assign_stay_frankfurt
    :parameters (?prev - day ?d - day)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev frankfurt) (unassigned ?d))
    :effect (and
      (assigned ?d frankfurt)
      (not (unassigned ?d))
      (visited frankfurt)
    )
  )

  (:action assign_stay_bucharest
    :parameters (?prev - day ?d - day)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev bucharest) (unassigned ?d))
    :effect (and
      (assigned ?d bucharest)
      (not (unassigned ?d))
      (visited bucharest)
    )
  )

  ;; Assign when moving from a previous day: require a direct flight from previous city to new city.
  ;; Move to Berlin (if show-day, mark attendance)
  (:action assign_from_prev_to_berlin_show
    :parameters (?prev - day ?d - day ?cprev - city)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev ?cprev) (flight ?cprev berlin) (unassigned ?d) (show-day ?d))
    :effect (and
      (assigned ?d berlin)
      (not (unassigned ?d))
      (visited berlin)
      (attended ?d)
      (show-handled ?d)
    )
  )

  (:action assign_from_prev_to_berlin_noshow
    :parameters (?prev - day ?d - day ?cprev - city)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev ?cprev) (flight ?cprev berlin) (unassigned ?d) (not (show-day ?d)))
    :effect (and
      (assigned ?d berlin)
      (not (unassigned ?d))
      (visited berlin)
    )
  )

  ;; Move to Frankfurt
  (:action assign_from_prev_to_frankfurt
    :parameters (?prev - day ?d - day ?cprev - city)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev ?cprev) (flight ?cprev frankfurt) (unassigned ?d))
    :effect (and
      (assigned ?d frankfurt)
      (not (unassigned ?d))
      (visited frankfurt)
    )
  )

  ;; Move to Bucharest
  (:action assign_from_prev_to_bucharest
    :parameters (?prev - day ?d - day ?cprev - city)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev ?cprev) (flight ?cprev bucharest) (unassigned ?d))
    :effect (and
      (assigned ?d bucharest)
      (not (unassigned ?d))
      (visited bucharest)
    )
  )

  ;; Advance current day pointer along successor chain: only allowed after current day has been assigned.
  (:action advance_day
    :parameters (?cur - day ?next - day)
    :precondition (and (current ?cur) (next ?cur ?next) (not (unassigned ?cur)))
    :effect (and
      (not (current ?cur))
      (current ?next)
    )
  )

  ;; Claim a city's slot using a specific day assigned to that city. Each day can claim at most one slot (day-slot-available).
  (:action claim_city_slot
    :parameters (?s - slot ?c - city ?d - day)
    :precondition (and (slot ?s ?c) (slot-unclaimed ?s) (assigned ?d ?c) (day-slot-available ?d))
    :effect (and
      (claimed-slot ?s)
      (slot-handled ?s)
      (not (slot-unclaimed ?s))
      (not (day-slot-available ?d))
    )
  )

  ;; Waive a slot: pay penalty (increase total-cost by 10) and mark slot handled.
  (:action waive_city_slot
    :parameters (?s - slot ?c - city)
    :precondition (and (slot ?s ?c) (slot-unclaimed ?s) (not (claimed-slot ?s)) (not (waived-slot ?s)))
    :effect (and
      (waived-slot ?s)
      (slot-handled ?s)
      (not (slot-unclaimed ?s))
      (increase (total-cost) 10)
    )
  )

  ;; Waive a show day: pay penalty (increase total-cost by 100). Only available if the show-day hasn't been attended and not already waived.
  (:action waive_show_day
    :parameters (?d - day)
    :precondition (and (show-day ?d) (not (attended ?d)) (not (waived-show ?d)))
    :effect (and
      (waived-show ?d)
      (show-handled ?d)
      (increase (total-cost) 100)
    )
  )
)