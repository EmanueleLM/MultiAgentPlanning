(define (domain travel-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types city day slot)

  (:constants porto berlin reykjavik - city)

  (:predicates
    (at ?c - city ?d - day)
    (occupied ?d - day)
    (day-next ?d1 - day ?d2 - day)
    (flight ?from - city ?to - city)
    (slot-of ?s - slot ?c - city)
    (filled ?s - slot)
    (in_meeting_window ?d - day)
    (meeting_done)
  )

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

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (at reykjavik ?d)
      (in_meeting_window ?d)
      (not (meeting_done))
    )
    :effect (and
      (meeting_done)
    )
  )
)