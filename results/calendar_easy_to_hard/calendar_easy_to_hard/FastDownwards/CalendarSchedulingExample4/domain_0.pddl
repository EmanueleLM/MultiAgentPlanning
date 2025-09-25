(define (domain multi-agent-meeting)
  (:requirements :strips)
  (:predicates
    (free ?agent ?slot)         ; agent is free at slot
    (all-free ?slot)            ; all agents are free at slot (computed in initial state)
    (earliest-slot ?slot)       ; slot is the earliest slot that is free for all (computed in initial state)
    (meeting-scheduled)         ; goal achieved
    (scheduled-at ?slot)        ; meeting scheduled at slot
  )

  ; Donna schedules the meeting (action kept distinct per-agent as required).
  (:action schedule-donna
    :parameters (?s)
    :precondition (and
                    (free donna ?s)
                    (free john ?s)
                    (free billy ?s)
                    (all-free ?s)
                    (earliest-slot ?s)
                  )
    :effect (and
              (meeting-scheduled)
              (scheduled-at ?s)
            )
  )

  ; John schedules the meeting (distinct action).
  (:action schedule-john
    :parameters (?s)
    :precondition (and
                    (free donna ?s)
                    (free john ?s)
                    (free billy ?s)
                    (all-free ?s)
                    (earliest-slot ?s)
                  )
    :effect (and
              (meeting-scheduled)
              (scheduled-at ?s)
            )
  )

  ; Billy schedules the meeting (distinct action).
  (:action schedule-billy
    :parameters (?s)
    :precondition (and
                    (free donna ?s)
                    (free john ?s)
                    (free billy ?s)
                    (all-free ?s)
                    (earliest-slot ?s)
                  )
    :effect (and
              (meeting-scheduled)
              (scheduled-at ?s)
            )
  )
)