(define (domain meetup-day)
  (:requirements :strips :negative-preconditions :typing :fluents :numeric-fluents :adl)
  (:types location agent)

  (:predicates
    (at ?a - agent ?l - location)
    (met-george)           ; true if visitor has already met George
    (done)                 ; end-of-day marker for goal
  )

  (:functions
    (time)                 ; current time in minutes since midnight
    (total-cost)           ; aggregated metric to minimize (combines goals)
    (meetings-count)       ; number of distinct meetings performed
    (total-travel-time)    ; sum of travel minutes taken
    (total-meeting-time)   ; sum of meeting minutes
  )

  ;; Travel actions for the visitor (you). Actions are distinct by actor prefix.
  (:action you-travel-nb->ha
    :parameters ()
    :precondition (and
      (at you northbeach)
    )
    :effect (and
      (not (at you northbeach))
      (at you haight)
      (increase (time) 18)
      (increase (total-travel-time) 18)
      ;; Travel adds to cost (we minimize total-cost), so positive travel time increases cost.
      (increase (total-cost) 18)
    )
  )

  (:action you-travel-ha->nb
    :parameters ()
    :precondition (and
      (at you haight)
    )
    :effect (and
      (not (at you haight))
      (at you northbeach)
      (increase (time) 19)
      (increase (total-travel-time) 19)
      (increase (total-cost) 19)
    )
  )

  ;; Meeting action with George at Haight-Ashbury.
  ;; Parameter ?d is meeting duration in minutes (integer). Constraints:
  ;;   - visitor must be at Haight-Ashbury
  ;;   - meeting must not have happened before (one meeting max with George)
  ;;   - meeting duration must be at least 45 minutes
  ;;   - meeting must start no earlier than George arrival (07:30 = 450)
  ;;   - meeting must finish no later than George departure (13:15 = 795)
  (:action you-meet-george
    :parameters (?d)
    :precondition (and
      (at you haight)
      (not (met-george))
      ;; meeting duration at least minimum required
      (>= ?d 45)
      ;; George presence window: start >= 450 and end <= 795
      (>= (time) 450)
      (<= (+ (time) ?d) 795)
    )
    :effect (and
      (met-george)
      (increase (time) ?d)
      (increase (meetings-count) 1)
      (increase (total-meeting-time) ?d)
      ;; To implement the multi-criteria objective:
      ;;  - primary: maximize meetings -> give a large negative reward per meeting
      ;;  - secondary: maximize total meeting time -> give a negative reward proportional to meeting minutes
      ;;  - tertiary: minimize travel time -> travel actions add positive cost per minute
      ;; Here we decrease total-cost by a large constant per meeting and by meeting minutes.
      (increase (total-cost) -10000)
      (increase (total-cost) (- ?d))
    )
  )

  ;; End-day action to allow the planner to finish the plan at any time.
  (:action end-day
    :parameters ()
    :precondition ()
    :effect (and
      (done)
    )
  )
)