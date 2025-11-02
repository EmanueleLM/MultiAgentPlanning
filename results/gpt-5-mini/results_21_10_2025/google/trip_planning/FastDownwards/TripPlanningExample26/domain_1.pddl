(define (domain travel-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day slot)

  (:predicates
    (at ?c - city ?d - day)               ; at city on a specific day
    (occupied ?d - day)                  ; day has been assigned/occupied
    (day-next ?d1 - day ?d2 - day)       ; successor relation between days
    (flight ?from - city ?to - city)     ; direct flight availability
    (slot-of ?s - slot ?c - city)        ; slot belongs to a city (consumes one required day for that city)
    (filled ?s - slot)                   ; slot has been used (a visit-day for that city has been assigned)
    (in_meeting_window ?d - day)         ; day is within Reykjavik meeting window
    (meeting_done)                       ; meeting has taken place
  )

  ;; Stay in Porto for the next day, consuming one Porto slot
  (:action porto_visit
    :parameters (?dprev - day ?d - day ?s - slot)
    :precondition (and
      (at porto ?dprev)
      (day-next ?dprev ?d)
      (not (occupied ?d))
      (slot-of ?s porto)
      (not (filled ?s))
    )
    :effect (and
      (at porto ?d)
      (occupied ?d)
      (filled ?s)
    )
  )

  ;; Stay in Berlin for the next day, consuming one Berlin slot
  (:action berlin_visit
    :parameters (?dprev - day ?d - day ?s - slot)
    :precondition (and
      (at berlin ?dprev)
      (day-next ?dprev ?d)
      (not (occupied ?d))
      (slot-of ?s berlin)
      (not (filled ?s))
    )
    :effect (and
      (at berlin ?d)
      (occupied ?d)
      (filled ?s)
    )
  )

  ;; Stay in Reykjavik for the next day, consuming one Reykjavik slot
  (:action reykjavik_visit
    :parameters (?dprev - day ?d - day ?s - slot)
    :precondition (and
      (at reykjavik ?dprev)
      (day-next ?dprev ?d)
      (not (occupied ?d))
      (slot-of ?s reykjavik)
      (not (filled ?s))
    )
    :effect (and
      (at reykjavik ?d)
      (occupied ?d)
      (filled ?s)
    )
  )

  ;; Flight: Porto -> Berlin (arrive and occupy arrival day, consume a Berlin slot)
  (:action porto_to_berlin
    :parameters (?dprev - day ?d - day ?s - slot)
    :precondition (and
      (at porto ?dprev)
      (day-next ?dprev ?d)
      (not (occupied ?d))
      (flight porto berlin)
      (slot-of ?s berlin)
      (not (filled ?s))
    )
    :effect (and
      (at berlin ?d)
      (occupied ?d)
      (filled ?s)
    )
  )

  ;; Flight: Berlin -> Porto (arrive and occupy arrival day, consume a Porto slot)
  (:action berlin_to_porto
    :parameters (?dprev - day ?d - day ?s - slot)
    :precondition (and
      (at berlin ?dprev)
      (day-next ?dprev ?d)
      (not (occupied ?d))
      (flight berlin porto)
      (slot-of ?s porto)
      (not (filled ?s))
    )
    :effect (and
      (at porto ?d)
      (occupied ?d)
      (filled ?s)
    )
  )

  ;; Flight: Berlin -> Reykjavik (arrive and occupy arrival day, consume a Reykjavik slot)
  (:action berlin_to_reykjavik
    :parameters (?dprev - day ?d - day ?s - slot)
    :precondition (and
      (at berlin ?dprev)
      (day-next ?dprev ?d)
      (not (occupied ?d))
      (flight berlin reykjavik)
      (slot-of ?s reykjavik)
      (not (filled ?s))
    )
    :effect (and
      (at reykjavik ?d)
      (occupied ?d)
      (filled ?s)
    )
  )

  ;; Flight: Reykjavik -> Berlin (arrive and occupy arrival day, consume a Berlin slot)
  (:action reykjavik_to_berlin
    :parameters (?dprev - day ?d - day ?s - slot)
    :precondition (and
      (at reykjavik ?dprev)
      (day-next ?dprev ?d)
      (not (occupied ?d))
      (flight reykjavik berlin)
      (slot-of ?s berlin)
      (not (filled ?s))
    )
    :effect (and
      (at berlin ?d)
      (occupied ?d)
      (filled ?s)
    )
  )

  ;; Conduct the meeting while in Reykjavik on a permitted meeting window day
  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (at reykjavik ?d)
      (in_meeting_window ?d)
      (not (meeting_done))
    )
    :effect (meeting_done)
  )
)