(define (problem kenneth-day)
  (:domain kenneth-meetings)

  (:objects
    kenneth - agent
    fishermans-wharf nob-hill - location
    ; Timepoints used in the plan (minutes since midnight)
    t540  t855  t965  t1075  t1185  - time
    m1 m2 m3 - meeting
  )

  (:init
    ; Initial location and time: Kenneth at Fisherman's Wharf at 09:00 (540).
    (at kenneth fishermans-wharf t540)

    ; Succ110 links partitioning the availability window into three contiguous 110-minute meetings:
    ; 14:15 (855) -> 16:05 (965)  [110 mins]
    ; 16:05 (965) -> 17:55 (1075) [110 mins]
    ; 17:55 (1075) -> 19:45 (1185) [110 mins]
    (succ110 t855 t965)
    (succ110 t965 t1075)
    (succ110 t1075 t1185)

    ; Succ11 links for 11-minute travel increments (only the pairs needed here).
    ; We provide the specific 11-minute pairs that could be used if travel were chosen.
    ; (These pairs are available for travel actions; the plan below avoids travel to minimize movement.)
    (succ11 t540 t551)   ; example, not used in the enforced meeting schedule but allowed
    (succ11 t855 t866)   ; example link
    (succ11 t965 t976)
    (succ11 t1075 t1086)
    (succ11 t1185 t1196) ; outside horizon; included as placeholder pairs (won't be used)

    ; Enforce that meetings must occur in Kenneth's availability window:
    ; We encode this by constraining schedule actions to use the concrete times inside the window.
    ; (No separate predicate needed because schedule-meeting requires succ110 intervals and we only
    ; provide succ110 facts that lie within [14:15,19:45].)

    ; Note: No meetings are scheduled initially.
  )

  ; Goals:
  ; - All three meetings must be scheduled: m1 at [855,965), m2 at [965,1075), m3 at [1075,1185).
  ; - These times together exactly fill Kenneth's availability window (14:15 through 19:45).
  ; - Kenneth finishes at Fisherman's Wharf at 19:45 (t1185).
  (:goal
    (and
      (meeting-scheduled m1 fishermans-wharf t855 t965)
      (meeting-scheduled m2 fishermans-wharf t965 t1075)
      (meeting-scheduled m3 fishermans-wharf t1075 t1185)
      (at kenneth fishermans-wharf t1185)
    )
  )
)