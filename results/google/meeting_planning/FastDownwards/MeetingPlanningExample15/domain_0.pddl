(define (domain schedule-integration)
  :requirements :strips :typing :fluents
  :types location

  :predicates
    (at ?l - location)
    (met-john)
    (feasible-john)

  :functions
    (current-time)      ; minutes since 00:00
    (meeting-start)     ; meeting start time (minutes)
    (meeting-end)       ; meeting end time (minutes)
    (friends-met)       ; integer count of verified feasible friends met

  ;; -----------------------------
  ;; Actions provided by schedule_generator
  ;; (prefix sg- to keep them distinct)
  ;; -----------------------------

  ;; Travel from Russian Hill to Golden Gate Park: +21 minutes
  (:action sg-travel-rh-to-ggp
    :parameters ()
    :precondition (at russian_hill)
    :effect (and
      (not (at russian_hill))
      (at golden_gate_park)
      (assign (current-time) (+ (current-time) 21))
    )
  )

  ;; Travel from Golden Gate Park to Russian Hill: +19 minutes
  (:action sg-travel-ggp-to-rh
    :parameters ()
    :precondition (at golden_gate_park)
    :effect (and
      (not (at golden_gate_park))
      (at russian_hill)
      (assign (current-time) (+ (current-time) 19))
    )
  )

  ;; Wait until John's start time (if you arrive earlier than John's availability)
  ;; John's availability start = 13:00 = 780 minutes
  (:action sg-wait-until-john-start
    :parameters ()
    :precondition (and
      (at golden_gate_park)
      (<= (current-time) 780)
    )
    :effect (and
      ;; set current-time to John's start
      (assign (current-time) 780)
    )
  )

  ;; Schedule a meeting with John at the current time (must be within John's window)
  ;; Meeting duration fixed to desired minimum 90 minutes.
  ;; John's window end = 18:15 = 1095 minutes
  (:action sg-schedule-meeting-john
    :parameters ()
    :precondition (and
      (at golden_gate_park)
      (>= (current-time) 780)                        ; meeting cannot start before John's start
      (<= (+ (current-time) 90) 1095)                ; meeting must end by John's end
      (not (met-john))                               ; don't double-schedule
    )
    :effect (and
      ;; record meeting start and end, advance current time by meeting duration
      (assign (meeting-start) (current-time))
      (assign (meeting-end) (+ (current-time) 90))
      (assign (current-time) (+ (current-time) 90))
      (met-john)
    )
  )

  ;; -----------------------------
  ;; Actions provided by feasibility_checker
  ;; (prefix fc- to keep them distinct)
  ;; Evaluate that the scheduled meeting satisfies John's availability and minimum duration.
  ;; If verified, increment the friends-met counter and mark feasible.
  ;; -----------------------------
  (:action fc-verify-john
    :parameters ()
    :precondition (and
      (met-john)
      (>= (meeting-start) 780)           ; meeting start >= John's start
      (<= (meeting-end) 1095)            ; meeting end <= John's end
      (>= (- (meeting-end) (meeting-start)) 90)  ; duration >= 90 min
      (not (feasible-john))
    )
    :effect (and
      (feasible-john)
      (assign (friends-met) (+ (friends-met) 1))
    )
  )

)