(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)                 ; traveler is in city ?c on day ?d
    (day-next ?d1 - day ?d2 - day)         ; temporal successor relation between days
    (direct ?c1 - city ?c2 - city)         ; direct flight connection between cities
    (meeting-window ?d - day)              ; days allowed for the Reykjavik meeting
    (meeting-scheduled)                    ; flag indicating the meeting in Reykjavik was scheduled
  )

  ;; Staying in Porto from previous day to next day
  (:action porto_travel
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at porto ?d1) (day-next ?d1 ?d2))
    :effect (and (at porto ?d2))
  )

  ;; Staying in Berlin from previous day to next day
  (:action berlin_travel
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at berlin ?d1) (day-next ?d1 ?d2))
    :effect (and (at berlin ?d2))
  )

  ;; Staying in Reykjavik from previous day to next day
  (:action reykjavik_travel
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at reykjavik ?d1) (day-next ?d1 ?d2))
    :effect (and (at reykjavik ?d2))
  )

  ;; Flight actions (only allowed when a direct connection exists)
  (:action flight_porto_berlin
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at porto ?d1) (day-next ?d1 ?d2) (direct porto berlin))
    :effect (and (at berlin ?d2))
  )

  (:action flight_berlin_porto
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at berlin ?d1) (day-next ?d1 ?d2) (direct berlin porto))
    :effect (and (at porto ?d2))
  )

  (:action flight_berlin_reykjavik
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at berlin ?d1) (day-next ?d1 ?d2) (direct berlin reykjavik))
    :effect (and (at reykjavik ?d2))
  )

  (:action flight_reykjavik_berlin
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at reykjavik ?d1) (day-next ?d1 ?d2) (direct reykjavik berlin))
    :effect (and (at berlin ?d2))
  )

  ;; Schedule the meeting while in Reykjavik on an allowed meeting-window day
  (:action reykjavik_planner_meet
    :parameters (?d - day)
    :precondition (and (at reykjavik ?d) (meeting-window ?d))
    :effect (and (meeting-scheduled))
  )
)