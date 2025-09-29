(define (domain meet-betty-domain)
  (:requirements :typing :durative-actions :negative-preconditions :numeric-fluents)
  (:types agent location number)
  (:predicates
    (at ?a - agent ?l - location)
    (met ?a - agent ?b - agent)
  )
  (:functions
    (clock)                ; current clock in minutes from midnight
    (meeting-start)        ; recorded start time of the meeting
    (total-meeting-time)   ; accumulated meeting time (minutes)
    (total-cost)           ; scalar cost used for optimization: meeting-start - 0.001 * total-meeting-time
  )

  ; Travel action for agent "you" from one location to another (fixed durations)
  (:durative-action travel-you
    :parameters (?from - location ?to - location)
    :duration (= ?duration 18)                                 ; Presidio -> North Beach = 18
    :condition (and
      (at start (at you ?from))
      (at start (>= (clock) 540))                             ; you arrive at Presidio at 09:00 = 540 min
    )
    :effect (and
      (at start (not (at you ?from)))
      (at end (at you ?to))
      (at end (increase (clock) 18))
    )
  )

  ; Wait action for "you" to advance time (used to reach Betty's availability)
  (:durative-action wait-you
    :parameters (?dur - number)
    :duration (= ?duration ?dur)
    :condition (and
      (at start (>= ?dur 0))
      (at start (>= (clock) 540))                             ; you cannot act before arrival
    )
    :effect (and
      (at end (increase (clock) ?dur))
    )
  )

  ; Model Betty becoming available at North Beach no earlier than 18:45 (1125)
  (:durative-action arrive-betty
    :parameters ()
    :duration (= ?duration 0)
    :condition (at start (>= (clock) 1125))
    :effect (and
      (at start (at betty northbeach))
    )
  )

  ; Joint meeting action: meet-you-betty at a shared location.
  ; Meeting is constrained to end at Betty's window end (22:00 = 1320)
  ; and must last at least 75 minutes.
  (:durative-action meet-you-betty
    :parameters (?loc - location)
    ; Duration is fixed to the remaining Betty-window until 22:00: ?duration = 1320 - clock
    :duration (= ?duration (- 1320 (clock)))
    :condition (and
      (at start (at you ?loc))
      (at start (at betty ?loc))
      (at start (>= (clock) 1125))                             ; Betty available starting 18:45 = 1125
      (at start (>= (- 1320 (clock)) 75))                      ; meeting duration must be >= 75
    )
    :effect (and
      (at start (assign (meeting-start) (clock)))
      (at end (increase (total-meeting-time) ?duration))
      (at end (assign (total-cost) (- (meeting-start) (* 0.001 (total-meeting-time)))))
      (at end (met you betty))
      (at end (increase (clock) ?duration))
    )
  )

  ; Travel action for Betty if needed (kept distinct; not required by the provided data)
  (:durative-action travel-betty
    :parameters (?from - location ?to - location)
    :duration (= ?duration 17)                                 ; North Beach -> Presidio = 17 (if ever used)
    :condition (at start (at betty ?from))
    :effect (and
      (at start (not (at betty ?from)))
      (at end (at betty ?to))
      (at end (increase (clock) 17))
    )
  )
)