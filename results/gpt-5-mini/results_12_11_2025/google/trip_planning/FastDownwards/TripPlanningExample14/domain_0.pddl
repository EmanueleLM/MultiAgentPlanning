(define (domain travel-lyon-frankfurt-krakow)
  ;; Requirements limited to those supported by the FastDownward baseline as requested
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  ;; Predicates required by the specification
  (:predicates
    (at ?d - day ?c - city)                     ; you are in city ?c on day ?d (assignment per day)
    (current ?d - day)                          ; the timeline cursor is currently at day ?d
    (next ?d1 - day ?d2 - day)                 ; successor relation over days (d1 -> d2)
    (assigned ?d - day ?c - city)              ; day ?d has been assigned to city ?c (one per day)
    (visited ?c - city)                        ; city ?c has been visited at least one full day
    (edge ?c1 - city ?c2 - city)               ; allowed direct flight between c1 and c2 (bidirectional)
    (spent_in_lyon)                            ; at least one day spent in Lyon (marker)
    (spent_in_frankfurt)                       ; at least one day spent in Frankfurt (marker)
    (spent_in_krakow)                          ; at least one day spent in Krakow (marker)
    (attend_d8) (attend_d9) (attend_d10)       ; attendance markers for Krakow days 8..10
  )

  ;; Action: stay in same city and advance the current day to the successor
  ;; Note: parameters include the current day ?d, the city ?c that is the location on ?d,
  ;; and the successor day ?d2 to which we will advance.
  (:action stay_d
    :parameters (?d - day ?c - city ?d2 - day)
    :precondition (and
      (current ?d)
      (at ?d ?c)
      (next ?d ?d2)
      ;; enforce "one and only one city assigned per day" by forbidding any pre-existing assignment to ?d2
      (not (assigned ?d2 lyon))
      (not (assigned ?d2 frankfurt))
      (not (assigned ?d2 krakow))
    )
    :effect (and
      (not (current ?d))
      (current ?d2)
      ;; set the location and assignment for the successor day
      (at ?d2 ?c)
      (assigned ?d2 ?c)
      ;; mark that the city has been visited (idempotent)
      (visited ?c)
    )
  )

  ;; Action: fly along an allowed edge and advance the day (single city change per day boundary)
  (:action fly_d
    :parameters (?d - day ?from - city ?to - city ?d2 - day)
    :precondition (and
      (current ?d)
      (at ?d ?from)
      (edge ?from ?to)        ;; flight connectivity constraint (no direct Lyon <-> Krakow edge)
      (next ?d ?d2)
      ;; prevent assigning ?d2 twice
      (not (assigned ?d2 lyon))
      (not (assigned ?d2 frankfurt))
      (not (assigned ?d2 krakow))
    )
    :effect (and
      (not (current ?d))
      (current ?d2)
      ;; arrive at the destination for the successor day and assign it
      (at ?d2 ?to)
      (assigned ?d2 ?to)
      (visited ?to)
    )
  )

  ;; Markers: actions that convert per-day assignments into the global "spent_in_*" flags.
  ;; Each uses a parameter ?d so it can be triggered once any day is assigned to the given city.
  ;; The negative-precondition ensures it only fires once (idempotent).
  (:action mark_spent_in_lyon
    :parameters (?d - day)
    :precondition (and (assigned ?d lyon) (not (spent_in_lyon)))
    :effect (and (spent_in_lyon))
  )

  (:action mark_spent_in_frankfurt
    :parameters (?d - day)
    :precondition (and (assigned ?d frankfurt) (not (spent_in_frankfurt)))
    :effect (and (spent_in_frankfurt))
  )

  (:action mark_spent_in_krakow
    :parameters (?d - day)
    :precondition (and (assigned ?d krakow) (not (spent_in_krakow)))
    :effect (and (spent_in_krakow))
  )

  ;; Attendance marker actions for Krakow on explicit days 8,9,10. These fire only if that day is assigned to Krakow.
  (:action mark_attend_d8
    :precondition (and (assigned d8 krakow) (not (attend_d8)))
    :effect (attend_d8)
  )
  (:action mark_attend_d9
    :precondition (and (assigned d9 krakow) (not (attend_d9)))
    :effect (attend_d9)
  )
  (:action mark_attend_d10
    :precondition (and (assigned d10 krakow) (not (attend_d10)))
    :effect (attend_d10)
  )
)