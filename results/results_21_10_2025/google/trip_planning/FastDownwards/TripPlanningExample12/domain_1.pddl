(define (domain trip-itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day val_slot ams_slot tal_slot)

  (:predicates
    (at ?c - city ?d - day)               ; traveler in city on day
    (occupied ?d - day)                  ; day assigned to some city
    (flight ?c1 - city ?c2 - city)       ; direct flight exists between cities
    (next ?d1 - day ?d2 - day)           ; successor day relation
    (first ?d - day)                     ; marks first day
    (not_started)                        ; true until start action executed

    ; slot tokens enforce exact number of days per city (counts)
    (val_slot_unused ?s - val_slot)
    (ams_slot_unused ?s - ams_slot)
    (tal_slot_unused ?s - tal_slot)

    (meeting_day ?d - day)               ; days allowed for meeting in Tallinn (day9..day15)
    (meeting_done)                       ; becomes true once a Tallinn-day in meeting window is scheduled
  )

  ; Start the trip in Valencia, consuming a Valencia slot.
  (:action start-valencia
    :parameters (?d - day ?s - val_slot)
    :precondition (and (first ?d) (not_started) (val_slot_unused ?s) (not (occupied ?d)))
    :effect (and (at valencia ?d) (occupied ?d) (not (val_slot_unused ?s)) (not (not_started)))
  )

  ; Start the trip in Amsterdam, consuming an Amsterdam slot.
  (:action start-amsterdam
    :parameters (?d - day ?s - ams_slot)
    :precondition (and (first ?d) (not_started) (ams_slot_unused ?s) (not (occupied ?d)))
    :effect (and (at amsterdam ?d) (occupied ?d) (not (ams_slot_unused ?s)) (not (not_started)))
  )

  ; Start the trip in Tallinn on a meeting-allowed day (consumes Tallinn slot and schedules meeting).
  (:action start-tallinn-meeting
    :parameters (?d - day ?s - tal_slot)
    :precondition (and (first ?d) (not_started) (tal_slot_unused ?s) (meeting_day ?d) (not (occupied ?d)))
    :effect (and (at tallinn ?d) (occupied ?d) (not (tal_slot_unused ?s)) (meeting_done) (not (not_started)))
  )

  ; Start the trip in Tallinn on a non-meeting day (consumes Tallinn slot).
  (:action start-tallinn-nonmeeting
    :parameters (?d - day ?s - tal_slot)
    :precondition (and (first ?d) (not_started) (tal_slot_unused ?s) (not (meeting_day ?d)) (not (occupied ?d)))
    :effect (and (at tallinn ?d) (occupied ?d) (not (tal_slot_unused ?s)) (not (not_started)))
  )

  ; Stay in Valencia to next day, consuming a Valencia slot.
  (:action stay-valencia
    :parameters (?d1 - day ?d2 - day ?s - val_slot)
    :precondition (and (at valencia ?d1) (next ?d1 ?d2) (val_slot_unused ?s) (not (occupied ?d2)))
    :effect (and (at valencia ?d2) (occupied ?d2) (not (val_slot_unused ?s)))
  )

  ; Stay in Amsterdam to next day, consuming an Amsterdam slot.
  (:action stay-amsterdam
    :parameters (?d1 - day ?d2 - day ?s - ams_slot)
    :precondition (and (at amsterdam ?d1) (next ?d1 ?d2) (ams_slot_unused ?s) (not (occupied ?d2)))
    :effect (and (at amsterdam ?d2) (occupied ?d2) (not (ams_slot_unused ?s)))
  )

  ; Stay in Tallinn to next day on a meeting day (consumes Tallinn slot and schedules meeting).
  (:action stay-tallinn-meeting
    :parameters (?d1 - day ?d2 - day ?s - tal_slot)
    :precondition (and (at tallinn ?d1) (next ?d1 ?d2) (tal_slot_unused ?s) (meeting_day ?d2) (not (occupied ?d2)))
    :effect (and (at tallinn ?d2) (occupied ?d2) (not (tal_slot_unused ?s)) (meeting_done))
  )

  ; Stay in Tallinn to next day on a non-meeting day (consumes Tallinn slot).
  (:action stay-tallinn-nonmeeting
    :parameters (?d1 - day ?d2 - day ?s - tal_slot)
    :precondition (and (at tallinn ?d1) (next ?d1 ?d2) (tal_slot_unused ?s) (not (meeting_day ?d2)) (not (occupied ?d2)))
    :effect (and (at tallinn ?d2) (occupied ?d2) (not (tal_slot_unused ?s)))
  )

  ; Fly Valencia -> Amsterdam (dest consumes an Amsterdam slot).
  (:action fly-valencia-amsterdam
    :parameters (?d1 - day ?d2 - day ?s - ams_slot)
    :precondition (and (at valencia ?d1) (next ?d1 ?d2) (flight valencia amsterdam) (ams_slot_unused ?s) (not (occupied ?d2)))
    :effect (and (at amsterdam ?d2) (occupied ?d2) (not (ams_slot_unused ?s)))
  )

  ; Fly Amsterdam -> Valencia (dest consumes a Valencia slot).
  (:action fly-amsterdam-valencia
    :parameters (?d1 - day ?d2 - day ?s - val_slot)
    :precondition (and (at amsterdam ?d1) (next ?d1 ?d2) (flight amsterdam valencia) (val_slot_unused ?s) (not (occupied ?d2)))
    :effect (and (at valencia ?d2) (occupied ?d2) (not (val_slot_unused ?s)))
  )

  ; Fly Amsterdam -> Tallinn arriving on a meeting-allowed day (consumes Tallinn slot and schedules meeting).
  (:action fly-amsterdam-tallinn-meeting
    :parameters (?d1 - day ?d2 - day ?s - tal_slot)
    :precondition (and (at amsterdam ?d1) (next ?d1 ?d2) (flight amsterdam tallinn) (tal_slot_unused ?s) (meeting_day ?d2) (not (occupied ?d2)))
    :effect (and (at tallinn ?d2) (occupied ?d2) (not (tal_slot_unused ?s)) (meeting_done))
  )

  ; Fly Amsterdam -> Tallinn arriving on a non-meeting day (consumes Tallinn slot).
  (:action fly-amsterdam-tallinn-nonmeeting
    :parameters (?d1 - day ?d2 - day ?s - tal_slot)
    :precondition (and (at amsterdam ?d1) (next ?d1 ?d2) (flight amsterdam tallinn) (tal_slot_unused ?s) (not (meeting_day ?d2)) (not (occupied ?d2)))
    :effect (and (at tallinn ?d2) (occupied ?d2) (not (tal_slot_unused ?s)))
  )

  ; Fly Tallinn -> Amsterdam (dest consumes an Amsterdam slot).
  (:action fly-tallinn-amsterdam
    :parameters (?d1 - day ?d2 - day ?s - ams_slot)
    :precondition (and (at tallinn ?d1) (next ?d1 ?d2) (flight tallinn amsterdam) (ams_slot_unused ?s) (not (occupied ?d2)))
    :effect (and (at amsterdam ?d2) (occupied ?d2) (not (ams_slot_unused ?s)))
  )
)