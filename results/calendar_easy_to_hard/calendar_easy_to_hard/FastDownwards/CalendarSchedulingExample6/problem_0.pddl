(define (problem schedule-monday)
  (:domain multiagent-meeting)
  (:objects
    thomas dylan jerry - agent
    9_00 9_30 10_00 10_30 11_00 11_30 12_00 12_30 13_00 13_30 14_00 14_30 15_00 15_30 16_00 - time
  )

  (:init
    ;; participants
    (participant thomas)
    (participant dylan)
    (participant jerry)

    ;; Thomas: free for any 60-min start between 9:00 and 16:00 (work hours 9:00-17:00)
    (free thomas 9_00) (free thomas 9_30) (free thomas 10_00) (free thomas 10_30)
    (free thomas 11_00) (free thomas 11_30) (free thomas 12_00) (free thomas 12_30)
    (free thomas 13_00) (free thomas 13_30) (free thomas 14_00) (free thomas 14_30)
    (free thomas 15_00) (free thomas 15_30) (free thomas 16_00)

    ;; Dylan: unavailable 10:30-11:00 and 13:30-14:00
    ;; Therefore starts that would overlap those busy intervals are disallowed:
    ;; disallowed starts: 10:00,10:30 (overlap 10:30-11:00)
    ;; disallowed starts: 13:00,13:30 (overlap 13:30-14:00)
    ;; allowed starts (explicit):
    (free dylan 9_00) (free dylan 9_30)
    (free dylan 11_00) (free dylan 11_30) (free dylan 12_00) (free dylan 12_30)
    (free dylan 14_00) (free dylan 14_30) (free dylan 15_00) (free dylan 15_30) (free dylan 16_00)

    ;; Jerry: unavailable 9:00-11:00, 11:30-14:30, 16:00-17:00
    ;; Therefore valid 60-min start times that do not overlap these busy intervals:
    ;; Allowed starts: 14:30 and 15:00 (earliest available is 14:30)
    (free jerry 14_30) (free jerry 15_00)

    ;; Encode preference as a strict constraint: prefer / require the earliest feasible start.
    ;; From the combined availabilities the earliest feasible start is 14:30.
    (earliest 14_30)
  )

  ;; Goal: schedule the 60-min meeting (we require the earliest feasible start)
  (:goal (and
    (scheduled)
    (meeting-start 14_30)
  ))
)