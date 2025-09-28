(define (domain trip_planning)
  (:requirements :typing :negative-preconditions)
  (:types city day manch_slot buch_slot lyon_slot)

  (:constants manchester bucharest lyon - city)

  (:predicates
    (assigned ?d - day ?c - city)
    (next ?d1 - day ?d2 - day)
    (direct ?c1 - city ?c2 - city)
    (day-used ?d - day)
    (manch-slot-filled ?s - manch_slot)
    (buch-slot-filled ?s - buch_slot)
    (lyon-slot-filled ?s - lyon_slot)
    (window-day ?d - day)
    (relatives-visited)
    (first-day ?d - day)
  )

  (:action start_manch
    :parameters (?d - day ?s - manch_slot)
    :precondition (and (first-day ?d) (not (day-used ?d)) (not (manch-slot-filled ?s)))
    :effect (and (assigned ?d manchester) (day-used ?d) (manch-slot-filled ?s))
  )

  (:action start_buch
    :parameters (?d - day ?s - buch_slot)
    :precondition (and (first-day ?d) (not (day-used ?d)) (not (buch-slot-filled ?s)))
    :effect (and (assigned ?d bucharest) (day-used ?d) (buch-slot-filled ?s))
  )

  (:action start_lyon
    :parameters (?d - day ?s - lyon_slot)
    :precondition (and (first-day ?d) (not (day-used ?d)) (not (lyon-slot-filled ?s)))
    :effect (and (assigned ?d lyon) (day-used ?d) (lyon-slot-filled ?s))
  )

  (:action stay_manch
    :parameters (?prev - day ?d - day ?s - manch_slot)
    :precondition (and (assigned ?prev manchester) (next ?prev ?d) (not (day-used ?d)) (not (manch-slot-filled ?s)))
    :effect (and (assigned ?d manchester) (day-used ?d) (manch-slot-filled ?s))
  )

  (:action stay_buch
    :parameters (?prev - day ?d - day ?s - buch_slot)
    :precondition (and (assigned ?prev bucharest) (next ?prev ?d) (not (day-used ?d)) (not (buch-slot-filled ?s)))
    :effect (and (assigned ?d bucharest) (day-used ?d) (buch-slot-filled ?s))
  )

  (:action stay_lyon
    :parameters (?prev - day ?d - day ?s - lyon_slot)
    :precondition (and (assigned ?prev lyon) (next ?prev ?d) (not (day-used ?d)) (not (lyon-slot-filled ?s)))
    :effect (and (assigned ?d lyon) (day-used ?d) (lyon-slot-filled ?s))
  )

  (:action fly_manch_to_buch
    :parameters (?prev - day ?d - day ?s - buch_slot)
    :precondition (and (assigned ?prev manchester) (next ?prev ?d) (not (day-used ?d)) (not (buch-slot-filled ?s)) (direct manchester bucharest))
    :effect (and (assigned ?d bucharest) (day-used ?d) (buch-slot-filled ?s))
  )

  (:action fly_buch_to_manch
    :parameters (?prev - day ?d - day ?s - manch_slot)
    :precondition (and (assigned ?prev bucharest) (next ?prev ?d) (not (day-used ?d)) (not (manch-slot-filled ?s)) (direct bucharest manchester))
    :effect (and (assigned ?d manchester) (day-used ?d) (manch-slot-filled ?s))
  )

  (:action fly_buch_to_lyon
    :parameters (?prev - day ?d - day ?s - lyon_slot)
    :precondition (and (assigned ?prev bucharest) (next ?prev ?d) (not (day-used ?d)) (not (lyon-slot-filled ?s)) (direct bucharest lyon))
    :effect (and (assigned ?d lyon) (day-used ?d) (lyon-slot-filled ?s))
  )

  (:action fly_lyon_to_buch
    :parameters (?prev - day ?d - day ?s - buch_slot)
    :precondition (and (assigned ?prev lyon) (next ?prev ?d) (not (day-used ?d)) (not (buch-slot-filled ?s)) (direct lyon bucharest))
    :effect (and (assigned ?d bucharest) (day-used ?d) (buch-slot-filled ?s))
  )

  (:action visit_relatives
    :parameters (?d - day)
    :precondition (and (assigned ?d lyon) (window-day ?d) (not (relatives-visited)))
    :effect (relatives-visited)
  )
)