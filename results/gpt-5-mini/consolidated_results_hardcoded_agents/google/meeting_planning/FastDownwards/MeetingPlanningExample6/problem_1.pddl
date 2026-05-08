(define (problem visit-kenneth)
  (:domain meeting-domain)

  (:objects
    visitor - agent
    fishermans-wharf nob-hill - location
    ; Timepoints (minutes since midnight)
    t540  t844  t855  t1185 - time
  )

  (:init
    ; Start: at Fisherman's Wharf at 09:00 (540)
    (at visitor fishermans-wharf t540)

    ; Allow waiting from 09:00 to 14:04 (304 minutes of idle time)
    (succ t540 t844)    ; 09:00 -> 14:04 (to allow departure just before Kenneth's window)

    ; Travel: 14:04 -> 14:15 is the 11-minute travel increment
    (succ t844 t855)    ; 14:04 -> 14:15 (11 minutes travel)

    ; Allowed meeting interval(s): must lie within Kenneth's availability [14:15 , 19:45]
    ; and be at least 90 minutes long. We provide the full-availability option here (330 minutes).
    (succ t855 t1185)   ; 14:15 -> 19:45 (330 minutes interval)
    (allowed-meeting t855 t1185)

    ; Notes:
    ; - By only providing allowed-meeting facts that are inside Kenneth's availability and
    ;   of at least 90 minutes duration, the domain enforces both the availability window
    ;   and the minimum meeting duration.
    ; - The travel succ facts (succ t844 t855) model the 11-minute travel time. The specific
    ;   waiting succ (t540->t844) models waiting/idle time until the chosen departure moment.
  )

  ;; Goal: ensure Kenneth is met at some allowed interval. The predicate met-kenneth
  ;; is set only by schedule-meeting-kenneth, which itself is only executable when the
  ;; agent is at Nob Hill at a start time for which an allowed-meeting exists.
  (:goal (met-kenneth))
)