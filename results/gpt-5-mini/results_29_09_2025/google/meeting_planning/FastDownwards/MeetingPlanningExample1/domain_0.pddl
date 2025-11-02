(define (domain multiagent-meeting)
  ;; Multi-agent meeting domain for Fast Downward
  ;; Agents: you, betty
  ;; Locations: richmond-district, financial-district
  ;; Numeric fluent current-time is clock in minutes since midnight.
  ;; Numeric fluent met-time ?a ?b accumulates meeting minutes between two agents.
  (:requirements :typing :durative-actions :durative-conditions :negative-preconditions :numeric-fluents :duration-inequalities)
  (:types agent location)

  (:predicates
    (at ?ag - agent ?loc - location)          ;; agent location
    (met ?a - agent ?b - agent)               ;; boolean that agents have met (set at end of meeting)
  )

  (:functions
    (current-time)                            ;; global clock in minutes since midnight
    (met-time ?a - agent ?b - agent)         ;; accumulated meeting minutes between two agents
  )

  ;; Travel from Richmond District to Financial District (22 minutes)
  (:durative-action travel-richmond-to-financial
    :parameters (?ag - agent)
    :duration (= ?duration 22)
    :condition (and
                 ;; must be at Richmond at start of travel
                 (at start (at ?ag richmond-district))
                )
    :effect (and
             ;; leave Richmond at start
             (at start (not (at ?ag richmond-district)))
             ;; arrive Financial at end
             (at end (at ?ag financial-district))
             ;; advance global clock by travel time
             (at end (increase (current-time) ?duration))
            )
  )

  ;; Travel from Financial District to Richmond District (21 minutes)
  (:durative-action travel-financial-to-richmond
    :parameters (?ag - agent)
    :duration (= ?duration 21)
    :condition (and
                 (at start (at ?ag financial-district))
                )
    :effect (and
             (at start (not (at ?ag financial-district)))
             (at end (at ?ag richmond-district))
             (at end (increase (current-time) ?duration))
            )
  )

  ;; Meeting action between two agents at Financial District.
  ;; Hard constraints encoded:
  ;; - Meeting must start no earlier than Betty's availability window start (17:15 = 1035 minutes).
  ;; - Meeting must finish no later than Betty's availability window end (21:45 = 1305 minutes).
  ;; - Meeting duration must be at least 60 minutes (duration inequality).
  ;; The meeting increases the shared met-time fluent by the chosen duration.
  (:durative-action meet-at-financial
    :parameters (?a - agent ?b - agent)
    ;; minimum meeting duration is 60 minutes (agent can allocate at least 60)
    :duration (>= ?duration 60)
    :condition (and
                 ;; both agents must be at Financial District at meeting start
                 (at start (at ?a financial-district))
                 (at start (at ?b financial-district))
                 ;; meeting must start within Betty's availability:
                 ;; start time >= 1035 (17:15)
                 (at start (>= (current-time) 1035))
                 ;; meeting must end within Betty's availability:
                 ;; start_time + duration <= 1305  (ensured at start using ?duration)
                 (at start (<= (+ (current-time) ?duration) 1305))
                )
    :effect (and
             ;; record that they have met (set at end)
             (at end (met ?a ?b))
             ;; accumulate meeting minutes for both directions (useful for numeric goal)
             (at end (increase (met-time ?a ?b) ?duration))
             (at end (increase (met-time ?b ?a) ?duration))
             ;; advance global clock by meeting duration
             (at end (increase (current-time) ?duration))
            )
  )
)