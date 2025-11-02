(define (domain trip-itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day val_slot ams_slot tal_slot)

  (:predicates
    (at ?c - city ?d - day)
    (occupied ?d - day)
    (flight ?c1 - city ?c2 - city)
    (next ?d1 - day ?d2 - day)
    (first ?d - day)
    (not_started)

    (val_slot_unused ?s - val_slot)
    (ams_slot_unused ?s - ams_slot)
    (tal_slot_unused ?s - tal_slot)

    (meeting_day ?d - day)
    (meeting_done)
  )

  (:action start-valencia
    :parameters (?d - day ?s - val_slot)
    :precondition (and (first ?d) (not_started) (val_slot_unused ?s) (not (occupied ?d)))
    :effect (and (at valencia ?d) (occupied ?d) (not (val_slot_unused ?s)) (not (not_started)))
  )

  (:action start-amsterdam
    :parameters (?d - day ?s - ams_slot)
    :precondition (and (first ?d) (not_started) (ams_slot_unused ?s) (not (occupied ?d)))
    :effect (and (at amsterdam ?d) (occupied ?d) (not (ams_slot_unused ?s)) (not (not_started)))
  )

  (:action start-tallinn-meeting
    :parameters (?d - day ?s - tal_slot)
    :precondition (and (first ?d) (not_started) (tal_slot_unused ?s) (meeting_day ?d) (not (occupied ?d)))
    :effect (and (at tallinn ?d) (occupied ?d) (not (tal_slot_unused ?s)) (meeting_done) (not (not_started)))
  )

  (:action start-tallinn-nonmeeting
    :parameters (?d - day ?s - tal_slot)
    :precondition (and (first ?d) (not_started) (tal_slot_unused ?s) (not (meeting_day ?d)) (not (occupied ?d)))
    :effect (and (at tallinn ?d) (occupied ?d) (not (tal_slot_unused ?s)) (not (not_started)))
  )

  (:action stay-valencia
    :parameters (?d1 - day ?d2 - day ?s - val_slot)
    :precondition (and (at valencia ?d1) (next ?d1 ?d2) (val_slot_unused ?s) (not (occupied ?d2)))
    :effect (and (at valencia ?d2) (occupied ?d2) (not (val_slot_unused ?s)))
  )

  (:action stay-amsterdam
    :parameters (?d1 - day ?d2 - day ?s - ams_slot)
    :precondition (and (at amsterdam ?d1) (next ?d1 ?d2) (ams_slot_unused ?s) (not (occupied ?d2)))
    :effect (and (at amsterdam ?d2) (occupied ?d2) (not (ams_slot_unused ?s)))
  )

  (:action stay-tallinn-meeting
    :parameters (?d1 - day ?d2 - day ?s - tal_slot)
    :precondition (and (at tallinn ?d1) (next ?d1 ?d2) (tal_slot_unused ?s) (meeting_day ?d2) (not (occupied ?d2)))
    :effect (and (at tallinn ?d2) (occupied ?d2) (not (tal_slot_unused ?s)) (meeting_done))
  )

  (:action stay-tallinn-nonmeeting
    :parameters (?d1 - day ?d2 - day ?s - tal_slot)
    :precondition (and (at tallinn ?d1) (next ?d1 ?d2) (tal_slot_unused ?s) (not (meeting_day ?d2)) (not (occupied ?d2)))
    :effect (and (at tallinn ?d2) (occupied ?d2) (not (tal_slot_unused ?s)))
  )

  (:action fly-valencia-amsterdam
    :parameters (?d1 - day ?d2 - day ?s - ams_slot)
    :precondition (and (at valencia ?d1) (next ?d1 ?d2) (flight valencia amsterdam) (ams_slot_unused ?s) (not (occupied ?d2)))
    :effect (and (at amsterdam ?d2) (occupied ?d2) (not (ams_slot_unused ?s)))
  )

  (:action fly-amsterdam-valencia
    :parameters (?d1 - day ?d2 - day ?s - val_slot)
    :precondition (and (at amsterdam ?d1) (next ?d1 ?d2) (flight amsterdam valencia) (val_slot_unused ?s) (not (occupied ?d2)))
    :effect (and (at valencia ?d2) (occupied ?d2) (not (val_slot_unused ?s)))
  )

  (:action fly-amsterdam-tallinn-meeting
    :parameters (?d1 - day ?d2 - day ?s - tal_slot)
    :precondition (and (at amsterdam ?d1) (next ?d1 ?d2) (flight amsterdam tallinn) (tal_slot_unused ?s) (meeting_day ?d2) (not (occupied ?d2)))
    :effect (and (at tallinn ?d2) (occupied ?d2) (not (tal_slot_unused ?s)) (meeting_done))
  )

  (:action fly-amsterdam-tallinn-nonmeeting
    :parameters (?d1 - day ?d2 - day ?s - tal_slot)
    :precondition (and (at amsterdam ?d1) (next ?d1 ?d2) (flight amsterdam tallinn) (tal_slot_unused ?s) (not (meeting_day ?d2)) (not (occupied ?d2)))
    :effect (and (at tallinn ?d2) (occupied ?d2) (not (tal_slot_unused ?s)))
  )

  (:action fly-tallinn-amsterdam
    :parameters (?d1 - day ?d2 - day ?s - ams_slot)
    :precondition (and (at tallinn ?d1) (next ?d1 ?d2) (flight tallinn amsterdam) (ams_slot_unused ?s) (not (occupied ?d2)))
    :effect (and (at amsterdam ?d2) (occupied ?d2) (not (ams_slot_unused ?s)))
  )
)