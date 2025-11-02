(define (domain multiagent_meetings)
  (:requirements :strips :fluents :numeric-fluents)
  (:predicates
    (at_you_fd)
    (at_you_us)
    (at_joseph_us)
    (met_joseph)
  )
  (:functions
    (time)                 ; current time in minutes-since-midnight
    (meetings_count)       ; number of meetings completed (integer)
    (meeting_time_total)   ; accumulated meeting time in minutes (objective)
  )

  ; You travel FD -> US (takes 9 minutes)
  (:action you_travel_fd_to_us
    :precondition (and (at_you_fd))
    :effect (and
             (not (at_you_fd))
             (at_you_us)
             (increase (time) 9)
            )
  )

  ; You travel US -> FD (takes 9 minutes)
  (:action you_travel_us_to_fd
    :precondition (and (at_you_us))
    :effect (and
             (not (at_you_us))
             (at_you_fd)
             (increase (time) 9)
            )
  )

  ; You wait at FD until 1281 (21:21) so that departing then arrives at 1290.
  ; This is a domain-provided convenience action to move time forward to 1281.
  (:action you_wait_to_1281
    :precondition (and (at_you_fd) (<= (time) 1281))
    :effect (and
             (assign (time) 1281)
            )
  )

  ; You can also wait until 1290 (21:30) at any location (useful if you arrive earlier)
  (:action you_wait_to_1290
    :precondition (and (<= (time) 1290))
    :effect (and
             (assign (time) 1290)
            )
  )

  ; Joseph becomes present at US when current time is inside Joseph's window [1290,1320].
  ; This action does not advance time; it declares Joseph on-site once the time condition holds.
  (:action joseph_appear
    :precondition (and (>= (time) 1290) (<= (time) 1320))
    :effect (and
             (at_joseph_us)
            )
  )

  ; You meet Joseph for exactly 15 minutes.
  ; Must start at a time t in [1290,1305] so meeting ends <= 1320.
  (:action you_meet_joseph_15
    :precondition (and
                    (at_you_us)
                    (at_joseph_us)
                    (not (met_joseph))
                    (>= (time) 1290)
                    (<= (time) 1305)
                  )
    :effect (and
             (met_joseph)
             (increase (time) 15)
             (increase (meetings_count) 1)
             (increase (meeting_time_total) 15)
            )
  )

  ; You meet Joseph for 30 minutes (maximal fit in his 30-min window).
  ; Must start exactly at 1290 (constrained via >=1290 and <=1290)
  (:action you_meet_joseph_30
    :precondition (and
                    (at_you_us)
                    (at_joseph_us)
                    (not (met_joseph))
                    (>= (time) 1290)
                    (<= (time) 1290)
                  )
    :effect (and
             (met_joseph)
             (increase (time) 30)
             (increase (meetings_count) 1)
             (increase (meeting_time_total) 30)
            )
  )

  ;; Metric: maximize total meeting time (encourages meeting Joseph for as long as feasible;
  ;; meeting count is also incremented by meeting actions)
  (:metric maximize (meeting_time_total))
)