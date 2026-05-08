(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day slot)

  (:predicates
    ; day assignment state
    (assigned ?d - day ?c - city)
    (day-unassigned ?d - day)
    (first-day ?d - day)
    (next ?d1 - day ?d2 - day)

    ; per-city stay-slot bookkeeping (enforces exact desired stay counts)
    (slot-unused ?s - slot)
    (slot-belongs ?s - slot ?c - city)

    ; flight connectivity
    (allowed-flight ?from - city ?to - city)

    ; meeting predicates
    (meeting-day ?d - day)      ; days eligible for meeting
    (meeting-held)              ; set when an eligible day in Nice is assigned
  )

  ;; Assign the very first day to a city and consume one of that city's slots.
  (:action assign-first-day
    :parameters (?d - day ?c - city ?s - slot)
    :precondition (and
                    (first-day ?d)
                    (day-unassigned ?d)
                    (slot-unused ?s)
                    (slot-belongs ?s ?c)
                  )
    :effect (and
              (assigned ?d ?c)
              (not (day-unassigned ?d))
              (not (slot-unused ?s))
            )
  )

  ;; Assign a next day to the same city as the previous day (stay).
  (:action assign-next-stay
    :parameters (?prevd - day ?d - day ?c - city ?s - slot)
    :precondition (and
                    (next ?prevd ?d)
                    (assigned ?prevd ?c)
                    (day-unassigned ?d)
                    (slot-unused ?s)
                    (slot-belongs ?s ?c)
                  )
    :effect (and
              (assigned ?d ?c)
              (not (day-unassigned ?d))
              (not (slot-unused ?s))
            )
  )

  ;; Assign a next day to a different city reachable by a direct flight from the previous day's city.
  (:action assign-next-travel
    :parameters (?prevd - day ?d - day ?prevc - city ?c - city ?s - slot)
    :precondition (and
                    (next ?prevd ?d)
                    (assigned ?prevd ?prevc)
                    (allowed-flight ?prevc ?c)
                    (day-unassigned ?d)
                    (slot-unused ?s)
                    (slot-belongs ?s ?c)
                  )
    :effect (and
              (assigned ?d ?c)
              (not (day-unassigned ?d))
              (not (slot-unused ?s))
            )
  )

  ;; Declare that the meeting requirement has been satisfied:
  ;; can be applied if a meeting-eligible day has been assigned to Nice.
  (:action declare-meeting
    :parameters (?d - day)
    :precondition (and
                    (meeting-day ?d)
                    (assigned ?d nice)
                  )
    :effect (meeting-held)
  )
)