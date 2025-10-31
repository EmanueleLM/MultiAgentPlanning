(define (domain integrated-travelers)
  (:requirements :strips :typing :fluents :numeric-fluents :adl)
  (:types person location)

  (:predicates
    (at ?p - person ?l - location)
    (met-betty)
  )

  (:functions
    (now)          ; current time in minutes since midnight
    (betty-start)  ; Betty availability window start (minutes since midnight)
    (betty-end)    ; Betty availability window end (minutes since midnight)
  )

  ;; ----------------------------
  ;; Actions from Agent 1 (prefix a1_)
  ;; ----------------------------

  ;; Agent1: Travel from Marina to Richmond (11 minutes)
  (:action a1_travel-marina-to-richmond
    :parameters ()
    :precondition (at traveler marina)
    :effect (and
              (not (at traveler marina))
              (at traveler richmond)
              (increase (now) 11)
            )
  )

  ;; Agent1: Travel from Richmond to Marina (9 minutes)
  (:action a1_travel-richmond-to-marina
    :parameters ()
    :precondition (at traveler richmond)
    :effect (and
              (not (at traveler richmond))
              (at traveler marina)
              (increase (now) 9)
            )
  )

  ;; Agent1: Wait until Betty's availability window start.
  ;; Applicable only if current time is <= betty-start.
  (:action a1_wait-until-betty-start
    :parameters ()
    :precondition (<= (now) (betty-start))
    :effect (and
              (assign (now) (betty-start))
            )
  )

  ;; Agent1: Atomic meeting action consuming 75 minutes.
  ;; Ensures the meeting starts no earlier than betty-start and
  ;; finishes no later than betty-end.
  (:action a1_meet-betty
    :parameters ()
    :precondition (and
                    (at traveler richmond)
                    (>= (now) (betty-start))
                    (<= (+ (now) 75) (betty-end))
                  )
    :effect (and
              (met-betty)
              (increase (now) 75)
            )
  )

  ;; ----------------------------
  ;; Actions from Agent 2 (prefix a2_)
  ;; ----------------------------

  ;; Agent2: Travel from Marina to Richmond (11 minutes)
  (:action a2_travel-m2r
    :parameters ()
    :precondition (at traveler marina)
    :effect (and
              (not (at traveler marina))
              (at traveler richmond)
              (increase (now) 11)
            )
  )

  ;; Agent2: Travel from Richmond to Marina (9 minutes)
  (:action a2_travel-r2m
    :parameters ()
    :precondition (at traveler richmond)
    :effect (and
              (not (at traveler richmond))
              (at traveler marina)
              (increase (now) 9)
            )
  )

  ;; Agent2: Atomic meeting action consuming 75 minutes.
  ;; Same temporal constraints as agent1's meeting action.
  (:action a2_meet-with-betty
    :parameters ()
    :precondition (and
                    (at traveler richmond)
                    (>= (now) (betty-start))
                    (<= (+ (now) 75) (betty-end))
                  )
    :effect (and
              (met-betty)
              (increase (now) 75)
            )
  )
)